<?php
$id = $_GET['id'];
include 'connection.php';
$query = "SELECT 
  u.*,
  o.id AS id_owner
FROM 
  tb_users AS u
  JOIN tb_owner AS o ON o.owner_id = u.id
WHERE
  o.id=$id";
$result = mysql_query($query) or die(mysql_error());
$rowcount = mysql_num_rows($result);
if($rowcount > 0) {
    while ($row = mysql_fetch_array($result)) {
        $id_user = $row['id'];
        $id_owner = $row['id_owner'];
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
          tb_owner
        WHERE
          id = $id_owner");

        if ($query) {
            echo "<script>alert('Data berhasil dihapus.');</script>";
            echo "<script>location.href='../user_owner.php';</script>";
        } else {
            echo mysql_error();
        }
    }
}
?>