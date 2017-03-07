<?php

include 'connection.php';

$id_param = $_POST['id'];

$nama = $_POST['nama'];

$alamat = $_POST['alamat'];

$zona_id = $_POST['zona_id'];

$telp = $_POST['telp'];

$ortu = $_POST['ortu'];

$tingkat = $_POST['tingkatPendidikan'];

$tempatLahir = $_POST['tempatLahir'];

$tglLahir = date_format(date_create($_POST['tglLahir']), "Y-m-d");

$email = $_POST['email'];

$user_id = $_POST['user_id'];

if(isset($_POST['password'])){
    $updatePassword = md5($_POST['password']);
}
else{
    $updatePassword = 0;
}

$query = mysql_query("UPDATE

		tb_siswa

	SET zona_id = '$zona_id', fullname = '$nama', alamat = '$alamat', tempat_lahir = '$tempatLahir', 

	tgl_lahir = '$tglLahir', siswa_cp = '$telp', siswa_wali = '$ortu', siswa_pendidikan = '$tingkat', updated_at = NOW()

	WHERE id=$id_param") or die("1" . mysql_error());



if($query){
	$query = mysql_query("UPDATE tb_users SET email = '$email' WHERE id = $user_id") or die("2" . mysql_error());

	if($query){
	    if($updatePassword != 0) {
	        $query = mysql_query("UPDATE tb_users SET password = '$updatePassword' WHERE id = $user_id");
	    }

	    //echo '6'.$query.'<br>';

	    if($query){
	        echo "<script>alert('Data berhasil disimpan.');</script>";
	        echo "<script>location.href='../user_siswa.php';</script>";
	    }
	}
}

?>