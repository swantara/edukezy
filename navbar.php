<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
        <?php
          $id_admin = $_SESSION['id'];
          include 'function/connection.php';
          $query = "SELECT 
            a.*
          FROM 
            tb_admin AS a
          WHERE
            a.admin_id=$id_admin";
          $result = mysql_query($query) or die(mysql_error());

          $rowcount = mysql_num_rows($result);

          if($rowcount > 0){
            while($row = mysql_fetch_array($result)){
              if($row['photo']==NULL){
        ?>
          <img class="img-circle" src="dist/img/no-image.jpg" alt="User profile picture">
        <?php 
              }
          else{
        ?>
          <img class="img-circle" alt="User profile picture" src="<?=$IMG_ADMIN . $row['photo'];?>">
        <?php
              }
            }
          }    
        ?>
        </div>
        <div class="pull-left info">
          <input name='id' id='id' value='".$id."' type='hidden'>
          <p><a href="profil_admin.php?id=<?php echo $id_admin;?>"><?= $_SESSION['username'] ?></a></p>
          <a><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header"> MENU</li>
        <li><a href="index.php"><i class="fa fa-home"></i> <span> Home</span></a></li>
        <li><a href="calon_pengajar.php"><i class="fa fa-users"></i> <span> Calon Pengajar</span></a></li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i> <span> Kelola User</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="user_admin.php"><i class="fa fa-briefcase"></i> Admin</a></li>
            <li><a href="user_pengajar.php"><i class="fa fa-user"></i> Pengajar</a></li>
            <li><a href="user_siswa.php"><i class="fa fa-child"></i> Siswa</a></li>
            <li><a href="user_owner.php"><i class="fa fa-users"></i> Owner</a></li>
          </ul>
        </li>
        <li><a href="kelola_cabang.php"><i class="fa fa-sitemap"></i> <span> Kelola Cabang</span></a></li>
        <li><a href="program.php"><i class="fa fa-th"></i> <span> Program Edukasi</span></a></li>
        <li><a href="mapel.php"><i class="fa fa-list"></i> <span> Mata Pelajaran</span></a></li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-check"></i> <span> Pembayaran</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="invoice.php"><i class="fa fa-list"></i> Verifikasi Pembayaran</a></li>
            <li><a href="bayar.php"><i class="fa fa-credit-card"></i> Informasi Pembayaran</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-calendar"></i> <span> Jadwal dan Pertemuan</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="jadwal.php"><i class="fa fa-calendar"></i> Informasi Jadwal</a></li>
            <li><a href="pertemuan.php"><i class="fa fa-calendar-check-o"></i> Informasi Pertemuan</a></li>
          </ul>
        </li>
        <li><a href="rating_pengajar.php"><i class="fa fa-star-o"></i> <span> Rating Pengajar</span></a></li>
        <li><a href="artikel.php"><i class="fa fa-edit"></i> <span> Artikel</span></a></li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-check"></i> <span> Request Jadwal</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="reschedule.php"><i class="fa fa-list"></i> Rubah Jadwal</a></li>
            <li><a href="canceljadwal.php"><i class="fa fa-credit-card"></i> Pembatalan Jadwal</a></li>
          </ul>
        </li>
        <li class="header"> LOGOUT</li>
        <li><a href="function/logout.php"><i class="fa fa-power-off text-red"></i> <span> Logout</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>