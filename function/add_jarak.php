<?php
$jarak = $_POST['jarak'];
$biaya = $_POST['biaya'];
include 'connection.php';
$query = mysql_query("INSERT INTO
		tb_jarak(jarak, biaya)
	VALUES ('$jarak', '$biaya')");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../program.php';</script>";
}
?>