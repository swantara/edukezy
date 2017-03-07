<?php
    
    include 'connection.php';

    $id_pengajar = $_POST['id'];
    $nama = $_POST['namaPengajar'];
    $zona_id = $_POST['zona_id'];
    $telp = $_POST['telp'];
    $pendidikan = $_POST['pendidikanPengajar'];
    $alamat = $_POST['alamatPengajar'];
    $user_id = $_POST['user_id'];
    $status = $_POST['status'];
    $email = $_POST['email'];

    if(isset($_POST['mapelPengajar'])){
        $mapel = $_POST['mapelPengajar'];
    }
    else{
        $mapel=0;
    }

    if(isset($_POST['jenjangAjar'])){
        $jenjang = $_POST['jenjangAjar'];
    }
    else{
        $jenjang=0;
    }

    if(isset($_POST['password'])){
        $updatePassword = md5($_POST['password']);
    }
    else{
        $updatePassword = 0;
    }

    mysql_query("UPDATE tb_users SET status = $status, email = '$email' WHERE id=$user_id");

    $query = mysql_query("UPDATE 
      tb_pengajar
    SET zona_id = '$zona_id', fullname = '$nama', pengajar_alamat = '$alamat', pengajar_cp = '$telp', pengajar_pendidikan = '$pendidikan', updated_at = NOW()
    WHERE
      id = $id_pengajar");

    //echo '1'.$query.'<br>';

    if($query) {
        $query = mysql_query("DELETE
        FROM
          tb_mapel_pengajar
        WHERE
          pengajar_id = $id_pengajar");

        //echo '2'.$query.'<br>';

        if($query) {
            if($mapel!=0) {
                $mapelc = count($mapel);
                for ($i = 0; $i < $mapelc; $i++) {
                    $query = mysql_query("INSERT INTO 
                        tb_mapel_pengajar (pengajar_id, mapel_id)
                        VALUES ('$id_pengajar', '$mapel[$i]')");
                }
            }

           // echo '3'.$query.'<br>';

            if($query){
                $query = mysql_query("DELETE
                FROM
                  tb_tingkat_pendidikan_pengajar
                WHERE
                  pengajar_id = $id_pengajar");

                //echo '4'.$query.'<br>';

                if ($query) {
                    if($jenjang!=0) {
                        $jenjangc = count($jenjang);
                        for ($i = 0; $i < $jenjangc; $i++) {
                            $query = mysql_query("INSERT INTO 
                                tb_tingkat_pendidikan_pengajar (pengajar_id, tingkat_pendidikan_id)
                                VALUES ('$id_pengajar', '$jenjang[$i]')");
                        }
                    }

                    //echo '5'.$query.'<br>';

                    if($query){
                        if($updatePassword != 0) {
                            $query = mysql_query("UPDATE tb_users SET password = '$updatePassword' WHERE id = $user_id");
                        }

                        //echo '6'.$query.'<br>';

                        if($query){
                            echo "<script>alert('Data berhasil disimpan.');</script>";
                            echo "<script>location.href='../user_pengajar.php';</script>";
                        }
                    }
                }
            }
        }
    }

    else{
        echo mysql_error();
    }
?>