<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "edukezyc_main";
$IMG_PEMBAYARAN = "http://edukezy.com/images/buktipembayaran/";
$IMG_ARTIKEL = "http://edukezy.com/images/article/";
$IMG_ADMIN = "http://edukezy.com/images/photo/admin/";
$IMG_PENGAJAR = "http://edukezy.com/images/photo/pengajar/";
$IMG_SISWA = "http://edukezy.com/images/photo/siswa/";
$IMG_OWNER = "http://edukezy.com/images/photo/owner/";

mysql_connect ($servername,$username,$password) or die ("Failed to connect database");
mysql_select_db ($dbname) or die ("Database not found");
?>