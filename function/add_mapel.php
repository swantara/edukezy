<?php
$nama = $_POST['nama'];
$tingkat = $_POST['tingkat'];
include 'connection.php';
$query = mysql_query("INSERT INTO
		tb_mapel(nama, tingkat_pendidikan)
	VALUES ('$nama', '$tingkat')");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../mapel.php';</script>";
}
?>