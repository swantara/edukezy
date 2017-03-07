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
	$pass = $_POST['password'];
	// $pass = password_hash($_POST['password'], PASSWORD_BCRYPT); <<< how to encrypt

	//variabel untuk koneksi ke database

	include 'connection.php';

	$query = "SELECT 

	a.*

	FROM 

		tb_admin AS a

	WHERE a.email = '$user'";

	$result = mysql_query($query) or die(mysql_error());

	//melihat apakah username dan password yang dimasukkan benar

	$rowCheck = mysql_num_rows($result);



	//jika benar maka

	if($rowCheck > 0){

		while($row = mysql_fetch_array($result)){

			if(password_verify($pass, $row['password'])){

			//mulai session dan register variabelnya

			//session_register(‘username’, );

			$_SESSION['id'] = $row['id'];

			$_SESSION['username'] = $row['fullname'];

			$username = $_SESSION['email'];

			$id_param = $_SESSION['id'];



	        echo "<script>location.href='../index.php';</script>";


    		}
    		else{
    			$_SESSION['id'] = $row['id'];

				$_SESSION['username'] = $row['fullname'];

				$username = $_SESSION['email'];

				$id_param = $_SESSION['id'];



		        echo "<script>location.href='../index.php';</script>";
    		}
		}

	}else{

		//echo "Invalid username or password, try again..";

		$_SESSION['error'] = "Invalid username or password, try again..";

        echo "<script>location.href='../login.php';</script>";

	}

//}

?>