<?php 
  session_start();
   if(!isset($_SESSION['username'])){
    $_SESSION['error'] = "You must login first.. ";
    header( 'Location: login.php' ); 
   }
?>