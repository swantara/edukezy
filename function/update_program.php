<?php
$id_param = $_POST['id'];
$nama = $_POST['nama'];
$biaya = $_POST['biaya'];
$deskripsi = $_POST['deskripsi'];
include 'connection.php';
$query = mysql_query("UPDATE
		tb_program
	SET nama = '$nama', biaya = '$biaya', desk = '$deskripsi', updated_at = NOW()
	WHERE id=$id_param");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../program.php';</script>";
}
?>