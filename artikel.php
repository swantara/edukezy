<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Artikel dan Broadcast</title>
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
        <small>Kelola User Siswa</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a
              <?php if($_SESSION['status']!=4){ ?>
                href="tambah_artikel.php"
              <?php } ?>
              class="btn btn-primary"><i class="fa fa-edit"></i> Tambah Artikel</a>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Judul Artikel</th>
                  <th>Konten</th>
                  <th>Author</th>
                  <th>Tanggal Publish</th>
                  <th>Gambar</th>
                  <th style="width : 10px;">Act</th>
                </tr>
                </thead>
                <tbody>

                <?php
                  include 'function/connection.php';
                  $query = 'SELECT 
                    a.*
                  FROM 
                    tb_artikel AS a
                  ORDER BY a.judul';
                  $result = mysql_query($query) or die(mysql_error());

                  $rowcount = mysql_num_rows($result);
                  $nomer = 1;

                  if($rowcount > 0){
                    while($row = mysql_fetch_array($result)){
                ?>

                <tr>
                  <td><?php echo $nomer;?></td>
                  <td><?php echo $row['judul'];?></td>
                  <td><?php echo $row['content'];?></td>
                  <td><?php echo $row['author'];?></td>
                  <td><?php echo $row['created_at'];?></td>
                  <td>
                      <a class="btn btn-default" target="_blank" href="<?php echo $IMG_ARTIKEL . $row['cover'];?>">
                        <i class="fa fa-eye"></i> Lihat Gambar
                      </a>
                  </td>
                  <td>
                    <div class="btn-group-vertical">
                      <button type="button" class="btn btn-default"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="Javascript:window.location.href = 'update_artikel.php?id=<?php echo $row['id'] ?>';"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-edit"></i> Edit
                        </div>
                      </button>
                      <button type="button" class="btn btn-danger"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="deletePrompt(<?=$row['id']?>)"
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
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>Judul Artikel</th>
                  <th>Konten</th>
                  <th>Author</th>
                  <th>Waktu Publish</th>
                  <th>Gambar</th>
                  <th>Act</th>
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
<!-- Button Function -->
<script>
function deletePrompt(id){
  var prompt = confirm("Pilih OK untuk melanjutkan.")
  if(prompt == true){
    Javascript:window.location.href = 'function/delete_artikel.php?id='+id;
  }
}
</script>
</body>
</html>
