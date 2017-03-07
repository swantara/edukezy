<?php
$id = $_GET['id'];
include 'connection.php';
$query = "SELECT 
  u.*,
  p.id AS id_pengajar
FROM 
  tb_users AS u
  JOIN tb_pengajar AS p ON p.user_id = u.id
WHERE
  p.id=$id";
$result = mysql_query($query) or die(mysql_error());
$rowcount = mysql_num_rows($result);
if($rowcount > 0) {
    while ($row = mysql_fetch_array($result)) {
        $id_user = $row['id'];
        $id_pengajar = $row['id_pengajar'];
    }
}

if($query){
    $query = mysql_query("DELETE
    FROM
      tb_users
    WHERE
      id = $id_user");

    if($query) {
        $query = mysql_query("DELETE
        FROM
          tb_pengajar
        WHERE
          id = $id_pengajar");

        if ($query) {
            echo "<script>alert('Data berhasil dihapus.');</script>";
            echo "<script>location.href='../user_pengajar.php';</script>";
        } else {
            echo mysql_error();
        }
    }
}
?>