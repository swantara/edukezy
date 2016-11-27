<?php
include 'function/session.php';
include 'function/connection.php';

?>

<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Edukezy | Rubah Jadwal</title>
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
                <small>Kelola Permintaan Rubah Jadwal</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <?php if(isset($_SESSION['success'])): ?>
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-check"></i> Note:</h4>
                    <?= $_SESSION['success'] ?>
                </div>
            <?php unset($_SESSION['success']); endif; ?>

            <?php if(isset($_SESSION['error'])): ?>
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-check"></i> Note:</h4>
                    <?= $_SESSION['error'] ?>
                </div>
            <?php unset($_SESSION['error']); endif; ?>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">

                            <?php
                                $query = 'SELECT
                                                r.*,
                                                s.fullname AS nama_siswa,
                                                p.fullname AS nama_pengajar
                                            FROM tb_request AS r
                                            JOIN tb_siswa AS s ON s.id = r.siswa_id
                                            JOIN tb_pengajar AS p ON p.id = r.pengajar_id
                                            WHERE type = "RS"
                                            ORDER BY id DESC';
                                $result = mysql_query($query) or die(mysql_error());
                                //die(var_dump(mysql_fetch_array($result)));
                                $rowcount = mysql_num_rows($result);
                                $no = 1;
                                $status = array('0'=>'<span style="color: grey;">Selesai</span>','1'=>'<span style="color: green;">Proses</span>','2'=>'<span style="color: blue;">Permintaan Baru</span>');
                            ?>

                            <?php if($rowcount>0): ?>
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama Siswa</th>
                                    <th>Nama Pengajar</th>
                                    <th>Diajukan Oleh</th>
                                    <th>Tgl Pertemuan Baru</th>
                                    <th>Waktu Pertemuan Baru</th>
                                    <th>Tempat Pertemuan Baru</th>
                                    <th>Status</th>
                                    <th>Tanggal Permintaan</th>
                                    <th>Act</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php while($row = mysql_fetch_array($result)):?>
                                    <tr>
                                        <td><?= $no; ?></td>
                                        <td><a href="detail_siswa.php?id=<?= $row['siswa_id'] ?>"> <?= $row['nama_siswa'] ?> </a></td>
                                        <td><a href="detail_pengajar.php?id=<?= $row['pengajar_id'] ?>"> <?= $row['nama_pengajar'] ?> </a></td>
                                        <td><?= $row['request_by'] ?></td>
                                        <td><?= date("d/m/Y",strtotime($row['tgl_pertemuan'])) ?></td>
                                        <td><?= date("H:i",strtotime($row['jam_pertemuan'])) ?> WITA</td>
                                        <td><?= $row['tempat'] ?></td>
                                        <td><?= $status[$row['status']] ?></td>
                                        <td><?= date("d/m/Y",strtotime($row['created_at'])) ?></td>
                                        <td>
                                            <button type="button" class="btn btn-primary"
                                                <?php if($_SESSION['status']!=4){ ?>
                                                    onClick="Javascript:window.location.href = 'detail_reschedule.php?id=<?php echo $row['id'] ?>';"
                                                <?php } ?>>
                                                <div class="pull-left">
                                                    <i class="fa fa-edit"></i> Detail
                                                </div>
                                            </button>
                                        </td>
                                    </tr>
                                <?php $no++; endwhile; ?>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>No</th>
                                    <th>Nama Siswa</th>
                                    <th>Nama Pengajar</th>
                                    <th>Diajukan Oleh</th>
                                    <th>Tgl Pertemuan Baru</th>
                                    <th>Waktu Pertemuan Baru</th>
                                    <th>Tempat Pertemuan Baru</th>
                                    <th>Status</th>
                                    <th>Tanggal Permintaan</th>
                                    <th>Act</th>
                                </tr>
                                </tfoot>
                            </table>
                            <?php else: ?>

                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-check"></i> Note:</h4>
                                    Tidak ada permintaan yang tersedia saat ini.
                                </div>

                            <?php endif; ?>
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
