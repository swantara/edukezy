<?php
session_start();
include 'connection.php';
include 'OneSignal.php';
function cekJadwalBentrok($tgl,$waktu_mulai,$waktu_selesai,$id,$type)
{
    $timestamp1 = strtotime($waktu_mulai) - 60*90;
    $timestamp2 = strtotime($waktu_selesai) + 60*90;

    $waktu_mulai = date('H:i:s', $timestamp1);
    $waktu_selesai = date('H:i:s', $timestamp2);

    if($type="SISWA"){
        $model = 'SELECT
                        dj.*,j.status
                    FROM tb_detail_jadwal AS dj
                    JOIN tb_jadwal AS j ON dj.jadwal_id = j.id
                    WHERE
                        j.status = 1 AND
                        j.siswa_id = "'.$id.'" AND
                        dj.tgl_pertemuan = "'.$tgl.'" AND
                        waktu_mulai>"'.$waktu_mulai.'" AND
                        waktu_selesai<"'.$waktu_selesai.'"';
    }
    if($type="PENGAJAR"){
        $model = 'SELECT
                        dj.*,j.status
                    FROM tb_detail_jadwal AS dj
                    JOIN tb_jadwal AS j ON dj.jadwal_id = j.id
                    WHERE
                        j.status = 1 AND
                        dj.pengajar_id = "'.$id.'" AND
                        dj.tgl_pertemuan = "'.$tgl.'" AND
                        waktu_mulai>"'.$waktu_mulai.'" AND
                        waktu_selesai<"'.$waktu_selesai.'"';
    }
    $query = mysql_query($model);

    return mysql_num_rows($query);
}

function findNotif($type,$id){
    if($type == "SISWA"){
        $user = mysql_fetch_array(mysql_query("SELECT s.user_id,n.onesignal_id FROM tb_siswa AS s JOIN tb_notif AS n ON n.user_id = s.user_id WHERE s.id='$id'"));
    }
    if($type == "PENGAJAR"){
        $user = mysql_fetch_array(mysql_query("SELECT p.user_id,n.onesignal_id FROM tb_pengajar AS p JOIN tb_notif AS n ON n.user_id = p.user_id WHERE p.id='$id'"));
    }
    $notif = $user['onesignal_id'];

    return $notif;
}

$id_req = $_GET['id'];
$qReq = 'SELECT
                    r.*,
                    dj.jadwal_id, dj.tgl_pertemuan AS old_tgl_pertemuan, dj.waktu_mulai AS old_waktu_mulai, dj.tempat AS old_tempat, dj.pertemuan,
                    j.mapel_id,
                    pk.durasi
                FROM tb_request AS r
                JOIN tb_detail_jadwal AS dj ON dj.id = r.dt_jadwal_id
                JOIN tb_jadwal AS j ON j.id = dj.jadwal_id
                JOIN tb_paket AS pk ON pk.id = j.paket_id
                WHERE type = "RS" AND r.id="'.$id_req.'"';
$rReq = mysql_query($qReq) or die(mysql_error());
$rReq = mysql_fetch_array($rReq);

$timestamp = strtotime($rReq['jam_pertemuan']) + 60*$rReq['durasi'];
$waktu_selesai = date('H:i:s', $timestamp);

$siswaCek = cekJadwalBentrok($rReq['tgl_pertemuan'],$rReq['jam_pertemuan'],$waktu_selesai,$rReq['siswa_id'],"SISWA");
$pengajarCek = cekJadwalBentrok($rReq['tgl_pertemuan'],$rReq['jam_pertemuan'],$waktu_selesai,$rReq['pengajar_id'],"PENGAJAR");

if($siswaCek == 0 && $pengajarCek == 0){

    $update = mysql_query('UPDATE tb_detail_jadwal SET tgl_pertemuan="'.$rReq['tgl_pertemuan'].'", waktu_mulai="'.$rReq['jam_pertemuan'].'", waktu_selesai="'.$waktu_selesai.'", tempat="'.$rReq['tempat'].'" WHERE id="'.$rReq['dt_jadwal_id'].'"');

    if($update){

        mysql_query("UPDATE tb_request SET status = '1' WHERE id='".$rReq['id']."'");
        if($rReq['request_by']=='SISWA'){
            $sNotif = findNotif("SISWA",$rReq['siswa_id']);
            $onesignal = new OneSignal();
            $onesignal->app_type = 1;
            $onesignal->title = "Edukezy";
            $onesignal->message = "Permintaan perubahan jadwal les anda telah diterima.";
            $onesignal->sendMessageTo([$sNotif]);

            $pNotif = findNotif("PENGAJAR",$rReq['pengajar_id']);
            $onesignal = new OneSignal();
            $onesignal->app_type = 2;
            $onesignal->title = "Edukezy Teacher";
            $onesignal->message = "Ada perubahan pada jadwal les anda.";
            $onesignal->sendMessageTo([$pNotif]);
        }
        if($rReq['request_by']=='PENGAJAR'){
            $sNotif = findNotif("SISWA",$rReq['siswa_id']);
            $onesignal = new OneSignal();
            $onesignal->app_type = 1;
            $onesignal->title = "Edukezy";
            $onesignal->message = "Ada perubahan pada jadwal les anda.";
            $onesignal->sendMessageTo([$sNotif]);

            $pNotif = findNotif("PENGAJAR",$rReq['pengajar_id']);
            $onesignal = new OneSignal();
            $onesignal->app_type = 2;
            $onesignal->title = "Edukezy Teacher";
            $onesignal->message = "Permintaan perubahan jadwal les anda telah diterima.";
            $onesignal->sendMessageTo([$pNotif]);
        }


        $_SESSION['success'] = "Permintaan rubah jadwal berhasil diterima.";
        echo '<meta http-equiv="refresh" content="0; url=../reschedule.php" />';
    }
}else{
    $_SESSION['error'] = "Permintaan rubah jadwal gagal diterima. Jadwal yang diminta tidak tersedia.";
    echo '<meta http-equiv="refresh" content="0; url=../reschedule.php" />';
}

