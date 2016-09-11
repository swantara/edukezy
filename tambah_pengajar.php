<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Tambah User</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
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
        <small>Tambah Pengajar</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="col-xs-8">
        <div class="box">
        <form action="function/add_pengajar.php" method="post">
          <div class="box-body">
            <!-- email -->
            <label>Isi form berikut</label>
            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-user"></i>
                </div>
                <input name="nama" type="name" class="form-control" placeholder="Nama">
              </div>
              <!-- /.input group -->
            </div>

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-map-marker"></i>
                </div>
                <input name="alamat" type="alamat" class="form-control" placeholder="Alamat">
              </div>
              <!-- /.input group -->
            </div>

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-graduation-cap"></i>
                </div>
                <input name="pendidikan" type="pendidikan" class="form-control" placeholder="Pendidikan Terakhir">
              </div>
              <!-- /.input group -->
            </div>

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-phone"></i>
                </div>
                <input name="telepon" type="telepon" class="form-control" placeholder="Telepon">
              </div>
              <!-- /.input group -->
            </div>

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-envelope"></i>
                </div>
                <input name="email" type="email" class="form-control" placeholder="Email">
              </div>
              <!-- /.input group -->
            </div>
            <!-- /.form group -->

            <!-- password -->
            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-lock"></i>
                </div>
                <input name="password" type="password" class="form-control" placeholder="Password">
              </div>
              <!-- /.input group -->
            </div>
            <!-- /.form group -->

            <div class="form-group">
              <select name="zona_id" class="form-control">
                <option value="" disabled selected>Pilih Cabang</option>
              <?php
                include 'function/connection.php';
                $query = "SELECT 
                  c.*
                FROM 
                  tb_cabang AS c
                ORDER BY c.nama";
                $result = mysql_query($query) or die(mysql_error());

                $rowcount = mysql_num_rows($result);

                if($rowcount > 0){
                  while($row = mysql_fetch_array($result)){
              ?>
                <option value="<?= $row['id'];?>"><?= $row['nama'];?></option>
              <?php
                  }
                }  
              ?>
              </select>
            </div>


          </div>
          <!-- /.box-body -->

          <div class="box-footer">
            <a href="user_pengajar.php" class="btn btn-default"><i class="fa fa-close"></i> Cancel</a>
            <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-check"></i> Submit</button>
          </div>
          <!-- /.box-footer -->
        </form>
        </div> <!-- /.col,-xs-6 -->
      </div>
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
<!-- ./wrapper -->

<!-- jQuery 2.2.0 -->
<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
</body>
</html>