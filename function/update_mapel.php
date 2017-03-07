<?php
$id_param = $_POST['id'];
$nama = $_POST['nama'];
$tingkat = $_POST['tingkat'];
include 'connection.php';
$query = mysql_query("UPDATE
		tb_mapel
	SET nama = '$nama', tingkat_pendidikan = '$tingkat', updated_at = NOW()
	WHERE id=$id_param");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../mapel.php';</script>";
}
?>