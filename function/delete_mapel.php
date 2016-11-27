<?php
$id = $_GET['id'];
include 'connection.php';
$query = "SELECT 
  m.*,
  mp.id AS id_mapel
FROM 
  tb_mapel AS m
  LEFT JOIN tb_mapel_pengajar AS mp ON mp.mapel_id = m.id
WHERE
  m.id=$id";
$result = mysql_query($query) or die(mysql_error());
$rowcount = mysql_num_rows($result);
if($rowcount > 0) {
    while ($row = mysql_fetch_array($result)) {
        $id_m = $row['id'];
    }
}

if($query){
    $query = mysql_query("DELETE
    FROM
      tb_mapel
    WHERE
      id = $id_m");

    if($query) {
        $query = mysql_query("DELETE
        FROM
          tb_mapel_pengajar
        WHERE
          mapel_id = $id_m");

        if ($query) {
            echo "<script>alert('Data berhasil dihapus.');</script>";
            echo "<script>location.href='../mapel.php';</script>";
        } else {
            echo mysql_error();
        }
    }
}
?>