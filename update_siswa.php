<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Siswa</title>
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
    <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">

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
    <a href="index.html" class="logo">
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
        <small>Update Data Siswa</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Profil</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">

            <?php
              $id_param = $_GET["id"];
              include 'function/connection.php';
              $query = "SELECT 
                s.*,
                tp.nama AS tingkat,
                c.nama AS nama_cabang,
                u.email
              FROM 
                tb_siswa AS s
              JOIN tb_tingkat_pendidikan AS tp ON tp.id=s.siswa_pendidikan
              JOIN tb_cabang AS c ON c.id=s.zona_id
              JOIN tb_users AS u ON u.id=s.user_id
              WHERE
                s.id=$id_param";
              $result = mysql_query($query) or die(mysql_error());
              $rowcount = mysql_num_rows($result);

              if($rowcount > 0){
                while($row = mysql_fetch_array($result)){
            ?>

              <div class="form-group">
                <img class="profile-user-img img-responsive img-circle" src="dist/img/user4-128x128.jpg" alt="User profile picture">
                <label for="fotoProfil">Foto profil</label>
                <input type="file" id="fotoProfil">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="namaSiswa">Nama</label>
                <input type="text" class="form-control" id="namaSiswa" value="<?php echo $row['fullname'];?>">
              </div>
              <div class="form-group">
                <label for="alamatSiswa">Alamat</label>
                <input type="text" class="form-control" id="alamatSiswa" value="<?php echo $row['alamat'];?>">
              </div>
              <div class="form-group">
                <label for="cabang">Cabang</label>
                <input type="text" class="form-control" id="cabang" value="<?php echo $row['nama_cabang'];?>">
              </div>   
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" value="<?php echo $row['email'];?>">
              </div>
              <div class="form-group">
                <label for="telp">No Telp</label>
                <input type="text" class="form-control" id="telp" value="<?php echo $row['siswa_cp'];?>">
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="ortuWali">Orang Tua / Wali</label>
                <input type="text" class="form-control" id="ortuWali" value="<?php echo $row['siswa_wali'];?>">
              </div>
              <div class="form-group">
                <label for="pendidikan">Pendidikan Terakhir</label>
                <input type="text" class="form-control" id="pendidikan" value="<?php echo $row['tingkat'];?>">
              </div>
              <div class="form-group">
                <label for="tempatLahir">Tempat Lahir</label>
                <input type="text" class="form-control" id="tempatLahir" value="<?php echo $row['tempat_lahir'];?>">
              </div>
              <!-- Date -->
              <div class="form-group">
                <label>Tanggal Lahir</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="datepicker" value="<?php echo $row['tgl_lahir'];?>">
                </div>
                <!-- /.input group -->
              </div>
            </div>
          </div>
        </div>           

        <!-- /.box-body -->
        <div class="box-footer">
          <input name='id' id='id' value='".$id."' type='hidden'>
            <a class="btn btn-default pull-left" name='detail_$id' href="detail_siswa.php?id=<?php echo $row['id'] ?>">
              <i class="fa fa-reply"></i> Cancel
            </a>
            <a class="btn btn-success pull-right" name='detail_$id' href="detail_siswa.php?id=<?php echo $row['id'] ?>">
              <i class="fa fa-check"></i> Simpan
            </a>
        </div>
      </div>
      <!-- /.box -->

       <?php
                }
              }
            ?>

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
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
  $(function () {
   
    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });
  });
</script>
</body>
</html>
