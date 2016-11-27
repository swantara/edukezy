<?php
  $id_param = 7;
  include '../function/connection.php';
  $query = "SELECT
    p.*, 
    u.email
  FROM tb_pengajar AS p 
  JOIN tb_users AS u ON u.id=p.user_id
  WHERE p. id = $id_param";
  $result = mysql_query($query) or die(mysql_error());

  $rowcount = mysql_num_rows($result);

  if($rowcount > 0){
    while($row = mysql_fetch_array($result)){
      if($row['photo']==NULL){
        echo "null";
      }
      else{
        echo $IMG_PENGAJAR . $row['photo'];
      }
    }
  }
?> 