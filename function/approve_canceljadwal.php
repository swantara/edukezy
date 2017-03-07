<?php
session_start();
include 'connection.php';
include 'OneSignal.php';

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
                    dj.jadwal_id, dj.pertemuan, dj.tgl_pertemuan AS old_tgl_pertemuan, dj.waktu_mulai AS old_waktu_mulai, dj.tempat AS old_tempat,
                    dj.pertemuan, dj.pengajar_id AS old_pengajar_id, dj.waktu_selesai AS old_waktu_selesai, dj.created_at AS old_created_at, dj.updated_at AS old_updated_at,
                    j.mapel_id,
                    pk.durasi
                FROM tb_request AS r
                JOIN tb_detail_jadwal AS dj ON dj.id = r.dt_jadwal_id
                JOIN tb_jadwal AS j ON j.id = dj.jadwal_id
                JOIN tb_paket AS pk ON pk.id = j.paket_id
                WHERE type = "CC" AND r.id="'.$id_req.'"';
$rReq = mysql_query($qReq) or die(mysql_error());
$rReq = mysql_fetch_array($rReq);

$archive = mysql_query('INSERT INTO tb_archive_jadwal
(dt_jadwal_id,jadwal_id,pengajar_id,pertemuan,tgl_pertemuan,waktu_mulai,waktu_selesai,tempat,created_at,updated_at)
VALUES ("'.$rReq['dt_jadwal_id'].'","'.$rReq['jadwal_id'].'","'.$rReq['old_pengajar_id'].'","'.$rReq['pertemuan'].'","'.$rReq['old_tgl_pertemuan'].'","'.$rReq['old_waktu_mulai'].'","'.$rReq['old_waktu_selesai'].'","'.$rReq['old_tempat'].'","'.$rReq['old_created_at'].'","'.$rReq['old_updated_at'].'")');
$delete_jadwal = mysql_query('DELETE FROM tb_detail_jadwal WHERE id="'.$rReq['dt_jadwal_id'].'"');

mysql_query("UPDATE tb_request SET status = '1' WHERE id='".$rReq['id']."'");
if($rReq['request_by']=='SISWA'){
    $sNotif = findNotif("SISWA",$rReq['siswa_id']);
    $onesignal = new OneSignal();
    $onesignal->app_type = 1;
    $onesignal->title = "Edukezy";
    $onesignal->message = "Permintaan pembatalan jadwal les anda telah diterima.";
    $onesignal->sendMessageTo([$sNotif]);

    $pNotif = findNotif("PENGAJAR",$rReq['pengajar_id']);
    $onesignal = new OneSignal();
    $onesignal->app_type = 2;
    $onesignal->title = "Edukezy Teacher";
    $onesignal->message = "Ada pembatalan pada jadwal les anda.";
    $onesignal->sendMessageTo([$pNotif]);
}
if($rReq['request_by']=='PENGAJAR'){
    $sNotif = findNotif("SISWA",$rReq['siswa_id']);
    $onesignal = new OneSignal();
    $onesignal->app_type = 1;
    $onesignal->title = "Edukezy";
    $onesignal->message = "Ada pembatalan pada jadwal les anda.";
    $onesignal->sendMessageTo([$sNotif]);

    $pNotif = findNotif("PENGAJAR",$rReq['pengajar_id']);
    $onesignal = new OneSignal();
    $onesignal->app_type = 2;
    $onesignal->title = "Edukezy Teacher";
    $onesignal->message = "Permintaan pembatalan jadwal les anda telah diterima.";
    $onesignal->sendMessageTo([$pNotif]);
}


$_SESSION['success'] = "Permintaan pembatalan jadwal berhasil diterima.";
echo '<meta http-equiv="refresh" content="0; url=../canceljadwal.php" />';