<?php
	$id_param = $_GET["id"];
	include 'connection.php';

	$query = "SELECT 
      	p.*
    FROM 
    	tb_pembayaran AS p
    WHERE
    	p.id=$id_param";

  	$result = mysql_query($query);
    $rowcount = mysql_num_rows($result);

    if($rowcount > 0){
      	while($row = mysql_fetch_array($result)){
      		$id_siswa = $row['siswa_id'];
		}
	}

	$query = mysql_query("UPDATE tb_pembayaran SET pembayaran_status = 2 where id = $id_param");
	
	if($query){
		echo "<script>alert('Data berhasil disimpan.');</script>";
		echo "<script>location.href='../bayar_siswa.php?id=$id_siswa';</script>";
	}
?>