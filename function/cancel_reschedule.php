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
$queryReq = 'SELECT
            r.*,
            dj.jadwal_id, dj.tgl_pertemuan AS old_tgl_pertemuan, dj.waktu_mulai AS old_waktu_mulai, dj.tempat AS old_tempat, dj.pertemuan,
            j.mapel_id,
            pk.durasi
        FROM tb_request AS r
        JOIN tb_detail_jadwal AS dj ON dj.id = r.dt_jadwal_id
        JOIN tb_jadwal AS j ON j.id = dj.jadwal_id
        JOIN tb_paket AS pk ON pk.id = j.paket_id
        WHERE type = "RS" AND r.id="'.$id_req.'"';
$rReq= mysql_fetch_array(mysql_query($queryReq));

mysql_query("UPDATE tb_request SET status = '0' WHERE id='".$rReq['id']."'");
if($rReq['request_by']=='SISWA'){
    $sNotif = findNotif("SISWA",$rReq['siswa_id']);
    $onesignal = new OneSignal();
    $onesignal->app_type = 1;
    $onesignal->title = "Edukezy";
    $onesignal->message = "Permintaan rubah jadwal les anda telah dibatalkan.";
    $onesignal->sendMessageTo([$sNotif]);
}
if($rReq['request_by']=='PENGAJAR'){
    $pNotif = findNotif("PENGAJAR",$rReq['pengajar_id']);
    $onesignal = new OneSignal();
    $onesignal->app_type = 2;
    $onesignal->title = "Edukezy Teacher";
    $onesignal->message = "Permintaan rubah jadwal les anda telah dibatalkan.";
    $onesignal->sendMessageTo([$pNotif]);
}
$_SESSION['success'] = "Permintaan pembatalan jadwal berhasil dibatalkan.";
echo '<meta http-equiv="refresh" content="0; url=../reschedule.php" />';