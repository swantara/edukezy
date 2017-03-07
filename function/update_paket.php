<?php
$id_param = $_POST['id'];
$nama = $_POST['nama'];
$jumlah_pertemuan = $_POST['jumlah_pertemuan'];
$durasi = $_POST['durasi'];
$harga = $_POST['harga'];
include 'connection.php';
$query = mysql_query("UPDATE
		tb_paket
	SET nama = '$nama', jumlah_pertemuan = '$jumlah_pertemuan', durasi = '$durasi', updated_at = NOW()
	WHERE id=$id_param");

if($query){

	$query = "SELECT 
			p.*
        FROM 
          tb_paket AS p
        WHERE
          p.id = $id_param";

    $result = mysql_query($query) or die(mysql_error());
    $rowcount = mysql_num_rows($result);

    if($rowcount > 0){
        while($row = mysql_fetch_array($result)){
            $id_param = $row['tarif_id'];
        }
    }

    $query = mysql_query("UPDATE
		tb_tarif
	SET harga = '$harga', updated_at = NOW()
	WHERE id=$id_param");

    if($query){
        echo "<script>alert('Data berhasil disimpan.');</script>";
        echo "<script>location.href='../program.php';</script>";
    }
}
?>