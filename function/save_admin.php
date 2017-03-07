<?php
	$id_param = $_GET['id'];
	$nama = $_POST['namaAdmin'];
	$telp = $_POST['telp'];
	$alamat = $_POST['alamatAdmin'];
	$foto = $_POST['fotoProfil'];
	include 'connection.php';

	$query = mysql_query("UPDATE
		tb_admin
	SET fullname = '$nama', admin_alamat = '$alamat', admin_cp = '$telp', updated_at = NOW()
	WHERE id=$id_param");
	
	if($query){
		echo "<script>alert('Data berhasil disimpan.');</script>";
		echo "<script>location.href='../index.php';</script>";
	}
?>