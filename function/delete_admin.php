<?php
$id = $_GET['id'];
include 'connection.php';
$query = "SELECT 
  u.*,
  a.id AS id_admin
FROM 
  tb_users AS u
  JOIN tb_admin AS a ON a.admin_id = u.id
WHERE
  a.id=$id";
$result = mysql_query($query) or die(mysql_error());
$rowcount = mysql_num_rows($result);
if($rowcount > 0) {
    while ($row = mysql_fetch_array($result)) {
        $id_user = $row['id'];
        $id_admin = $row['id_admin'];
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
          tb_admin
        WHERE
          id = $id_admin");

        if ($query) {
            echo "<script>alert('Data berhasil dihapus.');</script>";
            echo "<script>location.href='../user_admin.php';</script>";
        } else {
            echo mysql_error();
        }
    }
}
?>