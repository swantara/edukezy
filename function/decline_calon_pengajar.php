<?php
	$id_param = $_GET["id"];
	include 'connection.php';
	$query = "update tb_users set status = 2 where id = $id_param";
	mysql_query($query);
	if($query == true){
		echo "<script>alert('Data berhasil disimpan.');</script>";
		echo "<script>location.href='../calon_pengajar.php';</script>";
	}
?>