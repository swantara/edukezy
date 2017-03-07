<?php
	$nama = $_POST['nama'];
	$jumlah_pertemuan = $_POST['jumlah_pertemuan'];
	$durasi = $_POST['durasi'];
	$harga = $_POST['harga'];
	$keterangan = $_POST['keterangan'];
	include 'connection.php';
	$query = mysql_query("INSERT INTO
		tb_tarif(tipe, harga, keterangan, currency)
	VALUES ('T1', '$harga', '$keterangan', 'IDR')");
	
	if($query){
		$query = "SELECT 
			t.*
		FROM 
			tb_tarif AS t
		WHERE 
			created_at
		IN (
			SELECT 
				max(created_at)
			FROM 
				tb_tarif
		)";

        $result = mysql_query($query) or die(mysql_error());
        $rowcount = mysql_num_rows($result);

        if($rowcount > 0){
          while($row = mysql_fetch_array($result)){
          	$id_param = $row['id'];
        }
    	}
            
		$query = mysql_query("INSERT INTO
			tb_paket(tarif_id, nama, jumlah_pertemuan, durasi)
		VALUES ('$id_param', '$nama', '$jumlah_pertemuan', '$durasi')");

		if($query){
			echo "<script>alert('Data berhasil disimpan.');</script>";
			echo "<script>location.href='../program.php';</script>";
		}
	}
?>