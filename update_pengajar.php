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
  <!-- daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
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
        <small>Update Data Pengajar</small>
      </h1>
      <ol class="breadcrumb">
        <li class="active"><a href="#"><i class="fa fa-reply"></i> Kembali</a></li>
      </ol>
    </section>

    <section class="content">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Profil</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
        <form action="function/update_pengajar.php" method="post">
          <div class="row">
            <div class="col-md-6">

            <?php
              $id_param = $_GET["id"];
              include 'function/connection.php';
              $query = "SELECT 
                p.*,
                u.email,
                c.nama AS nama_cabang
              FROM 
                tb_pengajar AS p
              JOIN tb_users AS u ON u.id=p.user_id
              LEFT JOIN tb_cabang AS c on c.id=p.zona_id
              WHERE
                p.id=$id_param";
              $result = mysql_query($query) or die(mysql_error());
              $rowcount = mysql_num_rows($result);

              if($rowcount > 0){
                while($row = mysql_fetch_array($result)){
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
                <img class="profile-user-img img-responsive img-circle" src="<?=$IMG_PENGAJAR . $row['photo'];?>" alt="User profile picture">
                <?php 
                  }
                ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="namaPengajar">Nama</label>
                <input type="text" class="form-control" id='namaPengajar' name='namaPengajar' value="<?php echo $row['fullname'];?>">
              </div>
              <div class="form-group">
                <label for="alamatPengajar">Alamat</label>
                <input type="text" class="form-control" id='alamatPengajar' name='alamatPengajar' value="<?php echo $row['pengajar_alamat'];?>">
              </div>
              <div class="form-group">
                <label for="zona_id">Cabang</label>
                <select name="zona_id" class="form-control">
                  <option value="<?= $row['zona_id'];?>" selected><?php echo $row['nama_cabang'];?></option>
                <?php
                  include 'function/connection.php';
                  $queryB = "SELECT 
                    c.*
                  FROM 
                    tb_cabang AS c
                  ORDER BY c.nama";
                  $resultB = mysql_query($queryB) or die(mysql_error());

                  $rowcountB = mysql_num_rows($resultB);

                  if($rowcountB > 0){
                    while($rowB = mysql_fetch_array($resultB)){
                      if($rowB['id']!=$row['zona_id']){
                ?>
                  <option value="<?= $rowB['id'];?>"><?= $rowB['nama'];?></option>
                <?php
                      }
                    }
                  }  
                ?>
                </select>
              </div>   
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id='email' name='email' disabled value="<?php echo $row['email'];?>">
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="telp">No Telp</label>
                <input type="text" class="form-control" id='telp' name='telp' value="<?php echo $row['pengajar_cp'];?>">
              </div>
              <div class="form-group">
                <label for="pendidikanPengajar">Pendidikan Pengajar</label>
                <input name="pendidikanPengajar" type="text" class="form-control" id="pendidikanPengajar" value="<?php echo $row['pengajar_pendidikan'];?>">
              </div>
              <div class="form-group">
                <label>Mata Pelajaran</label>
                <select class="form-control select2" id='mapelPengajar' name='mapelPengajar[]' multiple="multiple" data-placeholder="Pilih Mata Pelajaran" style="width: 100%;">

                  <?php
                    include 'function/connection.php';
                    $queryC = "SELECT 
                      mp.*,
                      m.nama AS nama_mapel,
                      tp.nama AS tingkat
                    FROM tb_mapel_pengajar AS mp
                    JOIN tb_mapel AS m ON m.id=mp.mapel_id
                    JOIN tb_tingkat_pendidikan AS tp ON tp.id=m.tingkat_pendidikan
                    WHERE mp.pengajar_id=$id_param";
                    $resultC = mysql_query($queryC) or die(mysql_error());
                    $rowcountC = mysql_num_rows($resultC);
                    $i=0;
                    $mapelArray = NULL;

                    if($rowcountC > 0){
                      while($rowC = mysql_fetch_array($resultC)){
                        $mapelArray[$i] = $rowC['mapel_id'];
                        $i++;
                  ?>

                  <option value="<?= $rowC['mapel_id'];?>" selected><?php echo $rowC['nama_mapel'] . " (" . $rowC['tingkat'] . ")";?></option>

                  <?php
                      }
                    }
                  ?>

                  <?php
                    if(!is_null($mapelArray)){
                      $mapelPengajar = implode(", ", $mapelArray);
                    }
                    else{
                      $mapelPengajar = "";
                    }
                    include 'function/connection.php';
                    $queryD = "SELECT 
                      m.*,
                      tp.nama AS tingkat
                    FROM tb_mapel AS m
                    JOIN tb_tingkat_pendidikan AS tp ON tp.id=m.tingkat_pendidikan
                    WHERE m.id NOT IN ('$mapelPengajar')
                    ORDER BY m.nama";
                    $resultD = mysql_query($queryD) or die(mysql_error());
                    $rowcountD = mysql_num_rows($resultD);

                    if($rowcountD > 0){
                      while($rowD = mysql_fetch_array($resultD)){
                  ?>
                  
                  <option value="<?= $rowD['id'];?>"><?php echo $rowD['nama'] . " (" . $rowD['tingkat'] . ")";?></option>

                  <?php
                      }
                    }
                  ?>

                </select>
              </div>
            </div>
          </div>
        </div>           

        <?php
          }
          }
        ?>

        <!-- /.box-body -->
        <div class="box-footer">
          <input name="id" type="hidden" value="<?=$id_param;?>">
          <a href="user_pengajar.php" class="btn btn-default"><i class="fa fa-close"></i> Cancel</a>
          <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-check"></i> Submit</button>
        </div>
      </form>
      </div>
    </section>

  </div>

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
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page script -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>
</body>
</html>
