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
        <small>Detail Calon Pengajar</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">

              <?php
                  $id_param = $_GET["id"];
                  include 'function/connection.php';
                  $query = "SELECT
                    p.*, 
                    u.email
                  FROM tb_pengajar AS p 
                  JOIN tb_users AS u ON u.id=p.user_id
                  WHERE p. id = $id_param";
                  $result = mysql_query($query) or die(mysql_error());

                  $rowcount = mysql_num_rows($result);

                  if($rowcount > 0){
                    while($row = mysql_fetch_array($result)){
              ?>

              <?php
                if($row['photo']==NULL){
              ?>
              <img class="profile-user-img img-responsive img-circle" src="dist/img/no-image.jpg" alt="User profile picture">
              <?php 
                }
                else{
              ?>
              <img class="profile-user-img img-responsive img-circle" alt="User profile picture" src="<?=$IMG_PENGAJAR . $row['photo'];?>">
              <?php 
                }
              ?>

              <h3 class="profile-username text-center"><?php echo $row['fullname'];?></h3>
              <input name='user_id' id='user_id' value='".$id."' type='hidden'>
              <button type="button" class="btn btn-primary btn-block"
              <?php if($_SESSION['status']!=4){ ?>
                onClick="acceptPrompt(<?=$row['user_id'];?>)"
              <?php } ?>>
                  <i class="fa fa-check"></i> <b>Approve</b>
              </button>
              <button type="button" class="btn btn-danger btn-block"
              <?php if($_SESSION['status']!=4){ ?>
                onClick="declinePrompt(<?=$row['user_id'];?>)"
              <?php } ?>>
                  <i class="fa fa-trash"></i> <b>Decline</b>
              </button>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Profil</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <strong><i class="fa fa-envelope margin-r-5"></i> Email</strong>

              <p class="text-muted"><?php echo $row['email'];?></p>

              <hr>

              <strong><i class="fa fa-phone margin-r-5"></i> No Telp</strong>

              <p class="text-muted"><?php echo $row['pengajar_cp'];?></p>

              <hr>

              <strong><i class="fa fa-graduation-cap margin-r-5"></i> Pendidikan Terakhir</strong>

              <p class="text-muted"><?php echo $row['pengajar_pendidikan'];?></p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> Alamat</strong>

              <p><?php echo $row['pengajar_alamat'];?></p>

              <?php
                  }
                }
              ?>

            </div>
            <!-- /.box-body -->
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
