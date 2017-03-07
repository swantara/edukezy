<?php
$id = $_GET['id'];
include 'connection.php';
$query = "SELECT 
  u.*,
  s.id AS id_siswa
FROM 
  tb_users AS u
  JOIN tb_siswa AS s ON s.user_id = u.id
WHERE
  s.id=$id";
$result = mysql_query($query) or die(mysql_error());
$rowcount = mysql_num_rows($result);
if($rowcount > 0) {
    while ($row = mysql_fetch_array($result)) {
        $id_user = $row['id'];
        $id_siswa = $row['id_siswa'];
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
          tb_siswa
        WHERE
          id = $id_siswa");

        if ($query) {
            echo "<script>alert('Data berhasil dihapus.');</script>";
            echo "<script>location.href='../confirm_email.php';</script>";
        } else {
            echo mysql_error();
        }
    }
}
?>