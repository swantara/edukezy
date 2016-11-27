<?php
	$nama = $_POST['nama'];
	$zona_id = $_POST['zona_id'];
	$telp = $_POST['telepon'];
	$pendidikan = $_POST['pendidikan'];
	$email = $_POST['email'];
	$alamat = $_POST['alamat'];
	$pass = md5($_POST['password']);
	include 'connection.php';
	$query = mysql_query("INSERT INTO
		tb_users(email, password, status, type)
	VALUES ('$email', '$pass', '1', 'PG')");
	
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
          	$id_param = $row['id'];
        }
    	}
            
		$query = mysql_query("INSERT INTO
			tb_pengajar(user_id, fullname, zona_id, pengajar_alamat, pengajar_cp, pengajar_pendidikan)
		VALUES ('$id_param', '$nama', '$zona_id', '$alamat', '$telp', '$pendidikan')");

		if($query){
			echo "<script>alert('Data berhasil disimpan.');</script>";
			echo "<script>location.href='../user_pengajar.php';</script>";
		}

		else{
			echo mysql_error();
		}
	}
?>