<?php 
  include 'function/session.php';
  include 'function/connection.php';

  function getTingkatPendidikan($id)
  {
    $query = 'SELECT tp . * , t.nama
          FROM  tb_tingkat_pendidikan_pengajar AS tp
          JOIN tb_tingkat_pendidikan AS t ON tp.tingkat_pendidikan_id = t.id
          WHERE tp.pengajar_id ='.$id;
    $result = mysql_query($query) or die(mysql_error());

    $rowcount = mysql_num_rows($result);
    if($rowcount>0){
      $tingkat = '';
      while($row = mysql_fetch_array($result)){
        $tingkat.= $row['nama'].', ';
      }
      return substr($tingkat, 0,-2);
    }else{
      return '<i style="color: #989ba0;">Belum isi tingkat pendidikan</i>';
    }
  }

  function getMapel($id)
  {
    $query = 'SELECT tp . * , t.nama
          FROM  tb_mapel_pengajar AS tp
          JOIN tb_mapel AS t ON tp.mapel_id = t.id
          WHERE tp.pengajar_id ='.$id;
    $result = mysql_query($query) or die(mysql_error());

    $rowcount = mysql_num_rows($result);
    if($rowcount>0){
      $tingkat = '';
      while($row = mysql_fetch_array($result)){
        $tingkat.= $row['nama'].', ';
      }
      return substr($tingkat, 0,-2);
    }else{
      return '<i style="color: #989ba0;">Belum isi mata pelajaran</i>';
    }
  }

  function getRating($id)
  {
    $query = 'SELECT SUM(rating) AS total, COUNT(id) AS banyak FROM `tb_rating` WHERE pengajar_id = '.$id;
    $result = mysql_query($query) or die(mysql_error());
    $rowcount = mysql_num_rows($result);

    if($rowcount>0){
      $row = mysql_fetch_array($result);
      $average = $row['total']>0 ? (float) $row['total']/$row['banyak'] : 0;
      return round($average, 1, PHP_ROUND_HALF_DOWN);
    }else{
      return (float) 0;
    }
  }
?>

<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Rating Pengajar</title>
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
        <small>Rating Pengajar</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <?php
              $query = 'SELECT 
                          a.*,c.nama AS cabang 
                        FROM 
                          tb_pengajar AS a
                        LEFT JOIN tb_cabang AS c ON a.zona_id = c.id';
              $result = mysql_query($query) or die(mysql_error());

              $rowcount = mysql_num_rows($result);
              $nomer = 1;
              echo $rowcount;
              ?>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Nama Pengajar</th>
                  <th>Foto</th>
                  <th>Jenjang Ajar</th>
                  <th>Mata Pelajaran</th>
                  <th>No Telepon</th>
                  <th>Alamat</th>
                  <th>Cabang</th>
                  <th>Rating Point</th>
                </tr>
                </thead>
                <tbody>
                <?php if($rowcount>0): ?>
                    <?php while($row = mysql_fetch_array($result)): ?>
                      <tr>
                        <td><?= $nomer ?></td>
                        <td><?= $row['fullname'] ?></td>
                        <td>
                            <?php if($row['photo']!=null): ?>
                              <img src="images/photo/pengajar/<?= $row['photo'] ?>" width="100px" height="100px" alt="User Image">
                            <?php else: ?>
                                <i style="color: #989ba0;">Belum isi photo</i>
                            <?php endif; ?>
                        </td>
                        <td><?= getTingkatPendidikan($row['id']) ?></td>
                        <td><?= getMapel($row['id']) ?></td>
                        <td><?= $row['pengajar_cp'] ?></td>
                        <td><?= $row['pengajar_alamat'] ?></td>
                        <td><?= $row['cabang'] == null ? '<i style="color: #989ba0;">Belum punya cabang</i>' : $row['cabang'] ?></td>
                        <td><i class="fa fa-star text-yellow"></i> <?= getRating($row['id']) ?> pt(s)</td>
                      </tr>
                    <?php $nomer++; endwhile; ?>
                <?php endif; ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>Nama Pengajar</th>
                  <th>Foto</th>
                  <th>Jenjang Ajar</th>
                  <th>Mata Pelajaran</th>
                  <th>No Telepon</th>
                  <th>Alamat</th>
                  <th>Cabang</th>
                  <th>Rating Point</th>
                </tr>
                </tfoot>
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