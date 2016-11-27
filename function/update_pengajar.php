<?php
    $id_pengajar = $_POST['id'];
	$nama = $_POST['namaPengajar'];
	$zona_id = $_POST['zona_id'];
	$telp = $_POST['telp'];
	$pendidikan = $_POST['pendidikanPengajar'];
	$alamat = $_POST['alamatPengajar'];
    if(isset($_POST['mapelPengajar'])){
        $mapel = $_POST['mapelPengajar'];
    }
    else{
        $mapel=0;
    }
	include 'connection.php';
    $query = mysql_query("UPDATE 
      tb_pengajar
    SET zona_id = '$zona_id', fullname = '$nama', pengajar_alamat = '$alamat', pengajar_cp = '$telp', pengajar_pendidikan = '$pendidikan', updated_at = NOW()
    WHERE
      id = $id_pengajar");

    if($query) {
        $query = mysql_query("DELETE
        FROM
          tb_mapel_pengajar
        WHERE
          pengajar_id = $id_pengajar");

        if($query) {
            if($mapel!=0) {
                $mapelc = count($mapel);
                for ($i = 0; $i < $mapelc; $i++) {
                    $query = mysql_query("INSERT INTO 
                  tb_mapel_pengajar (pengajar_id, mapel_id)
                VALUES ('$id_pengajar', '$mapel[$i]')");
                }
            }

            if ($query) {
                echo "<script>alert('Data berhasil disimpan.');</script>";
                echo "<script>location.href='../user_pengajar.php';</script>";
            }
        }
    }

    else{
        echo mysql_error();
    }
?>