<?php
	$default_password = md5("1234");
	$input_password = md5($_POST["password"]);

	include 'connection.php';
	$query = "SELECT u.*
	FROM tb_users AS u
	WHERE u.id='283'";
	$result = mysql_query($query);
	$rowcount = mysql_num_rows($result);
	if($rowcount > 0){
		while($row = mysql_fetch_array($result)){
			$right_password = $row['password'];
		}
	}
	else{
		$right_password = $default_password;
	}

	if($input_password==$right_password){
		$queryB = "UPDATE tb_users SET status = '2' WHERE status = '3' AND type = 'PG'";
		mysql_query($queryB);

		if($queryB == true){
			echo "<script>alert('Data berhasil disimpan.');</script>";
			echo "<script>location.href='../calon_pengajar.php';</script>";
		}
	}

	else{
		echo "<script>alert('Password Salah. Proses Dibatalkan.');</script>";
		echo "<script>location.href='../calon_pengajar.php';</script>";
	}
?>