<?php
$id_param = $_GET['id'];
$nama = $_POST['nama'];
$telp = $_POST['telp'];
$alamat = $_POST['alamat'];
$password = $_POST['password'];
include 'connection.php';

if(is_null($password)){
	$query = mysql_query("UPDATE
		tb_owner
	SET fullname = '$nama', owner_alamat = '$alamat', owner_cp = '$telp', updated_at = NOW()
	WHERE id=$id_param");

	if($query){
    	echo "<script>alert('Data berhasil disimpan.');</script>";
    	echo "<script>location.href='../index.php';</script>";
	}
}

else{
	$password = md5($_POST['password']);
	$query = mysql_query("UPDATE
		tb_owner
	SET fullname = '$nama', owner_alamat = '$alamat', owner_cp = '$telp', updated_at = NOW()
	WHERE id=$id_param");

	if($query){

		$query = "SELECT 
			o.*,
			u.id AS user_id
		FROM 
			tb_owner AS o
		JOIN tb_users AS u ON u.id = o.owner_id                
		WHERE
			o.id=$id_param";

        $result = mysql_query($query) or die(mysql_error());
        $rowcount = mysql_num_rows($result);

        if($rowcount > 0){
          	while($row = mysql_fetch_array($result)){
          		$id_param = $row['user_id'];
        	}
    	}

		$query = mysql_query("UPDATE
			tb_users
		SET password = '$password', updated_at = NOW()
		WHERE id=$id_param");

		if($query){
    		echo "<script>alert('Data berhasil disimpan.');</script>";
    		echo "<script>location.href='../index.php';</script>";
		}
	}
}

?>