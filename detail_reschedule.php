<?php
include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Edukezy | Detail Rubah Jadwal</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
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

    <?php
        $id_req = $_GET['id'];
        $qReq = 'SELECT
                    r.*,
                    s.fullname AS nama_siswa,
                    p.fullname AS nama_pengajar,
                    dj.jadwal_id, dj.tgl_pertemuan AS old_tgl_pertemuan, dj.waktu_mulai AS old_waktu_mulai, dj.tempat AS old_tempat, dj.pertemuan,
                    j.mapel_id,
                    m.nama AS nama_mapel,
                    t.nama AS nama_tingkat
                FROM tb_request AS r
                JOIN tb_siswa AS s ON s.id = r.siswa_id
                JOIN tb_pengajar AS p ON p.id = r.pengajar_id
                JOIN tb_detail_jadwal AS dj ON dj.id = r.dt_jadwal_id
                JOIN tb_jadwal AS j ON j.id = dj.jadwal_id
                JOIN tb_mapel AS m ON m.id = j.mapel_id
                JOIN tb_tingkat_pendidikan AS t ON t.id = m.tingkat_pendidikan
                WHERE type = "RS" AND r.id="'.$id_req.'"';
        $rReq = mysql_query($qReq) or die(mysql_error());
        $rReq = mysql_fetch_array($rReq);
        $status = array('0'=>'<span style="color: grey;">Selesai</span>','1'=>'<span style="color: green;">Proses</span>','2'=>'<span style="color: blue;">Permintaan Baru</span>');
        //var_dump(mysql_fetch_array($rReq));
    ?>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Edukezy
                <small>Detail Siswa</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-check"></i> Note:</h4>
                Mohon untuk menghubungi siswa dan pengajar sebelum menentukan keputusan.
            </div>
            <div class="row">
                <div class="col-md-6">

                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Jadwal Lama</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <strong><i class="fa fa-envelope margin-r-5"></i>Mapel</strong>
                            <p><?php echo $rReq['nama_mapel'] ?> (<?= $rReq['nama_tingkat'] ?>)</p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Nama Siswa</strong>
                            <p><a href="detail_siswa.php?id=<?= $rReq['siswa_id'] ?>"><?= $rReq['nama_siswa'] ?></a></p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Nama Pengajar</strong>
                            <p><a href="detail_pengajar.php?id=<?= $rReq['pengajar_id'] ?>"><?= $rReq['nama_pengajar'] ?></a></p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Tanggal Pertemuan</strong>
                            <p><?= date("d/m/Y",strtotime($rReq['old_tgl_pertemuan'])) ?></p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Waktu Pertemuan</strong>
                            <p><?= date("H:i",strtotime($rReq['old_waktu_mulai'])) ?> WITA</p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Tempat Pertemuan</strong>
                            <p><?= $rReq['old_tempat'] ?></p>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
                <div class="col-md-6">
                    <!-- About Me Box -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Permintaan Jadwal</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <strong><i class="fa fa-envelope margin-r-5"></i>Tanggal Pertemuan</strong>
                            <p><?= date("d/m/Y",strtotime($rReq['tgl_pertemuan'])) ?></p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Waktu Pertemuan</strong>
                            <p><?= date("H:i",strtotime($rReq['jam_pertemuan'])) ?> WITA</p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Tempat Pertemuan</strong>
                            <p><?= $rReq['tempat'] ?></p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Keterangan</strong>
                            <p><?= $rReq['keterangan'] ?></p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Status</strong>
                            <p><?= $status[$rReq['status']] ?></p>
                            <hr>
                            <strong><i class="fa fa-envelope margin-r-5"></i>Diajukan Oleh</strong>
                            <p><?= $rReq['request_by'] ?></p>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <?php if($rReq['old_tempat']==2): ?>
            <div class="row">
                <div class="col-md-2">
                    <a href="function/approve_reschedule.php?id=<?= $rReq['id'] ?>" class="btn btn-block btn-success">Setujui Permintaan</a>
                </div>
                <div class="col-md-2">
                    <a href="function/cancel_reschedule.php?id=<?= $rReq['id'] ?>" class="btn btn-block btn-warning">Batalkan Permintaan</a>
                </div>
            </div>
            <?php endif; ?>
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
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.0 -->
<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
