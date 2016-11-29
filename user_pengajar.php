<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Pengajar</title>
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
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css">
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
        <small>Kelola User Pengajar</small>
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
              href="tambah_pengajar.php"
            <?php } ?>
            class="btn btn-primary"><i class="fa fa-user-plus"></i> Tambah Pengajar</a></div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="width: 10px">No</th>
                  <th>Nama Pengajar</th>
                  <th>Mata Pelajaran</th>
                  <th>No Telepon</th>
                  <th>Alamat</th>
                  <th>Cabang</th>
                  <th style="width: 10px">Act</th>
                </tr>
                </thead>
                <tbody>

                  <?php
                    include 'function/connection.php';
                    $query = "SELECT 
                      p.*,
                      c.nama AS nama_cabang,
                      u.status
                    FROM 
                      tb_pengajar AS p
                    LEFT JOIN tb_cabang AS c ON c.id=p.zona_id
                    INNER JOIN tb_users AS u ON u.id=p.user_id
                    WHERE
                      status='1'
                    ORDER BY
                      p.fullname";

                    $result = mysql_query($query) or die(mysql_error());
                    $rowcount = mysql_num_rows($result);
                    $nomer = 1;

                    if($rowcount > 0){
                      while($row = mysql_fetch_array($result)){
                        $id_param = $row['id'];
                        $user_id = $row['user_id'];
                        ?>

                <tr>
                  <input name='id' id='id' value='".$id."' type='hidden'>
                  <td><?php echo $nomer;?></td>
                  <td><?php echo $row['fullname'];?></td>
                  <td>

                  <?php
                    include 'function/connection.php';
                    $queryB = "SELECT 
                      p.*,
                      mp.mapel_id,
                      m.nama AS mata_pelajaran,
                      tp.nama AS tingkat
                    FROM 
                      tb_pengajar AS p
                    JOIN tb_mapel_pengajar AS mp ON mp.pengajar_id=p.id
                    JOIN tb_mapel AS m ON m.id=mp.mapel_id
                    JOIN tb_tingkat_pendidikan AS tp ON tp.id=m.tingkat_pendidikan
                    WHERE
                      p.id = $id_param";

                    $resultB = mysql_query($queryB) or die(mysql_error());

                    $rowcountB = mysql_num_rows($resultB);
                    if($rowcountB > 0){
                      while($rowB = mysql_fetch_array($resultB)){
                        if( $rowB['mata_pelajaran'] != NULL){
                          echo $rowB['mata_pelajaran'] . " (" . $rowB['tingkat'] . ") <br/>";
                        }
                      }
                    }
                    else{
                      echo "-";
                    }
                  ?>

                  </td>
                  <td><?php echo $row['pengajar_cp'];?></td>
                  <td><?php echo $row['pengajar_alamat'];?></td>
                  <td><?php echo $row['nama_cabang'];?>
                  </td>
                  <td>
                    <div class="btn-group-vertical">
                      <button type="button" class="btn btn-default" onClick="Javascript:window.location.href = 'detail_pengajar.php?id=<?php echo $row['id'] ?>';"
                        <div class="pull-left">
                          <i class="fa fa-eye"></i> Detail
                        </div>
                      </button>
                      <button type="button" class="btn btn-danger"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="deletePrompt(<?=$row['id'];?>)"
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
                  <th>Nama Pengajar</th>
                  <th>Mata Pelajaran</th>
                  <th>No Telepon</th>
                  <th>Alamat</th>
                  <th>Cabang</th>
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

<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script>
  $(document).ready(function() {
    $('#example1').DataTable( {
      dom: 'Bfrtip',
      buttons: [
        'copyHtml5',
        'excelHtml5',
        'csvHtml5',
        'pdfHtml5'
      ]
    } );
  } );
</script>
<!-- Button Function -->
<script>
function deletePrompt(id){
  var prompt = confirm("Pilih OK untuk melanjutkan.")
  if(prompt == true){
    Javascript:window.location.href = 'function/delete_pengajar.php?id='+id;
  }
}
</script>
</body>
</html>