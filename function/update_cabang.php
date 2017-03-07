<?php
$id_param = $_POST['id'];
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$longitude = $_POST['longitude'];
$latitude = $_POST['latitude'];
include 'connection.php';
$query = mysql_query("UPDATE
		tb_cabang
	SET nama = '$nama', alamat = '$alamat', logitude = '$longitude', latitude = '$latitude', updated_at = NOW()
	WHERE id=$id_param");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../kelola_cabang.php';</script>";
}
?>