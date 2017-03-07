<?php
	$id_param = $_GET["id"];
	include 'connection.php';
	$query = mysql_query("UPDATE tb_pembayaran SET pembayaran_status = 2 where id = $id_param");
	
	if($query){
		echo "<script>alert('Data berhasil disimpan.');</script>";
		echo "<script>location.href='../invoice.php';</script>";
	}
?>