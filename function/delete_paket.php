<?php
$id = $_GET['id'];
include 'connection.php';
$query = "SELECT 
  p.*
FROM 
  tb_paket AS p
WHERE
  p.id=$id";
$result = mysql_query($query);
$rowcount = mysql_num_rows($result);
if($rowcount > 0) {
    while ($row = mysql_fetch_array($result)) {
        $id_paket = $row['id'];
        $id_tarif = $row['tarif_id'];
    }
}

if($query){
    $query = mysql_query("DELETE
    FROM
      tb_paket
    WHERE
      id = $id_paket");

    if($query) {
        $query = mysql_query("DELETE
        FROM
          tb_tarif
        WHERE
          id = $id_tarif");

        if ($query) {
            echo "<script>alert('Data berhasil dihapus.');</script>";
            echo "<script>location.href='../program.php';</script>";
        }
    }
}
?>