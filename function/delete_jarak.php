<?php
$id = $_GET['id'];
include 'connection.php';
$query = mysql_query("DELETE
FROM
  tb_jarak
WHERE
  id = $id");

if ($query) {
    echo "<script>alert('Data berhasil dihapus.');</script>";
    echo "<script>location.href='../program.php';</script>";
}
else {
    echo mysql_error();
}
?>