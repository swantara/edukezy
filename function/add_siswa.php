<?php
$nama = $_POST['nama'];
$namaOrtu = $_POST['namaOrtu'];
$tglLahir = date_format(date_create($_POST['tanggalLahir']), "Y-m-d");
$tempatLahir = $_POST['tempatLahir'];
$zona_id = $_POST['zona_id'];
$telp = $_POST['telepon'];
$pendidikan = $_POST['tingkatPendidikan'];
$email = $_POST['email'];
$alamat = $_POST['alamat'];
$pass = md5($_POST['password']);
include 'connection.php';
$query = mysql_query("INSERT INTO
		tb_users(email, password, status, type)
	VALUES ('$email', '$pass', '1', 'SW')");

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
			tb_siswa(user_id, zona_id, fullname, alamat, tempat_lahir, tgl_lahir, siswa_cp, siswa_wali, siswa_pendidikan)
		VALUES ('$id_param', '$zona_id', '$nama', '$alamat', '$tempatLahir', '$tglLahir', '$telp', '$namaOrtu', '$pendidikan')");

    if($query){
        echo "<script>alert('Data berhasil disimpan.');</script>";
        echo "<script>location.href='../user_siswa.php';</script>";
    }

    else{
        echo mysql_error();
    }
}
?>