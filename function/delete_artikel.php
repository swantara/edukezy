<?php
$id = $_GET['id'];
include 'connection.php';
$query = mysql_query("DELETE
FROM
  tb_artikel
WHERE
  id = $id");

if ($query) {
    echo "<script>alert('Data berhasil dihapus.');</script>";
    echo "<script>location.href='../artikel.php';</script>";
}
else {
    echo mysql_error();
}
?>