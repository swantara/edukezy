<?php
$id = $_GET['id'];
include 'connection.php';
$query = mysql_query("DELETE
FROM
  tb_cabang
WHERE
  id = $id");

if ($query) {
    echo "<script>alert('Data berhasil dihapus.');</script>";
    echo "<script>location.href='../kelola_cabang.php';</script>";
}
else {
    echo mysql_error();
}
?>