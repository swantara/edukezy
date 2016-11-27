<?php
$id_param = $_POST['id'];
$jarak = $_POST['jarak'];
$biaya = $_POST['biaya'];
include 'connection.php';
$query = mysql_query("UPDATE
		tb_jarak
	SET jarak = '$jarak', biaya = '$biaya', updated_at = NOW()
	WHERE id=$id_param");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../program.php';</script>";
}
?>