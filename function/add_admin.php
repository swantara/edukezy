<?php
	$nama = $_POST['nama'];
	$telp = $_POST['telepon'];
	$email = $_POST['email'];
	$alamat = $_POST['alamat'];
	$pass = md5($_POST['password']);
	include 'connection.php';
	$query = mysql_query("INSERT INTO
		tb_users(email, password, status, type)
	VALUES ('$email', '$pass', '1', 'AD')");
	
	if($query){
		$query = "SELECT *
        FROM 
          tb_users AS u
        WHERE
          u.email = '$email'";

        $result = mysql_query($query) or die(mysql_error());
        $rowcount = mysql_num_rows($result);

        if($rowcount > 0){
          while($row = mysql_fetch_array($result)){
          	$id_param = $row['user_id'];
        }
    	}
            
		$query = mysql_query("INSERT INTO
			tb_admin(admin_id, fullname, admin_alamat, admin_cp)
		VALUES ('$id_param', '$nama', '$alamat', '$telp')");

		if($query){
			echo "<script>alert('Data berhasil disimpan.');</script>";
			echo "<script>location.href='../user_admin.php';</script>";
		}
	}
?>