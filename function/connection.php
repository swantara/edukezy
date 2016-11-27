<?php
//error_reporting(0);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "edukezc_main";
$IMG_PEMBAYARAN = "https://edukezy.com/images/buktipembayaran/";
$IMG_ARTIKEL = "https://edukezy.com/images/article/";
$IMG_ADMIN = "https://edukezy.com/images/photo/admin/";
$IMG_PENGAJAR = "https://edukezy.com/images/photo/pengajar/";
$IMG_SISWA = "https://edukezy.com/images/photo/siswa/";
$IMG_OWNER = "https://edukezy.com/images/photo/owner/";

mysql_connect ($servername,$username,$password) or die ("Failed to connect database");
mysql_select_db ($dbname) or die ("Database not found");
?>