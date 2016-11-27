<?php
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$longitude = $_POST['longitude'];
$latitude = $_POST['latitude'];
include 'connection.php';
$query = mysql_query("INSERT INTO
		tb_cabang(nama, alamat, logitude, latitude)
	VALUES ('$nama', '$alamat', '$longitude', '$latitude')");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../kelola_cabang.php';</script>";
}
?>