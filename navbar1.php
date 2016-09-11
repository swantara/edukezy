<!-- Left side column. contains the logo and sidebar -->
  <?php
    $id_param = $_SESSION['id'];
    include 'function/connection.php';
    $query = "SELECT 
      u.*,
      a.fullname AS nama_admin,
      o.fullname AS nama_owner,
      c.nama AS nama_cabang
    FROM 
      tb_users AS u
    LEFT JOIN tb_admin AS a ON a.admin_id=u.id
    LEFT JOIN tb_owner AS o ON o.owner_id=u.id
    LEFT JOIN tb_cabang AS c ON c.id=o.zona_id
    WHERE
      u.id=$id";
    $result = mysql_query($query) or die(mysql_error());

    $rowcount = mysql_num_rows($result);

    if($rowcount > 0){
      while($row = mysql_fetch_array($result)){
  ?>
          
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?= $row['nama_admin'] ?></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Admin</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header"> MENU</li>
        <li class="active"><a href="index.php"><i class="fa fa-home"></i> <span> Home</span></a></li>
        <li><a href="calon_pengajar.php"><i class="fa fa-users"></i> <span> Calon Pengajar</span></a></li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i> <span> Kelola User</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="user_pengajar.php"><i class="fa fa-briefcase"></i> Admin</a></li>
            <li><a href="user_siswa.php"><i class="fa fa-child"></i> Siswa</a></li>
            <li><a href="user_pengajar.php"><i class="fa fa-user"></i> Pengajar</a></li>
          </ul>
        </li>
        <li><a href="kelola_cabang.php"><i class="fa fa-sitemap"></i> <span> Kelola Cabang</span></a></li>
        <li><a href="program.php"><i class="fa fa-th"></i> <span> Program Edukasi</span></a></li>
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
        <li><a href="artikel.php"><i class="fa fa-edit"></i> <span> Artikel dan Broadcast</span></a></li>
        <li class="header"> LOGOUT</li>
        <li><a href="function/logout.php"><i class="fa fa-power-off text-red"></i> <span> Logout</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <?php
      }
    }
  ?>