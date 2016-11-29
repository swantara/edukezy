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
        <small>Pembayaran</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="box box-primary">
      <form>
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
                  $tgl_lahir = date_format(date_create($row['tgl_lahir']), "d-m-Y")
            ?>

              <div class="form-group">
                <?php
                  if($row['photo']==NULL){
                ?>
                <img class="profile-user-img img-responsive img-circle" src="dist/img/no-image.jpg" alt="User profile picture">
                <?php 
                  }
                  else{
                ?>
                <img class="profile-user-img img-responsive img-circle" src="<?=$IMG_SISWA . $row['photo'];?>" alt="User profile picture">
                <?php 
                  }
                ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="namaSiswa">Nama</label>
                <input name="nama" type="text" disabled  class="form-control" id="namaSiswa" value="<?php echo $row['fullname'];?>">
              </div>
              <div class="form-group">
                <label for="alamatSiswa">Alamat</label>
                <input name="alamat" type="text" disabled  class="form-control" id="alamatSiswa" value="<?php echo $row['alamat'];?>">
              </div>
              <div class="form-group">
                <label for="zona_id">Cabang</label>
                <input name="zona_id" type="text" disabled  class="form-control" id="zona_id" value="<?php echo $row['nama_cabang'];?>">
              </div>
              <div class="form-group">
                <label for="email">Email</label>
                <input name="email" type="email" disabled class="form-control" id="email" value="<?php echo $row['email'];?>">
              </div>
              <div class="form-group">
                <label for="telp">No Telp</label>
                <input name="telp" type="text" disabled  class="form-control" id="telp" value="<?php echo $row['siswa_cp'];?>">
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="ortuWali">Orang Tua / Wali</label>
                <input name="ortu" type="text" disabled  class="form-control" id="ortuWali" value="<?php echo $row['siswa_wali'];?>">
              </div>
              <div class="form-group">
                <label for="tingkatPendidikan">Tingkat Pendidikan</label>
                <input name="tingkatPendidikan" type="text" disabled  class="form-control" id="tingkatPendidikan" value="<?php echo $row['tingkat'];?>">
              </div>
              <div class="form-group">
                <label for="tempatLahir">Tempat Lahir</label>
                <input name="tempatLahir" type="text" disabled  class="form-control" id="tempatLahir" value="<?php echo $row['tempat_lahir'];?>">
              </div>
              <!-- Date -->
              <div class="form-group">
                <label>Tanggal Lahir</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input name="tglLahir" type="text" disabled  class="form-control pull-right" id="datepicker" data-date-format='dd-mm-yyyy' value="<?php echo $tgl_lahir ;?>">
                </div>
                <!-- /.input group -->
              </div>
            </div>
          </div>
        </div>           
      </form>
      </div>
      <!-- /.box -->

       <?php
                }
              }
            ?>

    </section>
    <!-- /.content -->

    <section class="content">
      <div class="alert alert-warning alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-info"></i> Info:</h4>
        Berikut adalah list tagihan siswa.
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
                  <th>Program Edukasi</th>
                  <th>Periode Waktu</th>
                  <th>Invoice</th>
                  <th style="width: 10px">Act</th>
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
                    AND 
                      p.siswa_id=$id_param
                    ORDER BY
                      p.created_at";

                    $result = mysql_query($query);
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
                  <td><?php echo $row['nama_paket'];?></td>
                  <td><?php echo date_format(date_create($row['created_at']), 'j/n/Y G:i');?></td>
                  <td><?php echo "Rp. " . $row['jumlah'];?></td>
                  <td>
                    <div class="btn-group-vertical">
                      <input name='id_siswa' id='id_siswa' value='".$siswa_id."' type='hidden'>
                      <input name='id' id='id' value='".$id."' type='hidden'>
                      <button type="button" class="btn btn-default"
                      <?php if($_SESSION['status']!=4){ ?>
                        onClick="bayarPrompt(<?=$row['id']?>)"
                      <?php } ?>>
                        <div class="pull-left">
                          <i class="fa fa-check text-green"></i> Bayar
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
function bayarPrompt(id){
  var prompt = confirm("Pilih OK untuk melanjutkan.")
  if(prompt == true){
    Javascript:window.location.href = 'function/pembayaran_siswa.php?id='+id;
  }
}
</script>
</body>
</html>
