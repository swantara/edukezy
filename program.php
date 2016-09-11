<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Program</title>
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
        <small>Kelola Program Edukasi</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-header with-border">
              <h3 class="box-title">Biaya Program Edukasi</h3>
            </div>
            <div class="box-body">
              <table class="table table-bordered">
                <thead>
                <tr>
                  <th style="width: 10px">No</th>
                  <th style="width: 150px">Nama Program</th>
                  <th>Biaya / Pertemuan</th>
                  <th>Tambahan Biaya / 30 Menit</th>
                  <th style="width: 100px">Act</th>
                </tr>
                </thead>
                <tbody>

                <?php
                  include 'function/connection.php';
                  $query = "SELECT 
                    p.* 
                  FROM 
                    tb_program AS p";
                  $result = mysql_query($query) or die(mysql_error());

                  $rowcount = mysql_num_rows($result);
                  $nomer = 1;

                  if($rowcount > 0){
                    while($row = mysql_fetch_array($result)){
                      ?>

                <tr>
                  <input name='id' id='id' value='".$id."' type='hidden'>
                  <th><?php echo $nomer;?></th>
                  <td><?php echo $row['nama'];?></td>
                  <td><?php echo "Rp. " . $row['biaya'];?></td>
                  <td><?php echo "Rp. " . $row['biaya_tambahan'];?></td>
                  <td>
                    <div class="btn-group-vertical">
                      <button type="button" class="btn btn-default" name='detail_$id' onClick="Javascript:window.location.href = 'update_program_edukasi.php?id= <?php echo $row['id'] ?>';">
                        <div class="pull-left">
                          <i class="fa fa-edit"></i> Update
                        </div>
                      </button>
                      <button type="button" class="btn btn-danger" name='detail_$id' onClick="Javascript:window.location.href = 'delete_program_edukasi.php?id= <?php echo $row['id'] ?>';">
                        <div class="pull-left">
                          <i class="fa fa-trash"></i> Delete
                        </div>
                      </button>
                    </div>
                  </td>
                </tr>

                <?php
                    $nomer ++;
                  }
                  }
                ?>

                </tbody>
              </table>
            </div>
            <div class="box-footer">
              <a href="tambah_program.php" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Tambah Program</a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-6">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-header with-border">
              <h3 class="box-title">Biaya Transportasi</h3>
            </div>
            <div class="box-body">
              <table class="table table-bordered">
                <thead>
                <tr>
                  <th style="width: 10px"> No</th>
                  <th> Range Jarak</th>
                  <th> Biaya</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <th> 1</th>
                  <td> < 10 kilometer</td>
                  <td> -</td>
                </tr>
                <tr>
                  <th> 2</th>
                  <td> < 20 kilometer</td>
                  <td> Rp. 15.000</td>
                </tr>
                <tr>
                  <th> 3</th>
                  <td> < 30 kilometer</td>
                  <td> Rp. 35.000</td>
                </tr>
                <tr>
                  <th> 4</th>
                  <td> > 40 kilometer</td>
                  <td> Rp. 50.000</td>
                </tr>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-header with-border">
              <h3 class="box-title">Bonus Rating</h3>
            </div>
            <div class="box-body">
              <table class="table table-bordered">
                <thead>
                <tr>
                  <th style="width: 10px"> No</th>
                  <th> Rating </th>
                  <th> Bonus / Pertemuan</th>
                  <th style="width: 100px"> Act</th>
                </tr>
                </thead>
                <tbody>

                <?php
                  include 'function/connection.php';
                  $query = "SELECT 
                    t.*
                  FROM 
                    tb_tarif AS t
                  WHERE 
                    t.tipe = 'T2'";
                  $result = mysql_query($query) or die(mysql_error());

                  $rowcount = mysql_num_rows($result);
                  $nomer = 1;

                  if($rowcount > 0){
                    while($row = mysql_fetch_array($result)){
                ?>

                <tr>
                  <input name='id' id='id' value='".$id."' type='hidden'>
                  <th><?php echo $nomer;?></th>
                  <td><?php echo "Rating " . $row['keterangan'];?></td>
                  <td><?php echo "Rp. " . $row['harga'];?></td>
                  <td>
                    <button type="button" class="btn btn-default" name='detail_$id' onClick="Javascript:window.location.href = 'update_biaya_rating.php?id= <?php echo $row['id'] ?>';">
                      <div class="pull-left">
                        <i class="fa fa-edit"></i> Update
                      </div>
                    </button>
                  </td>
                </tr>

                <?php
                    $nomer ++;
                  }
                  }
                ?>

                </tbody>
              </table>
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
      "paging": false,
      "lengthChange": false,
      "searching": false,
      "ordering": false,
      "info": false,
      "autoWidth": false
    });
  });
</script>
</body>
</html>