<?php
$id_param = $_GET['id'];
$nama = $_POST['namaAdmin'];
$telp = $_POST['telp'];
$alamat = $_POST['alamatAdmin'];
$password = $_POST['password'];
include 'connection.php';

if(is_null($password)){
	$query = mysql_query("UPDATE
		tb_admin
	SET fullname = '$nama', admin_alamat = '$alamat', admin_cp = '$telp', updated_at = NOW()
	WHERE id=$id_param");

	if($query){
    	echo "<script>alert('Data berhasil disimpan.');</script>";
    	echo "<script>location.href='../index.php';</script>";
	}
}

else{
	$password = md5($_POST['password']);
	$query = mysql_query("UPDATE
		tb_admin
	SET fullname = '$nama', admin_alamat = '$alamat', admin_cp = '$telp', updated_at = NOW()
	WHERE id=$id_param");

	if($query){

		$query = "SELECT 
			a.*,
			u.id AS user_id
		FROM 
			tb_admin AS a
		JOIN tb_users AS u ON u.id = a.admin_id                
		WHERE
			a.id=$id_param";

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