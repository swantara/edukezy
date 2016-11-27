<?php
include 'function/session.php';
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" type="image/x-icon" href="dist/img/favicon.ico">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Edukezy | Artikel</title>
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
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

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
                <small>Edit Artikel</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <!-- About Me Box -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Data Artikel</h3>
                        </div>
                        <!-- /.box-header -->

                        <?php
                        $id_param = $_GET['id'];
                        include 'function/connection.php';
                        $query = "SELECT 
                            a.* 
                        FROM 
                            tb_artikel AS a
                        WHERE a.id=$id_param";
                        $result = mysql_query($query) or die(mysql_error());

                        $rowcount = mysql_num_rows($result);

                        if($rowcount > 0) {
                            while ($row = mysql_fetch_array($result)) {
                                ?>

                            <form action="function/update_artikel.php" method="post" enctype="multipart/form-data">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="fotoArtikel">Foto artikel</label>
                                        <input name="foto" type="file" value="fotoArtikel">
                                    </div>
                                    <div class="form-group">
                                        <label for="judulArtikel">Judul Artikel</label>
                                        <input name="judul" type="text" class="form-control" id="judulArtikel"
                                               value="<?= $row['judul']; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label for="judulArtikel">Author</label>
                                        <input name="author" type="text" class="form-control"
                                               value="<?= $row['author']; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label>Konten</label>
                                        <textarea id="konten" name="konten">
                                            <?= $row['content']; ?>
                                        </textarea>
                                    </div>
                                    <!-- /.form group -->
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <input name="id" type="hidden" value="<?=$id_param;?>">
                                    <a href="artikel.php" class="btn btn-default"><i class="fa fa-close"></i> Cancel</a>
                                    <button type="submit" class="btn btn-primary pull-right"><i
                                            class="fa fa-check"></i> Submit
                                    </button>
                                </div>
                            </form>
                        <?php
                            }
                        }
                        ?>
                        <!-- /.box-footer -->
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
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- CK Editor -->
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script>
    $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('konten');
    });
</script>
</body>
</html>
