<?php
$id_param = $_POST['id'];
$foto = $_POST['foto'];
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$zona_id = $_POST['zona_id'];
$telp = $_POST['telp'];
$ortu = $_POST['ortu'];
$tingkat = $_POST['tingkatPendidikan'];
$tempatLahir = $_POST['tempatLahir'];
$tglLahir = date_format(date_create($_POST['tglLahir']), "Y-m-d");
include 'connection.php';
$query = mysql_query("UPDATE
		tb_siswa
	SET zona_id = '$zona_id', fullname = '$nama', alamat = '$alamat', tempat_lahir = '$tempatLahir', 
	tgl_lahir = '$tglLahir', siswa_cp = '$telp', siswa_wali = '$ortu', siswa_pendidikan = '$tingkat', updated_at = NOW()
	WHERE id=$id_param");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../user_siswa.php';</script>";
}
?>