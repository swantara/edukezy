<?php
$nama = $_POST['nama'];
$biaya = $_POST['biaya'];
$deskripsi = $_POST['deskripsi'];
include 'connection.php';
$query = mysql_query("INSERT INTO
		tb_program(nama, biaya, desk)
	VALUES ('$nama', '$biaya', '$deskripsi')");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../program.php';</script>";
}
?>