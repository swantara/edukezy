<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
        <?php
          $id_owner = $_SESSION['id'];
          include 'function/connection.php';
          $query = "SELECT 
            o.*
          FROM 
            tb_owner AS o
          WHERE
            o.owner_id=$id_owner";
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
          <img class="img-circle" alt="User profile picture" src="<?=$IMG_OWNER . $row['photo'];?>">
        <?php 
              }
            }
          }    
        ?>
        </div>
        <div class="pull-left info">
          <input name='id' id='id' value='".$id."' type='hidden'>
          <p><a href="profil_owner.php?id= <?php echo $id_owner;?>"><?= $_SESSION['username'] ?></a></p>
          <a><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header"> MENU</li>
        <li><a href="index.php"><i class="fa fa-home"></i> <span> Home</span></a></li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i> <span> Informasi User</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="user_siswa_owner.php"><i class="fa fa-child"></i> Siswa</a></li>
            <li><a href="user_pengajar_owner.php"><i class="fa fa-user"></i> Pengajar</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-check"></i> <span> Pembayaran</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="invoice_owner.php"><i class="fa fa-list"></i> Pembayaran Belum Verifikasi</a></li>
            <li><a href="bayar_owner.php"><i class="fa fa-credit-card"></i> Pembayaran Terverifikasi</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-calendar"></i> <span> Jadwal dan Pertemuan</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="jadwal_owner.php"><i class="fa fa-calendar"></i> Informasi Jadwal</a></li>
            <li><a href="pertemuan_owner.php"><i class="fa fa-calendar-check-o"></i> Informasi Pertemuan</a></li>
          </ul>
        </li>
        <li><a href="rating_pengajar_owner.php"><i class="fa fa-star-o"></i> <span> Rating Pengajar</span></a></li>
        <li class="header"> LOGOUT</li>
        <li><a href="function/logout.php"><i class="fa fa-power-off text-red"></i> <span> Logout</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>