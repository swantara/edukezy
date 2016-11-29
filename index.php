<?php 
  include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edukezy | Dashboard</title>
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

  <link rel="manifest" href="/manifest.json">
  <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async></script>
  <script>
    var OneSignal = window.OneSignal || [];
    OneSignal.push(["init", {
      appId: "35aab1a1-3fdc-4696-9efe-1c151c5072f4",
      autoRegister: false,
      notifyButton: {
        enable: true /* Set to false to hide */
      }
    }]);
  </script>

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
        <small>Home</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="callout callout-info">

        <?php
          if($_SESSION['type']=="AD"){
            echo "<h4>Selamat Datang, " . $_SESSION['username'] . "!</h4>";
            echo "Anda Telah Masuk di Panel Admin Kantor Pusat";
          }
          elseif($_SESSION['type']=="OW"){
            echo "<h4>Selamat Datang, " . $_SESSION['username'] . "!</h4>";
            echo "Anda Telah Masuk di Panel Owner Cabang " . $_SESSION['cabang'];
          }
          $month=date('m');
        ?>

      </div>

      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-body">

            <?php
              if($_SESSION['type']=="AD"){
                include 'dashboard.php';
              }
              elseif($_SESSION['type']=="OW"){
                include 'dashboard_owner.php';
              }
            ?>

            </div>
          </div>
          <!-- /.box -->
        </div>
      </div>

      <div class="callout callout-success">
        <h4>Total Summary Seluruh Cabang</h4>
        <p>Klik detail untuk melihat informasi yang lebih lengkap</p>
      </div>

      <!-- /.row -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            </div>
            <!-- /.box-header -->
            <div class="box-body" id="exportable">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="width: 10px">No</th>
                  <th style="width: 200px">Cabang</th>
                  <th style="width: 100px">Jml Siswa</th>
                  <th style="width: 100px">Jml Pengajar</th>
                  <th>Pembayaran</th>
                  <th>Akun Owner</th>
                  <th style="width: 10px">Act</th>
                </tr>
                </thead>
                <tbody>
                <?php
                  include 'function/connection.php';
                  $query = "SELECT 
                    c.*
                  FROM 
                    tb_cabang AS c";
                  $result = mysql_query($query) or die(mysql_error());

                  $rowcount = mysql_num_rows($result);
                  $nomer = 1;

                  if($rowcount > 0){
                    while($row = mysql_fetch_array($result)){
                      ?>
                      <tr>
                        <input name='id' id='id' value='".$id."' type='hidden'>
                        <td><?php echo $nomer;?></td>
                        <td><?php echo $row['nama'];?></td>
                        <td>

                        <?php
                          $cabang_param = $row['id'];
                          include 'function/connection.php';
                          $queryB = "SELECT 
                            s.*,
                            u.*
                          FROM 
                            tb_siswa AS s
                          JOIN tb_users AS u on u.id = s.user_id
                          WHERE 
                            zona_id = $cabang_param
                          AND 
                            u.type = 'SW'
                          AND
                            u.status = '1'";
                          $resultB = mysql_query($queryB) or die(mysql_error());
                          $rowcountB = mysql_num_rows($resultB);
                          if($rowcountB>0){
                            echo $rowcountB . " orang";
                          }
                          else{
                            echo "-";
                          }
                        ?>

                        </td>

                        <td>

                        <?php
                          $cabang_param = $row['id'];
                          include 'function/connection.php';
                          $queryC = "SELECT 
                            p.*,
                            u.*
                          FROM 
                            tb_pengajar AS p
                          JOIN tb_users AS u on u.id = p.user_id
                          WHERE 
                            zona_id = $cabang_param
                          AND 
                            u.type = 'PG'
                          AND
                            u.status = '1'";
                          $resultC = mysql_query($queryC) or die(mysql_error());
                          $rowcountC = mysql_num_rows($resultC);
                          if($rowcountC>0){
                            echo $rowcountC . " orang";
                          }
                          else{
                            echo "-";
                          }
                        ?>

                        </td>

                        <td>

                        <?php
                          $cabang_param = $row['id'];
                          include 'function/connection.php';
                          $queryD = "SELECT 
                            SUM(p.jumlah) AS total_pembayaran
                          FROM 
                            tb_pembayaran AS p
                          JOIN tb_siswa AS s ON s.id=p.siswa_id
                          WHERE
                            s.zona_id = $cabang_param";
                          $resultD = mysql_query($queryD) or die(mysql_error());
                          $rowcountD = mysql_num_rows($resultD);
                          if($rowcountD > 0){
                            while($rowD = mysql_fetch_array($resultD)){
                              if(isset($rowD['total_pembayaran'])){
                                echo "Rp. " . number_format($rowD['total_pembayaran']);
                              }
                              else{
                                echo "-";
                              }
                            }
                          }
                        ?>

                        </td>

                        <td>
                        <?php
                          $cabang_param = $row['id'];
                          include 'function/connection.php';
                          $queryE = "SELECT 
                            o.*
                          FROM 
                            tb_owner AS o
                          WHERE
                            o.zona_id = $cabang_param";
                          $resultE = mysql_query($queryE) or die(mysql_error());
                          $rowcountE = mysql_num_rows($resultE);
                          if($rowcountE > 0){
                            while($rowE = mysql_fetch_array($resultE)){
                              echo $rowE['fullname'] . " (" . $rowE['owner_cp'] . ") <br/>";
                            }
                          }
                          else{
                            echo "-";
                          }
                        ?>
                        </td>

                        <td>
                          <div class="btn-group-vertical">
                            <button type="button" class="btn btn-default" name='detail_$id' onClick="Javascript:window.location.href = 'detail_summary_cabang.php?id=<?php echo $row['id'] ?>';">
                              <div class="pull-left">
                                <i class="fa fa-eye"></i> Detail
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
                  <th>Cabang</th>
                  <th>Jml Siswa</th>
                  <th>Jml Pengajar</th>
                  <th>Pembayaran</th>
                  <th>Akun Owner</th>
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
    <!-- /.content -->
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
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
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
<!-- excel -->
<script src="https://rawgithub.com/eligrey/FileSaver.js/master/FileSaver.js" type="text/javascript"></script>
<script>
function export() {
  var blob = new Blob([document.getElementById('exportable').innerHTML], {
    type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"
  });
  saveAs(blob, "report.xls");
}
</script>
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