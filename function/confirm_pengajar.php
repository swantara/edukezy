<?php
	$id_param = $_GET["id"];
	include 'connection.php';
	$query = mysql_query("update tb_users set status = 1 where id = $id_param");
	
	if($query){
		echo "<script>alert('Data berhasil disimpan.');</script>";
		echo "<script>location.href='../confirm_email.php';</script>";
	}
?>