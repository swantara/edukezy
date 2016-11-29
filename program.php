<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
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
                  <td>
                    <div class="btn-group-vertical">
                      <button type="button" class="btn btn-default"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="Javascript:window.location.href = 'update_program_edukasi.php?id=<?php echo $row['id'] ?>';"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-edit"></i> Update
                        </div>
                      </button>
                      <button type="button" class="btn btn-danger"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="deleteProgram(<?=$row['id']?>)"
                      <?php } ?>>
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
              <a
              <?php if($_SESSION['status']!=4){ ?>
                href="tambah_program.php"
              <?php } ?>
              class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Tambah Program</a>
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
                  <th style="width: 10px"> Act</th>
                </tr>
                </thead>
                <tbody>

                <?php
                  include 'function/connection.php';
                  $queryB = "SELECT 
                    j.* 
                  FROM 
                    tb_jarak AS j
                  ORDER BY
                    j.jarak";
                  $resultB = mysql_query($queryB) or die(mysql_error());

                  $rowcountB = mysql_num_rows($resultB);
                  $nomerB = 1;

                  if($rowcountB > 0){
                    while($rowB = mysql_fetch_array($resultB)){
                      ?>

                <tr>
                  <input name='id' id='id' value='".$id."' type='hidden'>
                  <th><?php echo $nomerB;?></th>
                  <td><?php echo "Lebih dari " . $rowB['jarak'] . " kilometer";?></td>
                  <td><?php echo "Rp. " . $rowB['biaya'];?></td>
                  <td>
                    <div class="btn-group-vertical">
                      <button type="button" class="btn btn-default"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="Javascript:window.location.href = 'update_biaya_transport.php?id=<?php echo $rowB['id'] ?>';"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-edit"></i> Update
                        </div>
                      </button>
                      <button type="button" class="btn btn-danger"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="deleteTransportasi(<?=$rowB['id']?>)"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-trash"></i> Delete
                        </div>
                      </button>
                    </div>
                  </td>
                </tr>

                <?php
                    $nomerB ++;
                  }
                  }
                ?>

                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <a
              <?php if($_SESSION['status']!=4){ ?>
                href="tambah_jarak.php"
              <?php } ?>
              class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Tambah Jarak</a>
            </div>
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
                    <button type="button" class="btn btn-default"
                    <?php if($_SESSION['status']!=4){ ?>
                      onClick="Javascript:window.location.href = 'update_biaya_rating.php?id=<?php echo $row['id'] ?>';"
                    <?php } ?>>
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

        <div class="col-md-6">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-header with-border">
              <h3 class="box-title">Kelola Paket</h3>
            </div>
            <div class="box-body">
              <table class="table table-bordered">
                <thead>
                <tr>
                  <th style="width: 10px"> No </th>
                  <th> Nama </th>
                  <th style="width: 10px"> Jml Pertemuan </th>
                  <th> Durasi / Pertemuan </th>
                  <th> Biaya </th>
                  <th style="width: 100px"> Act </th>
                </tr>
                </thead>
                <tbody>

                <?php
                  include 'function/connection.php';
                  $queryC = "SELECT 
                    p.*,
                    harga
                  FROM 
                    tb_paket AS p
                  JOIN tb_tarif AS t ON t.id = p.tarif_id
                  ORDER BY 
                    p.jumlah_pertemuan";
                  $resultC = mysql_query($queryC) or die(mysql_error());

                  $rowcountC = mysql_num_rows($resultC);
                  $nomerC = 1;

                  if($rowcountC > 0){
                    while($rowC = mysql_fetch_array($resultC)){
                ?>

                <tr>
                  <input name='id' id='id' value='".$id."' type='hidden'>
                  <th><?php echo $nomerC;?></th>
                  <td><?php echo $rowC['nama'];?></td>
                  <td><?php echo $rowC['jumlah_pertemuan'] . " kali";?></td>
                  <td><?php echo $rowC['durasi'] . " menit";?></td>
                  <td><?php echo "Rp. " .$rowC['harga'];?></td>
                  <td>
                    <div class="btn-group-vertical">
                      <button type="button" class="btn btn-default"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="Javascript:window.location.href = 'update_paket.php?id=<?php echo $rowC['id'] ?>';"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-edit"></i> Update
                        </div>
                      </button>
                      <button type="button" class="btn btn-danger"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="deletePaket(<?=$rowC['id']?>)"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-trash"></i> Delete
                        </div>
                      </button>
                    </div>
                  </td>
                </tr>

                <?php
                    $nomerC ++;
                  }
                  }
                ?>

                </tbody>
              </table>
            </div>
            <div class="box-footer">
              <a
              <?php if($_SESSION['status']!=4){ ?>
                href="tambah_paket.php"
              <?php } ?>
              class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Tambah Paket</a>
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
<!-- Button Function -->
<script>
function deleteProgram(id){
  var prompt = confirm("Pilih OK untuk melanjutkan.")
  if(prompt == true){
    Javascript:window.location.href = 'function/delete_program.php?id='+id;
  }
}

function deleteTransportasi(id){
  var prompt = confirm("Pilih OK untuk melanjutkan.")
  if(prompt == true){
    Javascript:window.location.href = 'function/delete_jarak.php?id='+id;
  }
}

function deletePaket(id){
  var prompt = confirm("Pilih OK untuk melanjutkan.")
  if(prompt == true){
    Javascript:window.location.href = 'function/delete_paket.php?id='+id;
  }
}
</script>
</body>
</html>