<div class="row">
  <div class="col-xs-12">
    <h4> Bulan ini </h4>
    <hr/>
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-aqua">
        <span class="info-box-icon"><i class="fa fa-user-plus"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Register</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              u.* 
            FROM 
              tb_users AS u
            WHERE 
              u.type = 'SW'
            AND
              month(u.created_at) = $month";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);
          ?>
          <span class="info-box-number">
          <?php 
            if($rowcount>0){
              echo $rowcount;
            }
            else{
              echo "-";
            }
          ?>  
          </span>
          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Member Siswa Baru
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-green">
        <span class="info-box-icon"><i class="fa fa-calendar"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Jadwal</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              dt.* 
            FROM 
              tb_detail_jadwal AS dt
            WHERE
              month(dt.tgl_pertemuan) = $month";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);
          ?>
          <span class="info-box-number">
          <?php 
            if($rowcount>0){
              echo number_format($rowcount);
            }
            else{
              echo "-";
            }
          ?> 
          </span>
          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Jadwal Mengajar
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-yellow">
        <span class="info-box-icon"><i class="fa fa-calendar-plus-o"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Program Edukasi</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              j.* 
            FROM 
              tb_jadwal AS j
            WHERE
              month(j.created_at) = $month";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);
          ?>
          <span class="info-box-number">
          <?php 
            if($rowcount>0){
              echo number_format($rowcount);
            }
            else{
              echo "-";
            }
          ?>
          </span>
          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Dipesan Member
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-red">
        <span class="info-box-icon"><i class="fa fa-check-square-o"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Pembayaran</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              SUM(p.jumlah) AS total_pembayaran
            FROM 
              tb_pembayaran AS p
            WHERE
              month(p.created_at) = $month";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);

            if($rowcount > 0){
              while($row = mysql_fetch_array($result)){
          ?>
          <span class="info-box-number">
          <?php 
            if(isset($row['total_pembayaran'])){
              echo "Rp. " . number_format($row['total_pembayaran']);
            }
            else{
              echo "-";
            }
              }
            }
          ?>
          </span>

          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Pembayaran Invoice
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <hr/>
    <h4> Total </h4>
    <hr/>
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-aqua">
        <span class="info-box-icon"><i class="fa fa-user-plus"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Register</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              u.* 
            FROM 
              tb_users AS u
            WHERE 
              u.type = 'SW'";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);
          ?>
          <span class="info-box-number">
          <?php 
            if($rowcount>0){
              echo number_format($rowcount);
            }
            else{
              echo "-";
            }
          ?>  
          </span>
          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Member Siswa Baru
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-green">
        <span class="info-box-icon"><i class="fa fa-calendar"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Jadwal</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              dt.* 
            FROM 
              tb_detail_jadwal AS dt";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);
          ?>
          <span class="info-box-number">
          <?php 
            if($rowcount>0){
              echo number_format($rowcount);
            }
            else{
              echo "-";
            }
          ?> 
          </span>
          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Jadwal Mengajar
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-yellow">
        <span class="info-box-icon"><i class="fa fa-calendar-plus-o"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Program Edukasi</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              j.* 
            FROM 
              tb_jadwal AS j";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);
          ?>
          <span class="info-box-number">
          <?php 
            if($rowcount>0){
              echo number_format($rowcount);
            }
            else{
              echo "-";
            }
          ?>
          </span>
          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Dipesan Member
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-md-3 col-sm-6 col-xs-12">
      <div class="info-box bg-red">
        <span class="info-box-icon"><i class="fa fa-check-square-o"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Pembayaran</span>
          <?php
            include 'function/connection.php';
            $query = "SELECT 
              SUM(p.jumlah) AS total_pembayaran
            FROM 
              tb_pembayaran AS p";
            $result = mysql_query($query) or die(mysql_error());
            $rowcount = mysql_num_rows($result);

            if($rowcount > 0){
              while($row = mysql_fetch_array($result)){
          ?>
          <span class="info-box-number">
          <?php 
            if(isset($row['total_pembayaran'])){
              echo "Rp. " . number_format($row['total_pembayaran']);
            }
            else{
              echo "-";
            }
              }
            }
          ?>
          </span>
          <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
          </div>
              <span class="progress-description">
                Pembayaran Invoice
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
  </div>
</div>