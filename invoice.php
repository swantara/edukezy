<?php
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Invoice</title>
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
        <small>Verifikasi Pembayaran</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="alert alert-warning alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-info"></i> Info:</h4>
        Berikut adalah list pembayaran yang belum diverifikasi.
      </div>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Nama Siswa</th>
                  <th>Jenis</th>
                  <th>Cabang</th>
                  <th>Program Edukasi</th>
                  <th>Periode Waktu</th>
                  <th>Invoice</th>
                  <th>Penerima Cash</th>
                  <th>Bukti Transfer</th>
                  <th>Act</th>
                </tr>
                </thead>
                <tbody>

                  <?php
                    include 'function/connection.php';
                    $query = "SELECT 
                      p.*,
                      s.fullname AS nama_siswa,
                      c.nama AS nama_cabang,
                      j.mapel_id, j.paket_id,
                      m.nama AS mata_pelajaran, m.tingkat_pendidikan,
                      tp.nama AS tingkat,
                      pk.nama AS nama_paket,
                      b.image,
                      pj.fullname AS nama_pengajar
                    FROM 
                      tb_pembayaran AS p
                    JOIN tb_siswa AS s ON s.id=p.siswa_id
                    JOIN tb_cabang AS c ON c.id=s.zona_id
                    JOIN tb_jadwal AS j ON j.id=p.jadwal_id
                    JOIN tb_mapel AS m ON m.id=j.mapel_id
                    JOIN tb_tingkat_pendidikan AS tp ON tp.id=m.tingkat_pendidikan
                    JOIN tb_paket AS pk ON pk.id=j.paket_id
                    LEFT JOIN tb_bukti_pembayaran AS b ON b.pembayaran_id=p.id
                    LEFT JOIN tb_pengajar AS pj ON pj.id=p.pengajar_id
                    WHERE
                      p.pembayaran_status='1'
                    ORDER BY
                      p.created_at";

                    $result = mysql_query($query) or die(mysql_error());
                    $rowcount = mysql_num_rows($result);
                    $nomer = 1;

                    if($rowcount > 0){
                      while($row = mysql_fetch_array($result)){
                  ?>

                <tr>
                  <td><?php echo $nomer;?></td>
                  <td><?php echo $row['nama_siswa'];?></td>
                  <td>
                    <?php 
                      if($row['pembayaran_metode'] == 1){
                        echo "Cash";
                      } 
                      elseif ($row['pembayaran_metode'] == 2) {
                        echo "Transfer";
                      }
                    ?>
                  </td>
                  <td><?php echo $row['nama_cabang'];?></td>
                  <td><?php echo $row['nama_paket'];?></td>
                  <td><?php echo date_format(date_create($row['created_at']), 'j/n/Y G:i');?></td>
                  <td><?php echo "Rp. " . $row['jumlah'];?></td>
                  <td>
                    <?php 
                      if($row['pembayaran_metode'] == 1){
                        echo $row['nama_pengajar'];
                      } 
                      elseif ($row['pembayaran_metode'] == 2) {
                        echo "-";
                      }
                    ?>
                  </td>
                  <td>
                    <?php 
                      if($row['pembayaran_metode'] == 1){
                        echo "-";
                      } 
                      elseif ($row['pembayaran_metode'] == 2) {
                        ?>
                        <a target="_blank" class="btn btn-default" href="<?=$IMG_PEMBAYARAN . $row['image'];?>">
                          <i class="fa fa-eye"></i> Lihat Bukti
                        </a>
                        <?php
                      }
                    ?>
                  </td>
                  <td>
                    <div class="btn-group-vertical">
                      <input name='id' id='id' value='".$id."' type='hidden'>
                      <button type="button" class="btn btn-default"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="Javascript:window.location.href = 'function/pembayaran_valid.php?id= <?php echo $row['id'] ?>';"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-check text-green"></i> Valid
                        </div>
                      </button>
                      <button type="button" class="btn btn-default"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="Javascript:window.location.href = 'function/pembayaran_invalid.php?id= <?php echo $row['id'] ?>';"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-close text-red"></i> Tidak
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
                  <th>Nama Siswa</th>
                  <th>Jenis</th>
                  <th>Cabang</th>
                  <th>Program Edukasi</th>
                  <th>Periode Waktu</th>
                  <th>Invoice</th>
                  <th>Penerima Cash</th>
                  <th>Bukti Transfer</th>
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
</body>
</html>
