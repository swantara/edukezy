<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Calon Pengajar</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index.php" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>E</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Edu</b>kezy</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
    </nav>
  </header>
  
  <?php
    if($_SESSION['type']=="AD"){
      include 'navbar.php';
    }
    elseif($_SESSION['type']=="OW"){
      include 'navbar_owner.php';
    }
  ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Edukezy
        <small>Detail Summary Cabang</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <!-- /.col -->
        <div class="col-md-12">
          <!-- About Me Box -->
          <div class="box box-primary">

            <?php
              $id_param = $_GET["id"];
              include 'function/connection.php';
              $query = "SELECT
                c.*
              FROM tb_cabang AS c 
              WHERE c.id = $id_param";
              $result = mysql_query($query) or die(mysql_error());
              $rowcount = mysql_num_rows($result);
              if($rowcount > 0){
                while($row = mysql_fetch_array($result)){
            ?>

            <div class="box-header with-border">
              <h3 class="box-title"><?=$row['nama'];?></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <strong><i class="fa fa-chevron-right margin-r-5"></i> Akun Owner</strong>

              <p>

              <?php
                include 'function/connection.php';
                $queryB = "SELECT 
                  o.*
                FROM 
                  tb_owner AS o
                WHERE
                  o.zona_id = $id_param";
                $resultB = mysql_query($queryB) or die(mysql_error());
                $rowcountB = mysql_num_rows($resultB);
                if($rowcountB > 0){
                  while($rowB = mysql_fetch_array($resultB)){
                    echo $rowB['fullname'] . " (" . $rowB['owner_cp'] . ") <br/>";
                  }
                }
                else{
                  echo "-";
                }
              ?>        
              </p>

              <hr>

              <strong><i class="fa fa-chevron-right margin-r-5"></i> Informasi Alamat</strong>

              <p>
              <?php
                echo $row['alamat'] . "<br/>"
                . "Longitude : " . $row['logitude'] . ", "
                . "Latitude  : " . $row['latitude'];
              ?>
              </p>

              <hr>

              <strong><i class="fa fa-chevron-right margin-r-5"></i> Jumlah Siswa</strong>

              <p>
              <?php
                include 'function/connection.php';
                $queryC = "SELECT 
                  s.*,
                  u.*
                FROM 
                  tb_siswa AS s
                JOIN tb_users AS u on u.id = s.user_id
                WHERE 
                  zona_id = $id_param
                AND 
                  u.type = 'SW'
                AND
                  u.status = '1'";
                $resultC = mysql_query($queryC) or die(mysql_error());
                $rowcountC = mysql_num_rows($resultC);
                if($rowcountC>0){
                  echo $rowcountC . " orang";
                }
                else{
                  echo "-";
                }
              ?>
              </p>

              <hr>

              <strong><i class="fa fa-chevron-right margin-r-5"></i> Jumlah Pengajar</strong>

              <p>
              <?php
                include 'function/connection.php';
                $queryD = "SELECT 
                  p.*,
                  u.*
                FROM 
                  tb_pengajar AS p
                JOIN tb_users AS u on u.id = p.user_id
                WHERE 
                  zona_id = $id_param
                AND 
                  u.type = 'PG'
                AND
                  u.status = '1'";
                $resultD = mysql_query($queryD) or die(mysql_error());
                $rowcountD = mysql_num_rows($resultD);
                if($rowcountD>0){
                  echo $rowcountD . " orang";
                }
                else{
                  echo "-";
                }
              ?>
              </p>

              <hr>

              <strong><i class="fa fa-chevron-right margin-r-5"></i> Pembayaran</strong>

              <p>
              <?php
                include 'function/connection.php';
                $queryE = "SELECT 
                  SUM(p.jumlah) AS total_pembayaran
                FROM 
                  tb_pembayaran AS p
                JOIN tb_siswa AS s ON s.id=p.siswa_id
                WHERE
                  s.zona_id = $id_param";
                $resultE = mysql_query($queryE) or die(mysql_error());
                $rowcountE = mysql_num_rows($resultE);
                if($rowcountE > 0){
                  while($rowE = mysql_fetch_array($resultE)){
                    if(isset($rowE['total_pembayaran'])){
                      echo "Rp. " . number_format($rowE['total_pembayaran']);
                    }
                    else{
                      echo "-";
                    }
                  }
                }
              ?>
              </p>

            </div>
            <!-- /.box-body -->

          <?php
                }
              }
          ?>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2016 <a href="#">Edukezy</a>.</strong> All rights
    reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.0 -->
<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Button Function -->
<script>
function acceptPrompt(id) {
    var prompt = confirm("Pilih OK untuk melanjutkan.");
    if (prompt == true) {
        Javascript:window.location.href = 'function/approve_calon_pengajar.php?id='+id;
    }
}

function declinePrompt(id) {
    var prompt = confirm("Pilih OK untuk melanjutkan.");
    if (prompt == true) {
        Javascript:window.location.href = 'function/decline_calon_pengajar.php?id='+id;
    }
}
</script>
</body>
</html>
