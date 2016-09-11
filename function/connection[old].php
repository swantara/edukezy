<?php
$servername = "http://sql9.idhostinger.com/phpmyadmin/index.php?db=u208850826_main&server=1";
$username = "u208850826_main";
$password = "e7hg2KecRT";
$dbname = "u208850826_main";

mysql_connect ($servername,$username,$password) or die ("Failed to connect database");
mysql_select_db ($dbname) or die ("Database not found");
?>