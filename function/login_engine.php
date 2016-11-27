<?PHP
//periksa apakah file ini tidak dipanggil secara langsung, jika dipanggil secara langsung
//maka user akan di kembalikan ke login.thml

//if (!isset($username) || !isset($password)) {
//	header( 'Location: login.php' );
//}
//melihat apakah form telah diisi semua atau tidak. Jika tidak, user akan dikembalikan ke
//halaman login.html
//elseif (empty($username) || empty($password)) {
//	header( 'Location: login.php' );
//}
//else{
//mengubah username dan password yang telah dimasukkan menjadi sebuah variabel dan meng-enkripsi password ke md5
//var_dump($_POST);
//die();
session_start();
	$user = $_POST['username'];
	$pass = md5($_POST['password']);

	//variabel untuk koneksi ke database
	include 'connection.php';
	$query = 'SELECT 
	u.*,
      a.fullname AS nama_admin,
      o.fullname AS nama_owner, o.zona_id,
      c.nama AS nama_cabang
	FROM 
		tb_users AS u
	LEFT JOIN tb_admin AS a ON a.admin_id=u.id
    LEFT JOIN tb_owner AS o ON o.owner_id=u.id
    LEFT JOIN tb_cabang AS c ON c.id=o.zona_id
	WHERE email="'.$user.'" AND password="'.$pass.'" AND type="AD"';
	$result = mysql_query($query) or die(mysql_error());

	//melihat apakah username dan password yang dimasukkan benar
	$rowCheck = mysql_num_rows($result);

	//jika benar maka
	if($rowCheck > 0){
		while($row = mysql_fetch_array($result)){

		//mulai session dan register variabelnya
		
		//session_register(‘username’, );
		if(is_null($row['nama_owner'])){
			$_SESSION['id'] = $row['id'];
			$_SESSION['username'] = $row['nama_admin'];
			$_SESSION['type'] = "AD";
            $_SESSION['status'] = $row['status'];
		}
		else{
			$_SESSION['id'] = $row['id'];
			$_SESSION['username'] = $row['nama_owner'];
			$_SESSION['type'] = "OW";
			$_SESSION['cabang'] = $row['nama_cabang'];
			$_SESSION['id_cabang'] = $row['zona_id'];
		}
		$username = $_SESSION['username'];

		$_SESSION['id'] = $row['id'];
		$id_param = $_SESSION['id'];

        echo "<script>location.href='../index.php';</script>";

		}
	}else{
		//echo "Invalid username or password, try again..";
		$_SESSION['error'] = "Invalid username or password, try again..";
        echo "<script>location.href='../login.php';</script>";
	}
//}
?>