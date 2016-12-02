-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2016 at 09:51 PM
-- Server version: 10.0.28-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `edukezyc_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE IF NOT EXISTS `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `admin_alamat` text NOT NULL,
  `admin_cp` char(12) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `admin_id`, `fullname`, `photo`, `admin_alamat`, `admin_cp`, `created_at`, `updated_at`) VALUES
(1, 13, 'I Nyoman Swantara', NULL, 'Kapal, Mengwi', '082144702247', '2016-09-07 16:15:09', '2016-11-15 01:14:55'),
(6, 283, 'Kak Nanda', NULL, 'Jalan Pulau Misol No 66 Denpasar', '081338288886', '2016-10-30 11:30:11', NULL),
(5, 259, 'Hery Santosa', NULL, 'Singaraja', '087762701785', '2016-09-27 06:41:14', '2016-09-27 08:37:37'),
(8, 286, 'Staff Admin Edukezy', NULL, 'Jln. Katrangan N0. 52 Denpasar', '085792518780', '2016-11-02 01:58:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_archive_jadwal`
--

CREATE TABLE IF NOT EXISTS `tb_archive_jadwal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_jadwal_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `tgl_pertemuan` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_area`
--

CREATE TABLE IF NOT EXISTS `tb_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propinsi_id` int(11) NOT NULL,
  `kabupaten_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_area`
--

INSERT INTO `tb_area` (`id`, `propinsi_id`, `kabupaten_id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Renon', '2016-08-03 05:44:57', NULL),
(2, 1, 2, 'Dalung', '2016-08-03 05:46:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_artikel`
--

CREATE TABLE IF NOT EXISTS `tb_artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover` varchar(50) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tb_artikel`
--

INSERT INTO `tb_artikel` (`id`, `cover`, `judul`, `content`, `author`, `created_at`, `updated_at`) VALUES
(4, '1479962076.jpg', 'Belajar Cepat dan Efektif dengan Metode Hypno-Learning', '<p>Hari ini, persaingan teknologi semakin ketat, seperti yang dialami dua kerajaan IT, Apple dan Microsoft. Setahun belum tersaingi produk lain bahkan oleh Microsoft, Apple kembali&nbsp;&nbsp;meluncurkan iPad yang lebih tipis dan canggih yakni iPad 2. Dari sinilah kita melihat bahwa Apple hari ini bukanlah Apple lima atau sepuluh tahun yang lalu. Apple sekarang telah mampu menyaingi produk-produk Microsoft. Steve Jobs telah begitu melesat mengejar ketinggalan atas rival terbesarnya itu, Bill Gates.&nbsp;</p>\r\n\r\n<p>Lantas apa yang membuat perkembangan Apple ini seperti grafik eksponensial? Hal ini tak luput dari peran Steve Jobs yang juga begitu cepat dalam mengenali dan mempelajari teknologi yang dibutuhkan orang masa kini.&nbsp;</p>\r\n\r\n<p>Ya, itulah hikmah yang perlu kita petik dari orang nomor satu di perusahaan Apple itu. Kecepatan adalah bagian terpenting dalam persaingan hidup ini, terutama dalam belajar.&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><em><strong>&quot;Bukan seberapa besar atau seberapa kecil kita, bukan seberapa pintar atau bodohnya kita, namun seberapa cepat kita belajar!&rdquo;</strong></em></p>\r\n</blockquote>\r\n\r\n<p>Namun masalahnya adalah, bagaimana cara mempelajari sesuatu dengan cepat dan efektif? Itulah yang menjadi inspirasi topik dalam pembahasan ini, yakni belajar cepat dengan metode&nbsp;<strong><em>Hypno-Learning</em>.</strong></p>\r\n\r\n<p><strong><em>Hypno-Learning</em></strong>&nbsp;merupakan metode pembelajaran menggunakan kemampuan bawah sadar kita. Dalam penelitian disimpulkan bahwa alam bawah sadar menyumbang 88 persen kecerdasan kita, lantas yang kebanyakan kita gunakan selama ini adalah 12 persennya saja. Dengan memanfaatkan potensi alam bawah sadar ini, akan menjadikan kita yang lemah menjadi kuat, yang lemas menjadi lebih bertenaga, yang kurang pintar menjadi lebih kreatif sebab belajar yang paling cepat dan efektif tak lain menggunakan kemampuan 88 persen itu. Semakin cepat kita belajar, semakin cepat mengejar prestasi gemilang dimana saja.&nbsp;</p>\r\n\r\n<p>Untuk membuka dan melatih alam bawah sadar kita, ada tips menarik dan pasti bisa dilakukan untuk membuka alam bawah sadar kita.&nbsp;</p>\r\n\r\n<p>Tips pertama adalah menjadi lebih&nbsp;<strong>aktif dalam belajar</strong>. Semakin kita aktif dalam kegiatan belajar, maka kegiatan tersebut akan menuntun untuk dekat dengan alam bawah sadar kita. Tanpa kita sadari, alam bawah sadar kita akan menjadi asyik dalam menyimak pembelajaran yang kita lakukan. Karena semakin asyik, maka alam bawah sadar kita akan senantiasa mengingat pembelajaran yang kita peroleh. Itulah yang sering kita dengar dulu, bahwa belajar sambil mempraktekkan, akan lebih menancap pada otak kita dan tidak akan mudah luntur.&nbsp;</p>\r\n\r\n<p>Kemudian yang kedua adalah&nbsp;&nbsp;kita dianjurkan menggunakan&nbsp;<strong>imajinasi</strong>&nbsp;kita dalam belajar. Seperti misalnya dalam menghafal deretan angka, kita bisa mengubah angka-angka itu menjadi huruf lalu menggabungkannya menjadi kata-kata yang dapat kita susun menjadi kalimat yang mudah kita ingat. Biarkanlah setiap yang kita pelajari menjadi sesuatu yang sangat menyenangkan oleh imajinasi kita.&nbsp;</p>\r\n\r\n<p>Tips ketiga adalah lakukan&nbsp;<strong>perulangan</strong>. Dengan mengulang-ulang suatu pekerjaan, tanpa disadari, kita akan mengingat dan fasih dengan apa yang kita kerjakan. Fenomena ini dapat kita pelajari dari seorang penjual pisang molen yang sedang mengupas, membungkus pisang, lalu menggoreng pisang itu dengan sangat terampil karena saking seringnya pekerjaan itu dilakukan.&nbsp;</p>\r\n\r\n<p>Dan tips yang terakhir adalah&nbsp;<strong>fokus pada tujuan</strong>. Pikiran kita yang selalu fokus, akan memacu alam bawah sadar kita untuk selalu&nbsp;&nbsp;mengacu pada tujuan yang kita capai. Dengan begitu, alam bawah sadar kita akan senantiasa menuntun otak dan perilaku kita ini untuk selalu melakukan sesuatu yang terkait tujuan akhir yang kita inginkan. Sebagai contoh, saat akhir pekan kita fokus untuk hobby kita, misalnya bermain komputer, maka bisa jadi setelah bangun pagi, hal yang kita lakukan pertama kali adalah menombol power-on komputer, lalu kita bermain tanpa kenal waktu. Seharusnya kegiatan belajar kita sehari-hari juga sefokus saat kita bermain.</p>\r\n\r\n<p>Itulah materi kuliah umum&nbsp;<em>Studium Generale</em>&nbsp;pertama yang saya peroleh. Sebagai mahasiswa yang banyak membutuhkan kecepatan belajar, metode&nbsp;<em>Hypno-Learning</em>&nbsp;yang diajarkan sangat membantu saya dalam kegiatan belajar. Terlihat sekali dampak dari materi ini pada kuliah-kuliah setelahnya hingga sekarang ini. Saya menjadi lebih bersemangat dan lebih aktif dalam perkuliahan di kelas. Dengan tips pertama maupun kedua, saya menjadi lebih tersenyum dalam menghadapi materi kuliah yang sulit. Materi yang paling sulit pun rasanya bukan lagi hambatan dengan terbukanya pikiran-pikiran aktif dan positif dari otak saya setelah menerapkan tips ini. Di dukung dengan keyakinan akan keberhasilan tips ketiga, sekarang saya menjadi senang berlatih mengerjakan latihan-latihan soal materi dan pemrograman, maupun kegiatan seni musik saya, yakni bermain piano. Saya pun menjadi lebih fokus dalam mengerjakan apapun. Banyak sekali, sticky-note yang saya tempelkan di laptop saya setelah kuliah&nbsp;<em>Hypno-Learning&nbsp;</em>ini, supaya saya tetap fokus terhadap&nbsp;<em>deadline-deadline</em>&nbsp;kecil maupun tujuan besar hidup saya ke depan. Kuliah ini telah menjadi pencerahan bagi saya dalam kejenuhan kuliah yang semakin hari semakin sulit. Untuk itu, akhirnya Saya sangat bersyukur karena tahu tentang metode&nbsp;<em>Hypno-Learning</em>&nbsp;ini di kuliah Studium Generale. Apalagi saya kuliah di jurusan teknik informatika, yang mana membutuhkan improvisasi&nbsp;&nbsp;dan informasi sangat banyak supaya tidak tertinggal dengan persaingan global ini.</p>\r\n', 0, '2016-11-01 01:59:59', '2016-11-24 04:34:36'),
(15, '1479962319.jpg', 'Ini Alasan Mendikbud Usulkan Full Day School', '<p>Menteri Pendidikan dan Kebudayaan <a href="http://edukasi.kompas.com/tag/Muhadjir%20Effendy" target="_blank">Muhadjir Effendy</a> menggagas&nbsp;sistem &quot;<em>full day school</em>&quot; untuk pendidikan dasar (SD dan SMP), baik negeri maupun swasta. Alasannya agar anak tidak sendiri ketika orangtua mereka masih bekerja.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&quot;Dengan sistem <em>full day school</em> ini secara perlahan anak didik akan terbangun karakternya dan tidak menjadi liar di luar sekolah ketika orangtua mereka masih belum pulang dari kerja,&quot; kata Mendikbud di Universitas Muhammadiyah Malang (UMM), Minggu (7/8/2016).</p>\r\n\r\n<p>Menurut dia, kalau anak-anak tetap berada di sekolah, mereka bisa menyelesaikan tugas-tugas sekolah sampai dijemput orangtuanya seusai jam kerja.</p>\r\n\r\n<p>Selain itu, anak-anak bisa pulang bersama-sama orangtua mereka sehingga ketika berada di rumah mereka tetap dalam pengawasan, khususnya oleh orangtua.</p>\r\n\r\n<p>Untuk aktivitas lain misalnya mengaji bagi yang beragama Islam, menurut Mendikbud, pihak sekolah bisa memanggil guru mengaji atau ustaz dengan latar belakang dan rekam jejak yang sudah diketahui. Jika mengaji di luar, mereka dikhawatirkan akan diajari hal-hal yang menyimpang.</p>\r\n\r\n<p>Menyinggung penerapan <em>full day school</em> dalam pendidikan dasar tersebut, mantan Rektor UMM itu mengatakan bahwa hal itu saat ini masih terus disosialisasikan di sekolah-sekolah, mulai di pusat hingga di daerah.</p>\r\n\r\n<p>&quot;Nantinya memang harus ada payung hukumnya, yakni peraturan menteri (permen). Namun, untuk saat ini masih sosialisasi terlebih dahulu secara intensif,&quot; ujarnya.</p>\r\n\r\n<p>Sementara itu, ketika berbicara di hadapan ratusan kader Muhammadiyah Kota Malang, Muhadjir mengatakan, dirinya akan berupaya merestorasi pendidikan dasar dan menengah (SD-SMP), termasuk pendidikan karakter bagi anak didik. Selain itu, ia juga akan membenahi kebijakan-kebijakan yang berkaitan dengan profesionalisme para pendidik.</p>\r\n\r\n<p>&quot;Saya tidak akan mengutak-atik masalah sertifikasi guru. Namun, harapan saya, profesionalisme seorang guru juga harus ditingkatkan terus. Jangan ada guru yang tidak layak, tetapi tetap saja menuntut sertifikasi, bahkan prosesnya minta dipermudah,&quot; kata Mendikbud.</p>\r\n\r\n<p>Menyinggung pendidikan di jenjang SMA dan SMK, Muhadjir mengatakan akan mencari formulasi yang tepat karena tidak semua lulusan SMA melanjutkan tahap pendidikan ke perguruan tinggi, alih-alih memilih untuk bekerja. Namun, karena tidak memiliki keterampilan dan keahlian, mereka akhirnya tidak bisa apa-apa di dunia kerja.</p>\r\n\r\n<p>Walau demikian, lulusan SMK pun tidak semuanya langsung bekerja. Ada yang tetap melanjutkan tahap pendidikan ke perguruan tinggi. Meski mereka memiliki keterampilan sesuai minat yang diambil di SMK, jika kualitasnya tidak ditingkatkan dan memiliki keahlian yang memadai, mereka akan tergusur oleh tenaga kerja asing yang memiliki sertifikasi internasional.</p>\r\n\r\n<p>&quot;Kondisi ini yang akan kami carikan solusi agar kesenjangan dalam pendidikan bisa diminimalkan,&quot; ujarnya.</p>\r\n', 0, '2016-11-22 07:22:43', '2016-11-24 04:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bukti_pembayaran`
--

CREATE TABLE IF NOT EXISTS `tb_bukti_pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pembayaran_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cabang`
--

CREATE TABLE IF NOT EXISTS `tb_cabang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) NOT NULL,
  `logitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tb_cabang`
--

INSERT INTO `tb_cabang` (`id`, `area_id`, `nama`, `alamat`, `logitude`, `latitude`, `created_at`, `updated_at`) VALUES
(3, NULL, 'Ganda Edukasi Katrangan', 'Jl katrangan no 52 denpasar', '115.237289', '-8.651975', '2016-11-02 02:19:21', '2016-11-02 02:31:01'),
(2, 2, 'Ganda Edukasi Dalung', 'Perum dalung permai blok J no 23', '115.169593', '-8.632744', '2016-08-03 05:46:54', '2016-11-02 02:23:36'),
(4, NULL, 'Ganda Edukasi Misol', 'Jl pulau misol no 86 Denpasar', '115.202658', '-8.678968', '2016-11-02 02:21:33', '2016-11-02 02:28:25'),
(5, NULL, 'Ganda Edukasi Panjer', 'Jl tukad yeh aya VI No 2 panjer', '115.220039', '-8.675033', '2016-11-02 02:22:19', '2016-11-02 02:33:45'),
(6, NULL, 'Ganda Edukasi Monang Maning', 'Jl gunung muliawan XI no 1', '115.198757', '-8.662491', '2016-11-02 02:22:54', '2016-11-02 02:37:29'),
(7, NULL, 'Ganda Edukasi Nangka', 'Jl nangka selatan gang XI no 26 A', '115.219300', '-8.641217', '2016-11-02 02:23:31', '2016-11-02 02:39:26'),
(8, NULL, 'Ganda Edukasi Pedungan', 'Circle K Pedungan', '115.169724', '-8.720818', '2016-11-02 02:24:14', '2016-11-02 03:08:57'),
(9, NULL, 'Ganda Edukasi Subita', 'Jl subita no 9X', '115.233205', '-8.647446', '2016-11-02 02:24:48', '2016-11-02 02:48:38'),
(10, NULL, 'Ganda Edukasi Sesetan', 'Gang Taman Sari Sesetan', '115.225309', '-8.699580', '2016-11-02 02:26:03', '2016-11-02 03:19:33'),
(11, NULL, 'Ganda Edukasi Gatsu Barat', 'Jalan  Gatsu Barat', '115.202476', '-8.638816', '2016-11-02 02:27:38', '2016-11-02 04:14:50'),
(12, NULL, 'Ganda Edukasi Sanur', 'MCD Sanur', '115.259545', '-8.682514', '2016-11-02 02:28:45', '2016-11-25 15:17:48'),
(13, NULL, 'Ganda Edukasi Singaraja', 'SMA Negeri 1 singaraja', '115.090864', '-8.111597', '2016-11-02 02:29:53', '2016-11-25 15:21:30'),
(14, NULL, 'Ganda Eduksi Karangasem', 'Amblapura', '115.604515', '-8.451081', '2016-11-02 02:31:08', '2016-11-25 15:24:19'),
(15, NULL, 'Ganda Edukasi Jimbaran', 'Perum taman griya jimbaran', '115.159272', '-8.790694', '2016-11-02 02:31:48', '2016-11-25 15:29:29'),
(16, NULL, 'Ganda Edukasi Gianyar', 'Gianyar', '115.323905', '-8.541215', '2016-11-02 02:32:19', '2016-11-25 15:30:38'),
(17, NULL, 'Ganda Edukasi Klungkung', 'Semarapura', '115.406714', '-8.539454', '2016-11-02 02:32:40', '2016-11-25 15:32:07'),
(18, NULL, 'Ganda Edukasi Banggli', 'Banggli', '115.354897', '-8.454303', '2016-11-02 02:34:53', '2016-11-25 15:34:49'),
(19, NULL, 'Ganda Edukasi Jembrana', 'Jembrana', '114.629348', '-8.360949', '2016-11-02 02:36:16', '2016-11-25 15:35:24'),
(20, NULL, 'Ganda Edukasi Tabanan', 'Tabanan', '115.124692', '-8.537557', '2016-11-02 02:36:56', '2016-11-25 15:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cek_rating`
--

CREATE TABLE IF NOT EXISTS `tb_cek_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siswa_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_jadwal`
--

CREATE TABLE IF NOT EXISTS `tb_detail_jadwal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jadwal_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `tgl_pertemuan` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `tb_detail_jadwal`
--

INSERT INTO `tb_detail_jadwal` (`id`, `jadwal_id`, `pengajar_id`, `pertemuan`, `tgl_pertemuan`, `waktu_mulai`, `waktu_selesai`, `tempat`, `created_at`, `updated_at`) VALUES
(59, 24, 1, 4, '2016-11-24', '18:01:00', '19:31:00', 'sukawati', '2016-11-24 06:57:15', '2016-11-24 06:57:15'),
(58, 24, 1, 3, '2016-12-21', '17:01:00', '18:31:00', 'sukawati', '2016-11-24 06:57:15', '2016-11-24 06:57:15'),
(57, 24, 1, 2, '2016-12-12', '14:01:00', '15:31:00', 'sukawati', '2016-11-24 06:57:15', '2016-11-24 06:57:15'),
(56, 24, 1, 1, '2016-12-01', '12:59:00', '14:29:00', 'sukawati', '2016-11-24 06:57:15', '2016-11-24 06:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_history`
--

CREATE TABLE IF NOT EXISTS `tb_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_jadwal_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `history_keterangan` text NOT NULL,
  `tambahan_jam` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tb_history`
--

INSERT INTO `tb_history` (`id`, `detail_jadwal_id`, `siswa_id`, `pengajar_id`, `history_keterangan`, `tambahan_jam`, `created_at`, `updated_at`) VALUES
(11, 59, 22, 1, 'test', 30, '2016-11-24 07:06:42', '2016-11-24 07:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal`
--

CREATE TABLE IF NOT EXISTS `tb_jadwal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajar_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `paket_id` int(11) NOT NULL,
  `logitude` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `status` enum('1','2','3') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id`, `pengajar_id`, `siswa_id`, `mapel_id`, `paket_id`, `logitude`, `latitude`, `status`, `created_at`, `updated_at`) VALUES
(24, 1, 22, 10, 1, '', '', '2', '2016-11-24 06:57:15', '2016-11-24 07:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal_pengajar`
--

CREATE TABLE IF NOT EXISTS `tb_jadwal_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zona_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `hari` int(11) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jarak`
--

CREATE TABLE IF NOT EXISTS `tb_jarak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jarak` varchar(50) NOT NULL,
  `biaya` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tb_jarak`
--

INSERT INTO `tb_jarak` (`id`, `jarak`, `biaya`, `created_at`, `updated_at`) VALUES
(7, '1', '1000', '2016-11-24 05:13:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kabupaten`
--

CREATE TABLE IF NOT EXISTS `tb_kabupaten` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_propinsi` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_kabupaten`
--

INSERT INTO `tb_kabupaten` (`id`, `id_propinsi`, `nama`, `created_at`, `updated_at`) VALUES
(1, 1, 'Denpasar', '2016-08-03 05:44:28', NULL),
(2, 1, 'Badung', '2016-08-03 05:45:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapel`
--

CREATE TABLE IF NOT EXISTS `tb_mapel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `tingkat_pendidikan` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `tb_mapel`
--

INSERT INTO `tb_mapel` (`id`, `nama`, `tingkat_pendidikan`, `created_at`, `updated_at`) VALUES
(12, 'IPS', 3, '2016-10-31 04:23:08', NULL),
(11, 'IPA', 2, '2016-10-31 04:22:49', NULL),
(10, 'IPA', 3, '2016-10-31 04:22:28', NULL),
(9, 'Matematika', 1, '2016-10-31 04:21:48', NULL),
(8, 'Matematika', 2, '2016-10-31 04:21:28', NULL),
(7, 'Matematika', 3, '2016-10-31 04:21:09', NULL),
(13, 'IPS', 2, '2016-10-31 04:23:25', NULL),
(14, 'IPS', 1, '2016-10-31 04:26:50', NULL),
(15, 'Berhitung', 3, '2016-10-31 04:27:15', NULL),
(16, 'Bahasa Inggris', 3, '2016-10-31 04:27:39', NULL),
(17, 'Bahasa Inggris', 2, '2016-10-31 04:27:52', NULL),
(18, 'Bahasa Inggris', 1, '2016-10-31 04:28:09', NULL),
(19, 'Bahasa Inggris', 4, '2016-10-31 04:28:24', NULL),
(20, 'Membaca', 3, '2016-10-31 04:28:45', NULL),
(21, 'Menulis', 3, '2016-10-31 04:28:59', NULL),
(22, 'Bahasa Bali', 3, '2016-10-31 04:29:43', NULL),
(23, 'Bahasa Bali', 2, '2016-10-31 04:29:58', NULL),
(24, 'Bahasa Bali', 1, '2016-10-31 04:30:14', NULL),
(25, 'Fisika - IPA', 2, '2016-10-31 04:30:54', NULL),
(26, 'Fisika - IPA', 1, '2016-10-31 04:31:14', NULL),
(27, 'Kimia - IPA', 1, '2016-10-31 04:31:37', NULL),
(28, 'Biologi -IPA', 2, '2016-10-31 04:32:01', NULL),
(29, 'Biologi -IPA', 1, '2016-10-31 04:32:12', NULL),
(30, 'Matematika Peminatan', 4, '2016-10-31 04:32:36', NULL),
(31, 'Komputer', 3, '2016-10-31 04:55:22', NULL),
(32, 'Komputer', 2, '2016-10-31 04:55:41', NULL),
(33, 'Komputer', 1, '2016-10-31 04:55:54', NULL),
(34, 'Komputer', 4, '2016-10-31 04:56:06', NULL),
(35, 'Ekonomi', 1, '2016-10-31 04:57:01', NULL),
(36, 'Sosiologi', 1, '2016-10-31 04:57:18', NULL),
(37, 'Akuntansi', 1, '2016-10-31 04:57:31', NULL),
(38, 'Sejarah', 1, '2016-10-31 04:57:48', NULL),
(39, 'Geografi', 1, '2016-10-31 04:58:09', NULL),
(40, 'Bahasa Jepang', 3, '2016-10-31 04:58:25', NULL),
(41, 'Bahasa Jepang', 2, '2016-10-31 04:58:38', NULL),
(42, 'Bahasa Jepang', 1, '2016-10-31 04:58:49', NULL),
(43, 'Bahasa Jepang', 4, '2016-10-31 04:59:06', NULL),
(44, 'Bahasa Inggris', 5, '2016-10-31 04:59:21', NULL),
(45, 'Akuntansi', 5, '2016-10-31 04:59:38', NULL),
(46, 'Bahasa Jepang', 5, '2016-10-31 05:00:03', NULL),
(47, 'Ekonomi', 5, '2016-10-31 05:00:15', NULL),
(48, 'Komputer', 5, '2016-10-31 05:00:57', NULL),
(49, 'Matematika Wajib', 1, '2016-10-31 05:01:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapel_calon_pengajar`
--

CREATE TABLE IF NOT EXISTS `tb_mapel_calon_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajar_id` int(11) DEFAULT NULL,
  `mapel` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapel_pengajar`
--

CREATE TABLE IF NOT EXISTS `tb_mapel_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajar_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `tb_mapel_pengajar`
--

INSERT INTO `tb_mapel_pengajar` (`id`, `pengajar_id`, `mapel_id`, `created_at`, `updated_at`) VALUES
(28, 266, 15, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(22, 35, 18, '2016-11-02 14:44:52', NULL),
(27, 266, 7, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(45, 1, 10, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(30, 266, 20, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(29, 266, 16, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(25, 266, 12, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(26, 266, 10, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(31, 266, 21, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(32, 272, 43, '2016-11-21 01:44:15', '2016-11-21 01:44:15'),
(33, 273, 19, '2016-11-22 02:13:53', NULL),
(34, 273, 8, '2016-11-22 02:13:53', NULL),
(35, 267, 9, '2016-11-22 02:57:22', '2016-11-22 02:57:22'),
(36, 274, 7, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(37, 274, 15, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(38, 274, 16, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(39, 274, 17, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(40, 274, 18, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(41, 274, 20, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(42, 274, 21, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(43, 274, 31, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(46, 1, 16, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(47, 1, 20, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(48, 1, 22, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(49, 1, 34, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(50, 1, 40, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(51, 273, 16, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(52, 273, 17, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(53, 273, 18, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(54, 273, 19, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(55, 273, 15, '2016-11-24 06:45:20', '2016-11-24 06:45:20'),
(56, 273, 16, '2016-11-24 06:45:20', '2016-11-24 06:45:20'),
(57, 273, 17, '2016-11-24 06:45:20', '2016-11-24 06:45:20'),
(58, 273, 18, '2016-11-24 06:45:20', '2016-11-24 06:45:20'),
(59, 273, 16, '2016-11-24 06:45:45', '2016-11-24 06:45:45'),
(60, 273, 17, '2016-11-24 06:45:45', '2016-11-24 06:45:45'),
(61, 273, 18, '2016-11-24 06:45:45', '2016-11-24 06:45:45'),
(62, 221, 9, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(63, 221, 8, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(64, 221, 7, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(65, 221, 16, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(66, 221, 9, '2016-11-26 22:41:22', '2016-11-26 22:41:22'),
(67, 221, 8, '2016-11-26 22:41:22', '2016-11-26 22:41:22'),
(68, 221, 7, '2016-11-26 22:41:22', '2016-11-26 22:41:22'),
(69, 221, 16, '2016-11-26 22:41:22', '2016-11-26 22:41:22'),
(70, 266, 12, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(71, 266, 10, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(72, 266, 7, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(73, 266, 15, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(74, 266, 16, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(75, 266, 20, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(76, 266, 21, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(77, 266, 12, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(78, 266, 10, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(79, 266, 7, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(80, 266, 15, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(81, 266, 16, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(82, 266, 20, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(83, 266, 21, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(84, 266, 12, '2016-11-27 10:38:15', '2016-11-27 10:38:15'),
(85, 266, 10, '2016-11-27 10:38:15', '2016-11-27 10:38:15'),
(86, 266, 7, '2016-11-27 10:38:15', '2016-11-27 10:38:15'),
(87, 266, 15, '2016-11-27 10:38:15', '2016-11-27 10:38:15'),
(88, 266, 16, '2016-11-27 10:38:15', '2016-11-27 10:38:15'),
(89, 266, 20, '2016-11-27 10:38:15', '2016-11-27 10:38:15'),
(90, 266, 21, '2016-11-27 10:38:15', '2016-11-27 10:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_notif`
--

CREATE TABLE IF NOT EXISTS `tb_notif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `onesignal_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `tb_notif`
--

INSERT INTO `tb_notif` (`id`, `user_id`, `onesignal_id`, `created_at`, `updated_at`) VALUES
(46, 293, 'ad35cb33-37b9-4b70-a538-b762e056b100', '2016-11-24 10:41:32', '2016-11-24 10:41:32'),
(18, 3, '87f59dd9-9f92-4989-a744-01976333a5b1', '2016-09-11 09:00:18', '2016-09-18 11:47:07'),
(22, 69, '8098015a-f250-4193-b10b-7830d09f0a36', '2016-09-15 17:43:57', '2016-09-15 17:43:57'),
(20, 47, '84fbb920-9353-43b5-97ed-2fb8bef61ade', '2016-09-12 17:51:53', '2016-10-23 12:04:17'),
(42, 304, '225117ea-1e98-472d-91d7-850e5a95451d', '2016-11-22 12:03:09', '2016-11-22 12:03:09'),
(23, 125, '4d2a0246-156c-4b2a-bd0e-04accbbb87a4', '2016-09-16 04:11:25', '2016-09-16 04:11:25'),
(25, 10, 'be675644-155c-46a3-b294-6ebedaf286b0', '2016-09-20 01:33:07', '2016-11-24 04:35:25'),
(26, 227, '003fe153-d32f-497d-96ef-0d02673b4af3', '2016-09-23 02:49:41', '2016-09-23 02:49:41'),
(27, 275, 'da2212a0-8a8a-4052-b6e7-773a4da1bb74', '2016-10-15 01:44:46', '2016-10-15 01:44:46'),
(31, 291, '3c593409-1544-48c7-90cb-530fe3d27d84', '2016-11-19 21:12:19', '2016-11-19 21:12:19'),
(34, 300, '465db12e-b449-4aa5-b211-15946771f713', '2016-11-21 01:48:25', '2016-11-21 01:48:25'),
(35, 301, '430476d0-7f6d-4eb1-b379-e08e2f5993e5', '2016-11-21 01:57:24', '2016-11-21 01:57:24'),
(36, 303, '075108ff-a4a9-44fc-bee4-3f2948e949a5', '2016-11-21 11:19:08', '2016-11-21 11:19:08'),
(37, 302, 'cb68ceea-bac5-498a-b15b-e6385e60351f', '2016-11-22 02:13:53', '2016-11-22 02:13:53'),
(43, 305, 'b149870f-e7e3-43fc-bfac-2890f08595c1', '2016-11-24 03:58:42', '2016-11-24 03:58:42'),
(44, 306, '2bba3d9a-0ff0-49cf-9dd8-929e0d075237', '2016-11-24 03:59:16', '2016-11-24 03:59:16'),
(45, 308, 'bd49eecd-dcff-4565-87b4-dea21c576ec8', '2016-11-24 04:41:08', '2016-11-24 04:41:08'),
(47, 1, '382f138a-5c0d-454a-967a-90b4e40e2c74', '2016-11-25 04:53:39', '2016-11-25 04:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `tb_owner`
--

CREATE TABLE IF NOT EXISTS `tb_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `zona_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `owner_alamat` text NOT NULL,
  `owner_cp` char(12) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tb_owner`
--

INSERT INTO `tb_owner` (`id`, `owner_id`, `zona_id`, `fullname`, `photo`, `owner_alamat`, `owner_cp`, `created_at`, `updated_at`) VALUES
(2, 275, 2, 'Nengah Dwi Prawira Putra', NULL, 'Perum dalung permai blok J no 23', '085792611624', '2016-11-02 03:05:06', NULL),
(4, 307, 15, 'swan', NULL, 'kapal', '090099', '2016-11-24 03:58:17', NULL),
(5, 309, 13, 'Hery', NULL, 'Singaraja', '978', '2016-11-24 04:01:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_paket`
--

CREATE TABLE IF NOT EXISTS `tb_paket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarif_id` int(11) NOT NULL,
  `tingkat_pendidikan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jumlah_pertemuan` int(11) NOT NULL,
  `durasi` int(11) NOT NULL COMMENT 'menit',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `tarif_id`, `tingkat_pendidikan`, `nama`, `jumlah_pertemuan`, `durasi`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Paket Anak SMA', 1, 60, '2016-08-16 04:41:35', NULL),
(3, 14, 3, 'Paket Bocah SD', 1, 60, '2016-11-15 00:59:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE IF NOT EXISTS `tb_pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siswa_id` int(11) NOT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `history_id` int(11) DEFAULT NULL,
  `jadwal_id` int(11) DEFAULT NULL,
  `jenis_tagihan` enum('PROGRAM','JADWAL','JARAK') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `pembayaran_metode` int(1) NOT NULL COMMENT '1=>Cash, 2=>Transfer Bank',
  `pembayaran_status` int(1) NOT NULL COMMENT '1=>Proses, 2=>Lunas',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id`, `siswa_id`, `pengajar_id`, `history_id`, `jadwal_id`, `jenis_tagihan`, `jumlah`, `keterangan`, `pembayaran_metode`, `pembayaran_status`, `created_at`, `updated_at`) VALUES
(11, 22, NULL, NULL, 24, 'PROGRAM', 500000, NULL, 1, 1, '2016-11-24 06:58:15', '2016-11-24 06:58:15'),
(12, 22, 1, 11, 24, 'JADWAL', 0, 'Kelebihan 2 menit.', 1, 1, '2016-11-24 07:06:42', '2016-11-24 07:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajar`
--

CREATE TABLE IF NOT EXISTS `tb_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `zona_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `pengajar_alamat` text NOT NULL,
  `kodepos` int(5) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `pengajar_cp` char(12) NOT NULL,
  `pengajar_pendidikan` varchar(100) NOT NULL,
  `pengajar_rating` int(11) DEFAULT NULL,
  `status_mengajar` enum('200','400') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=276 ;

--
-- Dumping data for table `tb_pengajar`
--

INSERT INTO `tb_pengajar` (`id`, `user_id`, `zona_id`, `fullname`, `photo`, `pengajar_alamat`, `kodepos`, `latitude`, `longitude`, `pengajar_cp`, `pengajar_pendidikan`, `pengajar_rating`, `status_mengajar`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 'Test 27 Agustus 2016', '1mUHcYTA7s0.jpg', 'jalan gitasura', 80115, '-8.6015331', '115.2197405', '085737343647', 'S.Kom', NULL, '200', '2016-07-29 18:13:47', '2016-11-24 06:15:10'),
(2, 3, 2, 'Pengajar', '2YobKVrBKpD.png', 'Jalan gita sura no.1', NULL, NULL, NULL, '085737353569', 'S1 Sistem Informasi', NULL, '200', '2016-08-03 09:05:57', '2016-09-11 08:07:06'),
(3, 4, 2, 'Magic Teacher', NULL, 'jalan nangka', NULL, NULL, NULL, '085737353564', 'S1 Sistem Informasi', NULL, '200', '2016-08-04 15:49:38', '2016-08-04 15:49:38'),
(4, 6, NULL, 'Hendra Wijaya', NULL, 'Jalan Nangka Utara', NULL, NULL, NULL, '085737353553', 'SMK', NULL, '200', '2016-08-13 16:50:59', '2016-08-13 16:50:59'),
(39, 51, NULL, 'Kristin Meta', NULL, 'Jl. Jagapati', NULL, NULL, NULL, '082144398042', 'SMA', NULL, '200', '2016-09-13 07:33:22', '2016-09-13 07:33:22'),
(40, 52, NULL, 'Kristin meta', NULL, 'jl. jagapati', NULL, NULL, NULL, '081236159462', 'sma', NULL, '200', '2016-09-13 07:38:26', '2016-09-13 07:38:26'),
(6, 11, NULL, 'Test pengajar', NULL, 'jalan raya badung', NULL, NULL, NULL, '08573935346', 'SMK', NULL, '200', '2016-08-30 10:35:33', '2016-08-30 10:35:33'),
(7, 12, NULL, 'Test pengajar 2', NULL, 'jalana', NULL, NULL, NULL, '0846763522', 'skom', NULL, '200', '2016-08-30 10:43:21', '2016-08-30 10:43:21'),
(8, 15, NULL, 'Anak Agung Inten Sakanti', NULL, 'jln. pulau yapen gang III no 1', NULL, NULL, NULL, '085857200442', 's1 pendidikan bahasa inggris', NULL, '200', '2016-09-11 02:36:55', '2016-09-11 02:36:55'),
(9, 16, NULL, 'Test Pengajar', NULL, 'Jalan Raya Kapal', NULL, NULL, NULL, '08473637364', 'S.Kom', NULL, '200', '2016-09-11 08:11:34', '2016-09-11 08:11:34'),
(10, 17, NULL, 'Ernayanti', NULL, 'jalan waturenggong', NULL, NULL, NULL, '081999412356', 'sarjana pendidikan biologi', NULL, '200', '2016-09-12 02:22:40', '2016-09-12 02:22:40'),
(11, 18, NULL, 'Amania amin', NULL, 'Jalan gunung andakasa gg matahari V no 7x', NULL, NULL, NULL, '085790870856', 'S1 Biologi', NULL, '200', '2016-09-12 02:29:03', '2016-09-12 02:29:03'),
(12, 19, NULL, 'Ayu Mita Adnyani', NULL, 'Br. Penestanan Kelod, Ubud', NULL, NULL, NULL, '085792143094', 'Universitas Pendidikan Ganesha (Pendidikan Guru Sekolah Dasar)', NULL, '200', '2016-09-12 02:41:44', '2016-09-12 02:41:44'),
(13, 21, NULL, 'Made Adi Nugraha Tristaningrat', NULL, 'Perumahan Banyuning Permai Blok A1 No 1, Buleleng, Singaraja, Bali', NULL, NULL, NULL, '085737994826', 'Strata 1', NULL, '200', '2016-09-12 02:47:07', '2016-09-12 02:47:07'),
(14, 22, NULL, 'Ni Wayan Evin Yunarsia', NULL, 'Jl.Taman Baruna Perum.Sari Jimbaran Blok Cempaka No 33A Jimbaran Kuta Selatan', NULL, NULL, NULL, '085737996439', 'S1 Pendidikan Bahasa Jepang', NULL, '200', '2016-09-12 02:51:27', '2016-09-12 02:51:27'),
(15, 23, NULL, 'Ni kadek ani', NULL, 'Banjar Tanah Lengis,  Desa Ababi,  Kecamatan Abang,  Kabupaten Karangasem', NULL, NULL, NULL, '085738262059', 'Sarjana Pendidikan Guru Sekolah Dasar', NULL, '200', '2016-09-12 02:55:36', '2016-09-12 02:55:36'),
(16, 24, NULL, 'Ni nyoman krisna istriari', NULL, 'jln pulau saelus gang iv no 1', NULL, NULL, NULL, '081246867524', 'sarjana pendidikan ', NULL, '200', '2016-09-12 03:33:28', '2016-09-12 03:33:28'),
(17, 25, NULL, 'Candra Lestari', NULL, 'Dsn Berawantangi Taman, Ds. Tukadaya, Kec. Melaya, Jembrana, Bali', NULL, NULL, NULL, '08563871026', 'S1 PGSD', NULL, '200', '2016-09-12 03:41:50', '2016-09-12 03:41:50'),
(18, 26, NULL, 'Candra Lestari ', NULL, 'Dsn. Berawantangitaman, Ds. Tukadaya, Kec. Melaya, Jembrana, Bali', NULL, NULL, NULL, '081936571221', 'S1 PGSD', NULL, '200', '2016-09-12 03:45:36', '2016-09-12 03:45:36'),
(19, 27, NULL, 'Made Dewi Setyathi', NULL, 'Jalan Ken Arok No 7, Denpasar-Bali', NULL, NULL, NULL, '085739544132', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-12 03:47:58', '2016-09-12 03:47:58'),
(20, 28, NULL, 'Maswulandari', NULL, 'jl. danau buyan 1 no 1 sanur', NULL, NULL, NULL, '081237578606', 's1 hukum (masih kuliah smt akhir)', NULL, '200', '2016-09-12 04:17:14', '2016-09-12 04:17:14'),
(21, 29, NULL, 'Fridayani anak agung', NULL, 'jln letda kajeng renon', NULL, NULL, NULL, '087861212104', 'S1 matematika', NULL, '200', '2016-09-12 04:23:42', '2016-09-12 04:23:42'),
(22, 30, NULL, 'Ni Luh Putu Kartika Wati', NULL, 'Jln. Dukuh Sari 62 Sesetan', NULL, NULL, NULL, '089608730224', 'SMA', NULL, '200', '2016-09-12 04:28:31', '2016-09-12 04:28:31'),
(23, 31, NULL, 'Gusti Ayu Sri Handayani ', NULL, 'Jalan Astina Utara No.  1 Gianyar Bali', NULL, NULL, NULL, '089672683015', 'S1 PGSD', NULL, '200', '2016-09-12 04:36:10', '2016-09-12 04:36:10'),
(24, 32, NULL, 'Maswulandari', NULL, 'jl danau buyan 1 no 1 sanur', NULL, NULL, NULL, '628573931763', 's1 hukum (smt akhir)', NULL, '200', '2016-09-12 04:41:23', '2016-09-12 04:41:23'),
(25, 33, NULL, 'Ni Putu Evi Setiawati, S.Pd', NULL, 'jalan pulau saelus gang 78x/3 denpasar selatan', NULL, NULL, NULL, '087761557316', 'S1 Matematika', NULL, '200', '2016-09-12 04:44:10', '2016-09-12 04:44:10'),
(26, 35, NULL, 'Wina Andriani', NULL, 'perum canggu permai jalan krisnantara gg. krisna 6/ A 90', NULL, NULL, NULL, '081936077638', 'S1 Biologi', NULL, '200', '2016-09-12 08:06:43', '2016-09-12 08:06:43'),
(274, 304, NULL, 'Iin Pramunistyawaty', '274Urb33UGvHQ.jpg', 'Asrama Praja Rakcaka Blok K No 20 Pemogan Denpasar Selatan', 80221, '-8.7146637', '115.2055167', '083114584579', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-11-22 12:02:46', '2016-11-22 12:08:26'),
(30, 42, NULL, 'Ni Luh Putu Desy Mustikayani', NULL, 'Jln. Narakesuma no. 9 Denpasar', NULL, NULL, NULL, '085239108485', 'S1', NULL, '200', '2016-09-12 10:33:57', '2016-09-12 10:33:57'),
(31, 43, NULL, 'Putu Nita Deviyanti, S.Pd', NULL, 'Jalan Tukad Petanu Gg Merpati No.2, Sidakarya Denpasar Selatan', NULL, NULL, NULL, '089687426526', 'Perguruan Tinggi', NULL, '200', '2016-09-12 11:01:54', '2016-09-12 11:01:54'),
(32, 44, NULL, 'I Putu Widhi Astika', NULL, 'Jalan Mayor Metra Gang XIV No. 3D, Liligundi, Singaraja, Bali', NULL, NULL, NULL, '087762456554', 'S1-Pendidikan Bahasa Bali', NULL, '200', '2016-09-12 11:56:14', '2016-09-12 11:56:14'),
(33, 45, NULL, 'Ni Made Sri Handayani,S.Pd.H', NULL, 'Jl.Sutomo gg VI no 3', NULL, NULL, NULL, '081338010835', 'S1', NULL, '200', '2016-09-12 13:37:08', '2016-09-12 13:37:08'),
(34, 46, NULL, 'Syamrotul maslikah', NULL, 'taman meilia no 10 jimbaran ', NULL, NULL, NULL, '082237464531', 'sma', NULL, '200', '2016-09-12 16:53:38', '2016-09-12 16:53:38'),
(35, 47, 13, 'Made Hery Santosa', NULL, 'Jalan Srikandi Gang Delima No 7 Singaraja Bali', 81161, '-8.1331386', '115.0870577', '087762701785', 'S3', NULL, '200', '2016-09-12 17:09:37', '2016-11-20 15:37:32'),
(36, 48, NULL, 'Syamrotul Maslikah', NULL, 'jalan taman meilia no 10 jimbaran', NULL, NULL, NULL, '085746466955', 'sma', NULL, '200', '2016-09-12 22:26:34', '2016-09-12 22:26:34'),
(37, 49, NULL, 'Syamrotul maslikah', NULL, 'jl taman meilia no 10 jimbaran', NULL, NULL, NULL, '087861520411', 'sma', NULL, '200', '2016-09-12 23:09:57', '2016-09-12 23:09:57'),
(38, 50, NULL, 'I Gede Umbara Arta', NULL, 'jl seroja', NULL, NULL, NULL, '085739636316', 'S1 ekonomi', NULL, '200', '2016-09-13 00:57:55', '2016-09-13 00:57:55'),
(41, 53, NULL, 'Ni Luh Ayu Wahyuni, S.Pd', NULL, 'Jalan Pulau Indah G.g 1 No.1 Dps', NULL, NULL, NULL, '085738764622', 'S1 Pendidikan Ekonomi', NULL, '200', '2016-09-13 10:29:50', '2016-09-13 10:29:50'),
(42, 54, NULL, 'Anak Agung Sagung Krisna Darmawati', NULL, 'jalan siulan gg sekarsari no 1', NULL, NULL, NULL, '081236165686', 'sarjana sains', NULL, '200', '2016-09-13 11:01:31', '2016-09-13 11:01:31'),
(43, 55, NULL, 'Kadek Ayu Yunita Kawi', NULL, 'Jalan Sedap Malam No.63', NULL, NULL, NULL, '08170670450', 'SMA', NULL, '200', '2016-09-13 14:02:00', '2016-09-13 14:02:00'),
(44, 56, NULL, 'Ni nyoman ayu suciartini', NULL, 'jln soka gg jepun no 6 kesiman', NULL, NULL, NULL, '081916602051', 's2', NULL, '200', '2016-09-13 23:42:11', '2016-09-13 23:42:11'),
(45, 57, NULL, 'Kadek Tiara Virgianti', NULL, 'Dusun Airanakan, Desa Banyubiru, Kec.Negara, Kab.Jembrana, Prov.Bali', NULL, NULL, NULL, '085938372066', 'S1 Pendidikan Bahasa Jepang', NULL, '200', '2016-09-14 01:20:34', '2016-09-14 01:20:34'),
(46, 58, NULL, 'Ni Kadek Widiartini', NULL, 'Muncan,Selat,Karangasem', NULL, NULL, NULL, '081558560844', 'S1 PGSD', NULL, '200', '2016-09-14 07:15:28', '2016-09-14 07:15:28'),
(47, 59, NULL, 'Putu ida arsani dewi', NULL, 'jl jalak putih gang 5 no 5A singaraja bali', NULL, NULL, NULL, '081237955940', 'sd-kuliah S1PGPAUD', NULL, '200', '2016-09-14 14:15:05', '2016-09-14 14:15:05'),
(48, 61, NULL, 'I Gede Made Adi Kerta Yasa', NULL, 'Br.Abianlalang, Wanasari, Tabanan, Bali.', NULL, NULL, NULL, '085738553165', 'S1 pendidikan bahasa inggris', NULL, '200', '2016-09-15 15:21:58', '2016-09-15 15:21:58'),
(49, 62, NULL, 'Made Astra Suryawan', NULL, 'Desa Busungbiu, kecamatan Busungbiu, Kabupaten Buleleng, Bali.', NULL, NULL, NULL, '081936515525', 'Sekolah Menengah Atas', NULL, '200', '2016-09-15 15:40:24', '2016-09-15 15:40:24'),
(50, 63, NULL, 'Ni Wayan Devi Crisnady', NULL, 'Jl.Beji Ayu Gg. Soka2 Br.Tagtag Seminyak Kuta', NULL, NULL, NULL, '085738370892', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-15 15:54:51', '2016-09-15 15:54:51'),
(51, 64, NULL, 'I Wayan Heka Arcana Putra', NULL, 'jalan tangkuban perahu 1  gang 1 no 6 padang sambian Denpasar', NULL, NULL, NULL, '087861481864', 'S1 Sastra Inggris', NULL, '200', '2016-09-15 16:15:17', '2016-09-15 16:15:17'),
(52, 65, NULL, 'Gede sudana', NULL, 'banjar jawa', NULL, NULL, NULL, '085769547029', 's1', NULL, '200', '2016-09-15 16:46:56', '2016-09-15 16:46:56'),
(53, 66, NULL, 'I Gusti Putu Hendranatha Wijaya', NULL, 'Desa Batuaji, Kecamatan Kerambitan, Tabanan-Bali', NULL, NULL, NULL, '08179750815', 'Sarjana', NULL, '200', '2016-09-15 16:50:49', '2016-09-15 16:50:49'),
(54, 67, NULL, 'Ngurah agung riski restuaji', NULL, 'Perumahan Griya adi village blok D7, banyuning Singaraja', NULL, NULL, NULL, '081805346440', 'S1 pendidikan Bahasa Inggris', NULL, '200', '2016-09-15 16:51:11', '2016-09-15 16:51:11'),
(55, 68, NULL, 'Gede sudana praptono', NULL, 'banjar jawa', NULL, NULL, NULL, '085737845484', 'S1', NULL, '200', '2016-09-15 16:52:58', '2016-09-15 16:52:58'),
(56, 70, NULL, 'I PUTU DARMA PUTRA', NULL, 'Jln. Soka II, No. 14, Br. Lateng, Ds. Sibangkaja, Abiansemal, Badung', NULL, NULL, NULL, '085737109414', 'S1 Pendidikan Fisika', NULL, '200', '2016-09-15 22:12:48', '2016-09-15 22:12:48'),
(57, 71, NULL, 'I Gede Bhisma Griwanasta', NULL, 'Desa Sangsit, Kec. Sawan, Kab. Buleleng, Bali. ', NULL, NULL, NULL, '085737996195', 'S1 Pendidikan Bahasa Inggris - Universitas Pendidikan  Ganesha', NULL, '200', '2016-09-15 22:44:38', '2016-09-15 22:44:38'),
(58, 72, NULL, 'I Gusti Putu Hendranatha Wijaya', NULL, 'Desa Batuaji, Kecamatan Kerambitan, Tabanan-Bali', NULL, NULL, NULL, '08563920924', 'S1', NULL, '200', '2016-09-15 22:49:50', '2016-09-15 22:49:50'),
(59, 73, NULL, 'I Made Wisnawa', NULL, 'Desa Temukus, Kec. Banjar, Kab. Buleleng', NULL, NULL, NULL, '083117931490', 'S1 Pendidikan Bahasa Bali Undiksha', NULL, '200', '2016-09-15 23:35:45', '2016-09-15 23:35:45'),
(60, 74, NULL, 'I Gusti Ayu Kartika Dewi', NULL, 'Jl. Wijaya Kusuma Gang 5 No.2', NULL, NULL, NULL, '081311212318', 'Kuliah', NULL, '200', '2016-09-15 23:45:28', '2016-09-15 23:45:28'),
(61, 75, NULL, 'I Made Suasta Jayendra', NULL, 'Jalan melur gang buntu no 1 ', NULL, NULL, NULL, '081339040327', 'Semester 5 Pend. Bahasa Inggris', NULL, '200', '2016-09-15 23:52:46', '2016-09-15 23:52:46'),
(62, 76, NULL, 'Kadek Sriyoni', NULL, 'Abianbase-Gianyar', NULL, NULL, NULL, '081236663131', 'S1', NULL, '200', '2016-09-16 00:04:46', '2016-09-16 00:04:46'),
(63, 77, NULL, 'Putu gede suardika', NULL, 'jalan gunung agung lingkungan padang udayana gang x no.23', NULL, NULL, NULL, '083114624998', 'Sarjana', NULL, '200', '2016-09-16 00:07:16', '2016-09-16 00:07:16'),
(64, 78, NULL, 'Husniati Putri Cahyani', NULL, 'Jln.P. Ambon Gg. Merpati no.1 Denpasar Bali', NULL, NULL, NULL, '628133701761', 'S1', NULL, '200', '2016-09-16 00:09:36', '2016-09-16 00:09:36'),
(65, 79, NULL, 'Ayu Putri Utari', NULL, 'Jalan Nuri No. 2 Singaraja', NULL, NULL, NULL, '089624685890', 'Sedang Kuliah S1 Pendidikan Bahasa Jepang', NULL, '200', '2016-09-16 00:15:00', '2016-09-16 00:15:00'),
(66, 80, NULL, 'Ni luh debiani', NULL, 'Desa pengastulan', NULL, NULL, NULL, '082247772757', 'Sarjana Pendidikan ', NULL, '200', '2016-09-16 00:15:50', '2016-09-16 00:15:50'),
(67, 81, NULL, 'Kadek Agus Jaya Pharhyuna ', NULL, 'Panji Asri Blok S No 11', NULL, NULL, NULL, '081558015830', 'S2', NULL, '200', '2016-09-16 00:17:35', '2016-09-16 00:17:35'),
(68, 82, NULL, 'I Gede Shasy Bagus', NULL, 'Jln. Srikandi Gang Delima no. 35', NULL, NULL, NULL, '081915606689', 'SMK (masih menginjak semester 7)', NULL, '200', '2016-09-16 00:20:34', '2016-09-16 00:20:34'),
(69, 83, NULL, 'Nurlita Habibah', NULL, 'Jalan Hasanudin No. 26 B, Singaraja', NULL, NULL, NULL, '087762013168', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 00:21:10', '2016-09-16 00:21:10'),
(70, 84, NULL, 'Husniati Putri Cahyani', NULL, 'Jln.P. Ambon Gg. Merpati No.1 Denpasar Bali', NULL, NULL, NULL, '081337017614', 'S1', NULL, '200', '2016-09-16 00:23:55', '2016-09-16 00:23:55'),
(71, 85, NULL, 'Putu Septian Eka, S.Pd., M.Si.', NULL, 'Singaraja', NULL, NULL, NULL, '085793153183', 'S2 Kimia', NULL, '200', '2016-09-16 00:24:15', '2016-09-16 00:24:15'),
(72, 86, NULL, 'Komang Widarmana Putra', NULL, 'Jl. Srikandi Gg. Durian Blok C no. 16', NULL, NULL, NULL, '081805600430', 'Magister Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 00:25:48', '2016-09-16 00:25:48'),
(73, 87, NULL, 'Ketut helka lestari fibriyanti', NULL, 'jl  keboiwa utara gg gunung patas no 2', NULL, NULL, NULL, '085792719171', 'Spd bahasa inggris', NULL, '200', '2016-09-16 00:39:55', '2016-09-16 00:39:55'),
(74, 88, NULL, 'Effa Chalisah Jawas', NULL, 'Dalung Permai Blok G No.1, Kec.Kuta Utara, Kab.Badung', NULL, NULL, NULL, '081999482227', 'SMA', NULL, '200', '2016-09-16 00:40:02', '2016-09-16 00:40:02'),
(75, 89, NULL, 'Pande pradnyana putra', NULL, 'jl. baypas munggu tanah lot no 99a', NULL, NULL, NULL, '085739420853', 'S2 bahasa inggris', NULL, '200', '2016-09-16 00:40:21', '2016-09-16 00:40:21'),
(76, 90, NULL, 'Ni Luh Putu Mira Suantari', NULL, 'Perumahan Bukit Pratama, Jalan Gong Suling 2/6, Jimbaran, Bali', NULL, NULL, NULL, '085339273693', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 00:46:02', '2016-09-16 00:46:02'),
(77, 91, NULL, 'Komang juliarta', NULL, 'desa julah kecamatan tejakula bali', NULL, NULL, NULL, '081936507070', 'dalam pendidikan S1 bahasa inggris', NULL, '200', '2016-09-16 00:50:44', '2016-09-16 00:50:44'),
(78, 92, NULL, 'Gede Aan Karisma', NULL, 'Desa Munduk Bestala,Kecamatan Seririt,Kabupaten Buleleng,Bali', NULL, NULL, NULL, '085792735793', 'S1 Jurusan Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 00:52:01', '2016-09-16 00:52:01'),
(79, 93, NULL, 'Kadek Gita Dewa Huti, S.Pd', NULL, 'jalan tukad punggawa no.43, Serangan, Denpasar Selatan', NULL, NULL, NULL, '085739189271', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 00:54:00', '2016-09-16 00:54:00'),
(80, 94, NULL, 'Epifania puspitahati', NULL, 'jl.batas dukuh sari Gg.bangau 5', NULL, NULL, NULL, '085739133911', 's2 pendidikan bahasa inggris', NULL, '200', '2016-09-16 00:56:48', '2016-09-16 00:56:48'),
(81, 95, NULL, 'NI KOMANG SUGIHANTARIANI', NULL, 'Banjar Dinas Umaseka, Ds. Antosari, Kec.Selemadeg Barat, kab.Tabanan, Prov. Bali', NULL, NULL, NULL, '081236737033', 'S1 PGSD', NULL, '200', '2016-09-16 01:02:43', '2016-09-16 01:02:43'),
(82, 96, NULL, 'I putu anjas widya kusuma', NULL, 'jln durian, no 19 kelurahan delod peken, kecamatan tabanan, kabupaten tabanan', NULL, NULL, NULL, '085646923878', 's1', NULL, '200', '2016-09-16 01:10:34', '2016-09-16 01:10:34'),
(83, 97, NULL, 'I komang wirasuta', NULL, 'babakan-sambangan buleleng', NULL, NULL, NULL, '081337400124', 's1 pendidikan olagraga', NULL, '200', '2016-09-16 01:18:14', '2016-09-16 01:18:14'),
(84, 98, NULL, 'Nyoman Ari Purnaya', NULL, 'Desa Lokapaksa', NULL, NULL, NULL, '085792895958', 'SMA', NULL, '200', '2016-09-16 01:21:42', '2016-09-16 01:21:42'),
(85, 99, NULL, 'Gusti Ayu Gek Dewi Arini', NULL, 'Jalan Bisma Barat No.10 Singaraja', NULL, NULL, NULL, '087861905359', 'SMA', NULL, '200', '2016-09-16 01:31:16', '2016-09-16 01:31:16'),
(86, 100, NULL, 'Dentisna Krisnayanti', NULL, 'Jl Patih Nambi Perum Andika Graha B18', NULL, NULL, NULL, '085738654197', 'S1', NULL, '200', '2016-09-16 01:31:19', '2016-09-16 01:31:19'),
(87, 101, NULL, 'Kadek ayu meisa dewi', NULL, 'jalan sahadewa 9b singaraja', NULL, NULL, NULL, '082247782004', 'masih berkuliah s1 pendidikan matematika undiksha', NULL, '200', '2016-09-16 01:49:21', '2016-09-16 01:49:21'),
(88, 102, NULL, 'Gede Sukarpa', NULL, 'jalan taman sari, tanjung benoa', NULL, NULL, NULL, '082247258683', 'S1 Pendidikan bahasa jepang', NULL, '200', '2016-09-16 01:55:11', '2016-09-16 01:55:11'),
(89, 103, NULL, 'I Gusti Agung Ayu Agustini', NULL, 'Jln Sultan Agung No.58 Amlapura', NULL, NULL, NULL, '087762836153', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 01:55:32', '2016-09-16 01:55:32'),
(90, 104, NULL, 'I Putu Chandra Guna Krisna', NULL, 'Jalan Indrajaya, No. 51 Ubung Kaja Denpasar Bali', NULL, NULL, NULL, '081547367135', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 01:57:47', '2016-09-16 01:57:47'),
(91, 105, NULL, 'Ni made purnama dwi yanti', NULL, 'jalan kiskinda, gang arjuna, desa Busungbiu, kecamatan Busungbiu, Singaraja.', NULL, NULL, NULL, '087762970849', 'SMA', NULL, '200', '2016-09-16 02:00:30', '2016-09-16 02:00:30'),
(92, 106, NULL, 'Elisabeth Wania Galla', NULL, 'waikabubak, sumba barat, NTT', NULL, NULL, NULL, '082236549269', 'SMA', NULL, '200', '2016-09-16 02:10:06', '2016-09-16 02:10:06'),
(93, 107, NULL, 'Putu Indah Puspitasari', NULL, 'Jln. Gunung Agung Perumahan Puri Taman no 10', NULL, NULL, NULL, '089688616742', 'S1', NULL, '200', '2016-09-16 02:10:29', '2016-09-16 02:10:29'),
(94, 108, NULL, 'Diah Prihatiningsih', NULL, 'Jalan Tukad Banyu Sari Gang Taman No 27 Denpasar', NULL, NULL, NULL, '089622704222', 'Magister Kimia Terapan', NULL, '200', '2016-09-16 02:14:46', '2016-09-16 02:14:46'),
(95, 109, NULL, 'I PUTU GEDE HENDRA RAHARJA', NULL, 'Jalan Silakarang, Singapadu kaler, Sukawati, GIanyar', NULL, NULL, NULL, '081999459500', 'Perguruan Tinggi', NULL, '200', '2016-09-16 02:26:05', '2016-09-16 02:26:05'),
(96, 110, NULL, 'Komang Adi Nariyana Pramesti', NULL, 'br. sangging, desa akah, klungkung', NULL, NULL, NULL, '087762506338', 'bachelor degree', NULL, '200', '2016-09-16 02:29:45', '2016-09-16 02:29:45'),
(97, 111, NULL, 'I Putu Wira Pramana', NULL, 'Br. Gelogor, Lodtunduh, Ubud, Bali', NULL, NULL, NULL, '085737438082', 'S1 Pendidikan Matematika', NULL, '200', '2016-09-16 02:31:56', '2016-09-16 02:31:56'),
(98, 112, NULL, 'Ni ketut leony yulia dewi', NULL, 'jl. ahmad yani 1, kediri tabanan', NULL, NULL, NULL, '081246448818', 'SMA', NULL, '200', '2016-09-16 02:32:24', '2016-09-16 02:32:24'),
(99, 113, NULL, 'Ni Nyoman Suarti', NULL, 'Jln. P Indah III/3 Singaraja', NULL, NULL, NULL, '081337040065', 'S-2', NULL, '200', '2016-09-16 03:04:28', '2016-09-16 03:04:28'),
(100, 114, NULL, 'Luh Diah Surya Adnyani', NULL, 'Desa Umeanyar Kec. Seririt', NULL, NULL, NULL, '081805571502', 'S2', NULL, '200', '2016-09-16 03:07:32', '2016-09-16 03:07:32'),
(101, 115, NULL, 'Gede Agus Artasthana', NULL, 'Jalan Pulau Karimun A, Penarukan, Singaraja', NULL, NULL, NULL, '082237905445', 'SMA', NULL, '200', '2016-09-16 03:13:52', '2016-09-16 03:13:52'),
(102, 116, NULL, 'Nina Wibowo', NULL, 'Jl. Akasia V no. 26 Denpasar, Bali, Indonesia', NULL, NULL, NULL, '087785537972', 'Bachelor of Arts in English Linguistics', NULL, '200', '2016-09-16 03:14:58', '2016-09-16 03:14:58'),
(103, 117, NULL, 'I Gusti Agung Yulita Devi, S.Pd ', NULL, 'Br. Mengwi, Desa Sibang Gede, Kecamatan Abiansemal, Kabupaten Badung', NULL, NULL, NULL, '081239240656', 'S1 Pendidikan Matematika ', NULL, '200', '2016-09-16 03:15:02', '2016-09-16 03:15:02'),
(104, 118, NULL, 'Lawrence sa benning', NULL, 'RT 009. RW 04 kelurahan cikoko kecamatan pancoran jakarta selatan', NULL, NULL, NULL, '082339450281', 'SMA (sedang kuliah)', NULL, '200', '2016-09-16 03:27:01', '2016-09-16 03:27:01'),
(105, 119, NULL, 'NI KADEK SRI UTAMI', NULL, 'BR. LEBAH PANGKUNG MENGWI BADUNG BALI', NULL, NULL, NULL, '082266112689', 'S1 FKIP BAHASA INGGRIS', NULL, '200', '2016-09-16 03:28:17', '2016-09-16 03:28:17'),
(106, 120, NULL, 'I Wayan Agus Saputra, S.Pd.', NULL, 'dusun Tegallinggah, desa Bedulu, Blahbatuh, Gianyar, Bali', NULL, NULL, NULL, '081915646805', 'S1 pendidikan Fisika', NULL, '200', '2016-09-16 03:32:41', '2016-09-16 03:32:41'),
(107, 121, NULL, 'I Putu Rika Adi Putra', NULL, 'Desa Wanagiri, Selemadeg, Tabanan-Bali', NULL, NULL, NULL, '085938317883', 'Strata 1', NULL, '200', '2016-09-16 03:39:45', '2016-09-16 03:39:45'),
(108, 122, NULL, 'Erma Rosalina', NULL, 'Bunga Mas Bawah, Ciseke Kecil Jatinangor', NULL, NULL, NULL, '085738038093', 'Manajemen Komunikasi Fikom Unpad ''14', NULL, '200', '2016-09-16 03:44:35', '2016-09-16 03:44:35'),
(109, 123, NULL, 'I Wayan Widiarta', NULL, 'Jln Sekar Jepun V No 28, Denpasar, Bali', NULL, NULL, NULL, '085792723472', 'S1', NULL, '200', '2016-09-16 03:50:00', '2016-09-16 03:50:00'),
(110, 124, NULL, 'AA AYU JELITA SARI', NULL, 'JL. UMALAS KLECUNG 5A KEROBOKAN KELOD, KUTA UTARA, BADUNG', NULL, NULL, NULL, '085739212015', 'SMA', NULL, '200', '2016-09-16 03:59:41', '2016-09-16 03:59:41'),
(111, 126, NULL, 'I Wayan Sudarma', NULL, 'Jl. Gunung Rinjani blok 2 no 17', NULL, NULL, NULL, '085738782416', 'Mahasiswa', NULL, '200', '2016-09-16 04:08:03', '2016-09-16 04:08:03'),
(112, 127, NULL, 'Luh Ketut Sri Widhiasih', NULL, 'Jalan Semeta, Batubulan, Gianyar', NULL, NULL, NULL, '081805313010', 'Magister Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 04:24:41', '2016-09-16 04:24:41'),
(113, 128, NULL, 'I Nengah Adi Mahendra', NULL, 'Ling./Br. Sidembunut, Kel. Cempaga, Kab. Bangli, Bali', NULL, NULL, NULL, '085737655677', 'S1-Pendidikan Matematika', NULL, '200', '2016-09-16 05:06:47', '2016-09-16 05:06:47'),
(114, 129, NULL, 'Juliyanto saudila', NULL, 'Jl. Pulau moyo,perumahan nuansa kori no.19', NULL, NULL, NULL, '08813687720', 'Kuliah (S1) semester 7', NULL, '200', '2016-09-16 05:13:33', '2016-09-16 05:13:33'),
(115, 130, NULL, 'Ni Wayan Deni Apriani', NULL, 'Br. Dinas Pempatan, Desa Pempatan, Kec. Rendang, Kab. Karangasem', NULL, NULL, NULL, '08983336163', 'SMA', NULL, '200', '2016-09-16 05:29:26', '2016-09-16 05:29:26'),
(116, 131, NULL, 'Nyoman Budi Juli Artana', NULL, 'Jln srikandi..gang melon no 4..singaraja', NULL, NULL, NULL, '085738229437', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 05:39:57', '2016-09-16 05:39:57'),
(117, 132, NULL, 'Gede Hendaran', NULL, 'Br. Dinsa Desa Padangbulia', NULL, NULL, NULL, '085792970332', 'SMA', NULL, '200', '2016-09-16 05:51:28', '2016-09-16 05:51:28'),
(118, 133, NULL, 'Ida Ayu Komang Widiarini', NULL, 'Jalan Merak No. 26 Singaraja', NULL, NULL, NULL, '081339595315', 'S1 Pendidikan Ekonomi', NULL, '200', '2016-09-16 05:59:43', '2016-09-16 05:59:43'),
(119, 134, NULL, 'Ni Putu Endra Agustini', NULL, 'Bringkit, Badung', NULL, NULL, NULL, '087762613630', 'S1. pendidikan geografi', NULL, '200', '2016-09-16 06:18:40', '2016-09-16 06:18:40'),
(120, 135, NULL, 'Hendra Adi Sutika', NULL, 'Jalan Mekar 2 Blok B III No. 20, Pemogan, Denpasar Selatan', NULL, NULL, NULL, '085738891002', 'Sarjana S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 06:33:10', '2016-09-16 06:33:10'),
(121, 136, NULL, 'Putu maya apsari', NULL, 'jalan soka nomor 18, lingkungan banjar ganggasari, kelurahan kapal, kecamatan mengwi, kab.badung, bali', NULL, NULL, NULL, '081236614184', 'S1', NULL, '200', '2016-09-16 06:45:00', '2016-09-16 06:45:00'),
(122, 137, NULL, 'I Gede Yoga Permana', NULL, 'jalan pulau sugara gang 1 nomor 1', NULL, NULL, NULL, '087762000182', 'S1', NULL, '200', '2016-09-16 07:11:46', '2016-09-16 07:11:46'),
(123, 138, NULL, 'I Luh Neni Ardani', NULL, 'Desa Kaliasem, Lovina, Singaraja', NULL, NULL, NULL, '083117518418', 'S1 Pendidikan biologi', NULL, '200', '2016-09-16 07:22:30', '2016-09-16 07:22:30'),
(124, 139, NULL, 'Rita yunandari', NULL, 'jln gunung sanghyang kerobokan', NULL, NULL, NULL, '081238127110', 's1', NULL, '200', '2016-09-16 07:26:32', '2016-09-16 07:26:32'),
(125, 140, NULL, 'Sadu wirawan', NULL, 'dalung, kuta utara, badung', NULL, NULL, NULL, '085737414909', 's1 pendidikan matematika', NULL, '200', '2016-09-16 07:45:18', '2016-09-16 07:45:18'),
(126, 141, NULL, 'Putu erma pradnyani,  S. KM', NULL, 'Dalung permai blok dd 13', NULL, NULL, NULL, '085792787459', 'S1 ', NULL, '200', '2016-09-16 07:48:15', '2016-09-16 07:48:15'),
(127, 142, NULL, 'Ni Putu Santhi Widiasih', NULL, 'Jalan Cokroaminoto gang pucuk sari, Ubung, Denpasar Utara', NULL, NULL, NULL, '089678736443', 'Sedang S1 Pendidikan Matematika', NULL, '200', '2016-09-16 07:48:43', '2016-09-16 07:48:43'),
(128, 143, NULL, 'I Made Kariaba', NULL, 'kukuh, marga, tabanan', NULL, NULL, NULL, '085331801532', 'SMEA', NULL, '200', '2016-09-16 07:51:26', '2016-09-16 07:51:26'),
(129, 144, NULL, 'Septi', NULL, 'Jalan Pulau Menjangan gang Ken Arok', NULL, NULL, NULL, '081337425699', 'Kuliah Semester 7', NULL, '200', '2016-09-16 08:20:49', '2016-09-16 08:20:49'),
(130, 145, NULL, 'Imroatun Nafi''ah', NULL, 'Jl. Batursari No 48 B, Sanur', NULL, NULL, NULL, '087860016668', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 08:22:44', '2016-09-16 08:22:44'),
(131, 146, NULL, 'Ida Ayu Putu Putri Gita Sari', NULL, 'Singaraja', NULL, NULL, NULL, '089687785727', 'SMA', NULL, '200', '2016-09-16 08:55:03', '2016-09-16 08:55:03'),
(132, 147, NULL, 'Putu Febby Laksmi Decker', NULL, 'Desa Sinabun', NULL, NULL, NULL, '082236932143', 'Mahasiswa', NULL, '200', '2016-09-16 08:59:03', '2016-09-16 08:59:03'),
(133, 148, NULL, 'Kadek Wiwik Wirayanthi', NULL, 'Karangasem', NULL, NULL, NULL, '082237055366', 'SMA', NULL, '200', '2016-09-16 09:11:05', '2016-09-16 09:11:05'),
(134, 149, NULL, 'I Made Kariana', NULL, 'br.lodalang, kukuh. marga, tbn', NULL, NULL, NULL, '085738848992', 'SMEA', NULL, '200', '2016-09-16 09:34:04', '2016-09-16 09:34:04'),
(135, 150, NULL, 'Ni Luh Wanda Putri Pradanti', NULL, 'Desa Temukus,  Kecamatan Banjar,  Kabupaten Buleleng', NULL, NULL, NULL, '081236308868', 'SMA', NULL, '200', '2016-09-16 10:03:58', '2016-09-16 10:03:58'),
(136, 151, NULL, 'Josua Aditya Manuel', NULL, 'Jl. Waturenggong Gg. XVII No. 4A', NULL, NULL, NULL, '08111196196', 'SMA', NULL, '200', '2016-09-16 10:09:15', '2016-09-16 10:09:15'),
(137, 152, NULL, 'Ni Putu Meira Indrawasih', NULL, 'Jl. P. Seribu BTN GMI Blok A no. 12 Penarukan, Buleleng', NULL, NULL, NULL, '085739217933', 'Sarjana Pendidikan Kimia', NULL, '200', '2016-09-16 10:13:43', '2016-09-16 10:13:43'),
(138, 153, NULL, 'I Made Gita Pramana Putra', NULL, 'Jl. W.R. Supratman Gang IIA Kedaton No. 15 Kesiman, Denpasar', NULL, NULL, NULL, '085737027857', 'S1 Pendidikan Biologi', NULL, '200', '2016-09-16 10:16:13', '2016-09-16 10:16:13'),
(139, 154, NULL, 'Km. Nanda Rismapramanta', NULL, 'gg. bumi indah no.24, desa pemaron, singaraja', NULL, NULL, NULL, '08170660487', 's1 pendidikan bahasa inggria', NULL, '200', '2016-09-16 10:19:50', '2016-09-16 10:19:50'),
(140, 155, NULL, 'Desak Made Indah Dewanti', NULL, 'Jalan Pulau Timor gang kutilang no 2 Singaraja Bali', NULL, NULL, NULL, '081805668770', 'Magister Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 10:33:52', '2016-09-16 10:33:52'),
(141, 156, NULL, 'Ni Made Gandhi Sanjiwani', NULL, 'Jalan Ahmad Yani Utara Gang Satria Utama Nomor 38 Denpasar Utara Bali', NULL, NULL, NULL, '085858212817', 'Strata Satu (S1) Destinasi Pariwisata - STP Nusa Dua', NULL, '200', '2016-09-16 10:34:21', '2016-09-16 10:34:21'),
(142, 157, NULL, 'Kadek Putri Nadi Sari Harmaya', NULL, 'seririt', NULL, NULL, NULL, '081936533840', 'semester 5', NULL, '200', '2016-09-16 10:47:11', '2016-09-16 10:47:11'),
(143, 158, NULL, 'K.Wanda Riskaadi', NULL, 'Jln Gn Guntur gang korawa no 10', NULL, NULL, NULL, '082236112316', 'S1 Bahasa Inggris', NULL, '200', '2016-09-16 10:55:03', '2016-09-16 10:55:03'),
(144, 159, NULL, 'Ni Putu Artila Dewi', NULL, 'Desa Yehembang Bali', NULL, NULL, NULL, '087761674888', 'strata 1', NULL, '200', '2016-09-16 11:06:32', '2016-09-16 11:06:32'),
(145, 160, NULL, 'Putu Yunita', NULL, 'jalan gunung soputan perumahan puri taman no B 26', NULL, NULL, NULL, '082237781644', 'SMA', NULL, '200', '2016-09-16 11:11:20', '2016-09-16 11:11:20'),
(146, 161, NULL, 'Putuyunita', NULL, 'jalan gunung soputan perumahan puri taman no B26', NULL, NULL, NULL, '081237941901', 'SMA', NULL, '200', '2016-09-16 11:19:10', '2016-09-16 11:19:10'),
(147, 162, NULL, 'Made Dwi Lavita Sari', NULL, 'Jalan A. Yani Gang Merpati II No. 2 Peguyangan, Denpasar Utara', NULL, NULL, NULL, '085739406362', 'SMK PGRI 1 SINGARAJA ', NULL, '200', '2016-09-16 12:03:51', '2016-09-16 12:03:51'),
(148, 163, NULL, 'AA Ayu Mirah', NULL, 'jalan sutomo gang VIII no. 24 denpasar', NULL, NULL, NULL, '087861085290', 's1 pendidikan', NULL, '200', '2016-09-16 12:12:47', '2016-09-16 12:12:47'),
(149, 164, NULL, 'Gede Sidi Artajaya,S.Pd.,M.Pd.', NULL, 'Jalan Gunung Sanghyang,Gg. Siwa Loka 6 Padangsambian,Denpasar Barat', NULL, NULL, NULL, '081999003001', 'S2 Pendidikan Bahasa Indonesia', NULL, '200', '2016-09-16 12:14:48', '2016-09-16 12:14:48'),
(150, 165, NULL, 'Gede Tegar Kriswinardi', NULL, 'Jalan p.menjangan gang hasanuddin no 18', NULL, NULL, NULL, '085737689675', 'S1', NULL, '200', '2016-09-16 12:25:09', '2016-09-16 12:25:09'),
(151, 166, NULL, 'Bayu Mogana Putra', NULL, 'Belik Rt 02 Rw 04 Kecamatan Belik, Kabupaten Pemalang - Jawa Tengah 52356', NULL, NULL, NULL, '085201449355', 'Program Sarjana Hukum Islam Universitas Islam Indonesia (on progress)', NULL, '200', '2016-09-16 12:25:43', '2016-09-16 12:25:43'),
(152, 167, NULL, 'I putu mahendra sumo murti', NULL, 'jln pulau komodo gang aditya blok a no 29 singaraja', NULL, NULL, NULL, '081246899747', 's1', NULL, '200', '2016-09-16 12:34:50', '2016-09-16 12:34:50'),
(153, 168, NULL, 'Sang Putu Arsana', NULL, 'Jalan Ki Hajar Dewantara, Semarapura Tengah, Klungkung', NULL, NULL, NULL, '087861477078', 'S2 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-16 12:36:28', '2016-09-16 12:36:28'),
(154, 169, NULL, 'Wayan Agus putrawan', NULL, 'Br. belaluan, singapadu tengah', NULL, NULL, NULL, '081805384831', 's2', NULL, '200', '2016-09-16 13:08:56', '2016-09-16 13:08:56'),
(155, 170, NULL, 'I Gusti Ngurah Wahyudi Putra', NULL, 'Br. Menak, Tulikup, Gianyar', NULL, NULL, NULL, '085792206544', 'Sarjana Pendidikan Matematika', NULL, '200', '2016-09-16 13:41:58', '2016-09-16 13:41:58'),
(156, 171, NULL, 'Dwi Cahyo Nugroho', NULL, 'Jl. Letjen S.Parman Gg 1A No.05', NULL, NULL, NULL, '081238335912', 'S1', NULL, '200', '2016-09-16 14:05:51', '2016-09-16 14:05:51'),
(157, 172, NULL, 'Dwi Cahyo Nugroho', NULL, 'Jl. Letjen S.Parman Gg 1A No.05', NULL, NULL, NULL, '083873664698', 'S1', NULL, '200', '2016-09-16 14:09:59', '2016-09-16 14:09:59'),
(158, 173, NULL, 'Kadek ayu meisa dewi', NULL, 'jalan sahadewa 9b buleleng', NULL, NULL, NULL, '085739665902', 'semester 5 pendidikan matematika undiksha', NULL, '200', '2016-09-16 14:42:09', '2016-09-16 14:42:09'),
(159, 174, NULL, 'I Gede Nyoman Arya Risaldi Dwi Nugraha', NULL, 'Perum. Graha Pertiwi, Banjar Gede, Abianbase, Mengwi, Badung.', NULL, NULL, NULL, '085738520946', 'SMA', NULL, '200', '2016-09-16 16:03:56', '2016-09-16 16:03:56'),
(160, 175, NULL, 'I Wayan Dipta Samsidim', NULL, 'Jl. Raya Mas No. 207, Br. Batanancak, Mas, Ubud', NULL, NULL, NULL, '089638963390', 'Sarjana Pendidikan', NULL, '200', '2016-09-16 16:43:06', '2016-09-16 16:43:06'),
(161, 176, NULL, 'Komang Ayu Juniati', NULL, 'BTN. Taman Sari Br.Sibang Jagapati Badung', NULL, NULL, NULL, '085739219276', 'S1-Pendidikan Kimia', NULL, '200', '2016-09-16 23:50:52', '2016-09-16 23:50:52'),
(162, 177, NULL, 'Kristina meta', NULL, 'jln. jagapati', NULL, NULL, NULL, '08214438042', 'sma', NULL, '200', '2016-09-17 01:18:41', '2016-09-17 01:18:41'),
(163, 178, NULL, 'I Putu Hendra Setiawan', NULL, 'Jln. Sulatri Gg.Merdeka II No.2, Denpasar Timur', NULL, NULL, NULL, '08174702882', 'S1', NULL, '200', '2016-09-17 01:54:05', '2016-09-17 01:54:05'),
(164, 179, NULL, 'Putu Owen Purusa Arta', NULL, 'Banjar Apuan Singapadu Sukawati', NULL, NULL, NULL, '08813133077', 'SMA', NULL, '200', '2016-09-17 02:32:16', '2016-09-17 02:32:16'),
(165, 180, NULL, 'Md.  Mahendra Eka Purusa', NULL, 'jl wibisana 2e singaraja,  bali', NULL, NULL, NULL, '081805667376', 's1 pendidikan fisika', NULL, '200', '2016-09-17 02:58:52', '2016-09-17 02:58:52'),
(166, 181, NULL, 'Diyan noorahmad', NULL, 'jl tukad buaji, gg teratai jingga no 39 denpasar selatan', NULL, NULL, NULL, '082227723309', 'Diploma III', NULL, '200', '2016-09-17 03:13:18', '2016-09-17 03:13:18'),
(167, 182, NULL, 'Aditya Ridho Fatmawan', NULL, 'Jalan Bangao Gg. Kesatrian, Kaliuntu, Singaraja', NULL, NULL, NULL, '087860350921', 'Mahasiswa', NULL, '200', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(168, 183, NULL, 'I Dewa Ayu Adiniati', NULL, 'Br Mengening, Desa Nyitdah Kediri Tabanan Bali', NULL, NULL, NULL, '085738129961', 'S1 Pendidikan Biologi', NULL, '200', '2016-09-17 03:56:53', '2016-09-17 03:56:53'),
(169, 184, NULL, 'I Dewa Ayu Adiniati, S.Pd', NULL, 'Br.Mengening, Desa Nyitdah Kediri  Tabanan', NULL, NULL, NULL, '085339081924', 'S1 Pendidikan Biologi', NULL, '200', '2016-09-17 04:01:15', '2016-09-17 04:01:15'),
(170, 185, NULL, 'I Gede Dharma Swanditha', NULL, 'Lingk. Roban Bitera Gianyar', NULL, NULL, NULL, '081246312194', 'SMA', NULL, '200', '2016-09-17 04:07:52', '2016-09-17 04:07:52'),
(171, 186, NULL, 'Dedy Noviansyah Putra', NULL, 'jl. bisma. ubud', NULL, NULL, NULL, '082247234504', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-17 04:38:15', '2016-09-17 04:38:15'),
(172, 187, NULL, 'Komang Satriaperbawa Irawan', NULL, 'Jalan Pulau Seribu Perumahan Griya Mandala Indah Blok B No 72 Singaraja', NULL, NULL, NULL, '085792574993', 'Sarjana Pendidikan', NULL, '200', '2016-09-17 04:49:04', '2016-09-17 04:49:04'),
(173, 188, NULL, 'Komang Satriaperbawa.Irawan', NULL, 'Singaraja Bali', NULL, NULL, NULL, '081805395994', 'Sarjana Pendidikan', NULL, '200', '2016-09-17 04:54:08', '2016-09-17 04:54:08'),
(174, 189, NULL, 'I Putu Agus Triana, S.Pd', NULL, 'Desa baluk, Kec.negare, Kab. jembrana', NULL, NULL, NULL, '087762446180', 'S 1 Olahraga', NULL, '200', '2016-09-17 06:40:34', '2016-09-17 06:40:34'),
(175, 190, NULL, 'Nathalia Kusumasetyarini', NULL, 'Jalan Gelatik 5C Dusun Sono Wedomartani Ngemplak Sleman', NULL, NULL, NULL, '08179642579', 'S2', NULL, '200', '2016-09-17 07:15:09', '2016-09-17 07:15:09'),
(176, 191, NULL, 'Ni komang meriyanti', NULL, 'singaraja', NULL, NULL, NULL, '08786834070', 'S1 pendidikan ekonomi', NULL, '200', '2016-09-17 08:23:57', '2016-09-17 08:23:57'),
(177, 192, NULL, 'KETUT HENDRA', NULL, 'Jl. Gempol no.150 Singaraja', NULL, NULL, NULL, '087762334848', 'S1 PENDIDIKAN EKONOMI', NULL, '200', '2016-09-17 08:34:16', '2016-09-17 08:34:16'),
(178, 193, NULL, 'I Komang Rika Adi Putra, M.Pd. ', NULL, 'Penatih, Denpasar', NULL, NULL, NULL, '081936674991', 'S2 Pendidikan Bahasa Kosentrasi Bahasa Indonesia', NULL, '200', '2016-09-17 09:17:28', '2016-09-17 09:17:28'),
(179, 194, NULL, 'Cok Istri Tirta Parhayani', NULL, 'Jalan Batuyang, Br. Tangkeban, Batubulan Kangin, Sukawati, Gianyar', NULL, NULL, NULL, '087762343402', 'Sarjana Pendidikan Matematika', NULL, '200', '2016-09-17 09:49:40', '2016-09-17 09:49:40'),
(180, 195, NULL, 'Ni Made Dewi Septiantari', NULL, 'Jln. Narakusuma, Denpasar', NULL, NULL, NULL, '085737233081', 'Pendidikan Matematika', NULL, '200', '2016-09-17 13:27:38', '2016-09-17 13:27:38'),
(181, 196, NULL, 'Ni Putu Ana Agusthini', NULL, 'jl. Gunung Salak Gg. Tegal Abadi Kerobokan, Badung, Bali', NULL, NULL, NULL, '081936560572', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-17 13:32:00', '2016-09-17 13:32:00'),
(182, 197, NULL, 'Ni Made Erlinta Devi', NULL, 'Br.Sayan Delodan, Desa Werdhi Bhuwana, Mengwi', NULL, NULL, NULL, '085738697089', 'S1 ( Pendidikan Matematika)', NULL, '200', '2016-09-17 22:32:27', '2016-09-17 22:32:27'),
(183, 198, NULL, 'Ni Luh Putu Suriyatmini', NULL, 'jl. Merpati No 11 Monang Maning Denpasar Barat', NULL, NULL, NULL, '087861222368', 's1 Biologi', NULL, '200', '2016-09-17 23:32:33', '2016-09-17 23:32:33'),
(184, 199, NULL, 'Ihsan lahibda', NULL, 'jakarta', NULL, NULL, NULL, '082284546514', 'diploma', NULL, '200', '2016-09-18 00:06:14', '2016-09-18 00:06:14'),
(185, 200, NULL, 'Sinta ary gasella', NULL, 'jln. raya Sibangkaja no. 02, Desa Sibangkaja, Abiansemal, Badung', NULL, NULL, NULL, '087861991836', 'sarjana pendidikan bahasa inggris', NULL, '200', '2016-09-18 02:21:40', '2016-09-18 02:21:40'),
(186, 201, NULL, 'Miftahul Jannah', NULL, 'Lelateng, Negara-Bali', NULL, NULL, NULL, '082237090920', 'MA (Madrasah Aliyah)', NULL, '200', '2016-09-18 03:01:35', '2016-09-18 03:01:35'),
(187, 202, NULL, 'Ni Kadek Ayu Widari', NULL, 'jln. siulan no 29 br. palagiri, denpasar timur, bali', NULL, NULL, NULL, '081339499909', 'sarjana ekonomi', NULL, '200', '2016-09-18 03:51:49', '2016-09-18 03:51:49'),
(188, 203, NULL, 'Ni wayan aryastuti', NULL, 'jl. uluwatu jl.pura beji Gg.1 no.1', NULL, NULL, NULL, '081339188554', 'S1', NULL, '200', '2016-09-18 04:23:44', '2016-09-18 04:23:44'),
(189, 204, NULL, 'Sugiarti ningsih', NULL, 'banjar dinas tengah desa peken belayu marga tabanan', NULL, NULL, NULL, '081246075810', 'S1 paud', NULL, '200', '2016-09-18 04:27:42', '2016-09-18 04:27:42'),
(190, 205, NULL, 'Juni darmayanti', NULL, 'jalan darmawangsa no 8A tabanan', NULL, NULL, NULL, '082247783863', 'S1 pendidikan fisika', NULL, '200', '2016-09-18 06:26:45', '2016-09-18 06:26:45'),
(191, 206, NULL, 'Ni Ketut Apriliyani', NULL, 'Jln. Jepun Pipil, G. X No. 24, Dentim', NULL, NULL, NULL, '08563786335', ' Pendidikan Bahasa Inggris (S1)', NULL, '200', '2016-09-18 11:21:34', '2016-09-18 11:21:34'),
(192, 207, NULL, 'Ramanta Bali Pratama, S.Pd', NULL, 'Br. Dinas Sindu Bali, Karangasem, Bali ', NULL, NULL, NULL, '083117504526', 'Sarjana ', NULL, '200', '2016-09-18 11:27:37', '2016-09-18 11:27:37'),
(193, 208, NULL, 'Ni Made Dewi Septiantari', NULL, 'Jln Narakusuma Gg II A no 11A, Denpasar Timur', NULL, NULL, NULL, '085792617082', 'S1 Pendidikan Matematika', NULL, '200', '2016-09-18 11:39:36', '2016-09-18 11:39:36'),
(194, 210, NULL, 'Ni Made Tyagita Viviana', NULL, 'Jalan Abimayu II No : 4 Singaraja', NULL, NULL, NULL, '085338468028', 'SMA', NULL, '200', '2016-09-18 12:48:17', '2016-09-18 12:48:17'),
(195, 211, NULL, 'I Gusti Putu Hendranatha Wijaya', NULL, 'Batuaji, Kecamatan Kerambitan, Tabanan-Bali', NULL, NULL, NULL, '087762730658', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-18 13:13:23', '2016-09-18 13:13:23'),
(196, 212, NULL, 'Dewa Gede Agung Dharmayasa', NULL, 'Jalan Batuyang Gang Garuda 4 Batubulan', NULL, NULL, NULL, '081246713399', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(197, 213, NULL, 'Ketut wira adi armaeni', NULL, 'jalan gunung batukaru gang iv no 11, denpasar barat ', NULL, NULL, NULL, '085738082730', 's1 pendidikan agama hindu ', NULL, '200', '2016-09-18 14:44:57', '2016-09-18 14:44:57'),
(198, 214, NULL, 'I PUTU WIDHI ASTIKA, S.PD.', NULL, 'Jln. Mayor Metra Gang 14 Nomor 3D, Liligundi, Singaraja', NULL, NULL, NULL, '087762456555', 'S1-Pendidikan Bahasa Bali', NULL, '200', '2016-09-18 16:00:09', '2016-09-18 16:00:09'),
(199, 215, NULL, 'Desak putu aprillia dewi', NULL, 'jalan raya mambal, abiansemal, badung', NULL, NULL, NULL, '089646309092', 'semester 5', NULL, '200', '2016-09-18 18:14:06', '2016-09-18 18:14:06'),
(200, 216, NULL, 'Kadek ermanda kurniawan', NULL, 'banjar dinas tegal menasa, desa sangsit, kecamatan sawan. buleleng. bali', NULL, NULL, NULL, '085857869075', 'S.2 Pendidikan IPS', NULL, '200', '2016-09-18 23:36:48', '2016-09-18 23:36:48'),
(201, 217, NULL, 'Kadek ermanda kurniawan', NULL, 'banjar dinas tegal menasa. desa sangsit, kecamatan sawan. buleleng bali', NULL, NULL, NULL, '085739934689', 's.2 pendidikan IPS', NULL, '200', '2016-09-18 23:41:18', '2016-09-18 23:41:18'),
(202, 218, NULL, 'Kadek Tiara Virgianti', NULL, 'Dusun Banyubiru, Desa Airnakan, Kec.Negara, Kab.Jembrana', NULL, NULL, NULL, '081936660203', 'S1 Pendidikan Bahasa Jepang', NULL, '200', '2016-09-19 01:28:42', '2016-09-19 01:28:42'),
(203, 219, NULL, 'Rival Fahlefy', NULL, 'Jln. Batuyang Gang Merpati No. 16 Batubulan - Gianyar ', NULL, NULL, NULL, '087806553032', 'D3 Teknik Informatika', NULL, '200', '2016-09-19 02:48:37', '2016-09-19 02:48:37'),
(204, 220, NULL, 'Ni kadek sri utami', NULL, 'mengwi', NULL, NULL, NULL, '082247706152', 'smk management', NULL, '200', '2016-09-19 05:03:40', '2016-09-19 05:03:40'),
(205, 221, NULL, 'Putu Eka Sri Ariastini', NULL, 'Perum Darmasaba Permai III C. 22,Abiansemal,Badung', NULL, NULL, NULL, '085739252115', 'Magister Pendidikan Bahasa Inggris', NULL, '200', '2016-09-19 05:49:31', '2016-09-19 05:49:31'),
(206, 222, NULL, 'I Kadek Adi Wiputra', NULL, 'Br Jeruk Mancingan,Susut,Bangli,Bali', NULL, NULL, NULL, '081805600080', 'S1 Pendidikan Matematika', NULL, '200', '2016-09-19 07:00:18', '2016-09-19 07:00:18'),
(207, 223, NULL, 'I Kadek Adi Wiputra', NULL, 'Br Jerukmancingan, Susut, Bangli', NULL, NULL, NULL, '081558167443', 'S1 Pendidikan Matematika', NULL, '200', '2016-09-19 07:06:43', '2016-09-19 07:06:43'),
(208, 224, NULL, 'Ni made ayu vinandari safitri', NULL, 'jalan waturenggong gang 18, denpasar- bali', NULL, NULL, NULL, '087863248879', 'S1 bahasa inggris', NULL, '200', '2016-09-19 07:25:57', '2016-09-19 07:25:57'),
(209, 225, NULL, 'Luh Komang Sri Pramawati', NULL, 'Dusun Pakel, Desa Sampalan Tengah, Kecamatan Dawan, Kabupaten Klungkung, Bali.', NULL, NULL, NULL, '089601282811', 'S1 Pendidikan Bahasa Bali', NULL, '200', '2016-09-19 12:08:07', '2016-09-19 12:08:07'),
(210, 226, NULL, 'I Gede Diyardita Dipa', NULL, 'Jalan Laksamana Gang Arjuna 4X, Bakrisraga, Singaraja', NULL, NULL, NULL, '081916490829', 'SMA ', NULL, '200', '2016-09-19 12:34:57', '2016-09-19 12:34:57'),
(211, 228, NULL, 'I gusti agung katon rai andika', NULL, 'gedung asrama putra telkom university bandung jawa barat', NULL, NULL, NULL, '082213644660', 'smk', NULL, '200', '2016-09-19 16:26:45', '2016-09-19 16:26:45'),
(212, 229, NULL, 'Budiartini', NULL, 'jalan tirta tawar no 31, kutuh kelod, petulu, ubud, gianyar', NULL, NULL, NULL, '081805445422', 'S 1', NULL, '200', '2016-09-20 03:42:05', '2016-09-20 03:42:05'),
(213, 230, NULL, 'I nengah agus tripayana', NULL, 'jalan akasia denpasar', NULL, NULL, NULL, '085737453513', 's2', NULL, '200', '2016-09-20 06:31:30', '2016-09-20 06:31:30'),
(214, 231, NULL, 'Putu Andika Panendra', NULL, 'Jln. Laksamana Gang Arjuna no. 8 Singaraja', NULL, NULL, NULL, '08563990195', 'Sarjana S1 Undiksha - Ped Seni Rupa', NULL, '200', '2016-09-20 10:52:04', '2016-09-20 10:52:04'),
(215, 232, NULL, 'Putu Ika Shinta Dewi', NULL, 'banjar tubuh blahbatuh, gianyar', NULL, NULL, NULL, '08979207932', 'pendidikan bahasa jepang d3', NULL, '200', '2016-09-20 11:49:34', '2016-09-20 11:49:34'),
(216, 233, NULL, 'Ni Wayan Wita Astiti Sari', NULL, 'Jalan Nusantara no.146 Kubu, Bangli', NULL, NULL, NULL, '08563745637', 'SMA', NULL, '200', '2016-09-20 12:20:28', '2016-09-20 12:20:28'),
(217, 234, NULL, 'Hesti januarini', NULL, 'jalan gunung bromo XI no.48 denpasar', NULL, NULL, NULL, '085737441724', 'S.Pd', NULL, '200', '2016-09-21 02:32:15', '2016-09-21 02:32:15'),
(218, 235, NULL, 'Ni Made Rima Leliyanti', NULL, 'Banjar Dinas Jegu Tengah, Jegu, Penebel, Tabanan, Bali', NULL, NULL, NULL, '081999849791', 'S-1 Pendidikan Bahasa Jepang', NULL, '200', '2016-09-21 07:46:20', '2016-09-21 07:46:20'),
(219, 236, NULL, 'Aprilaningrum', NULL, 'Gianyar', NULL, NULL, NULL, '085739183591', 'Magister Pendidikan', NULL, '200', '2016-09-21 08:46:14', '2016-09-21 08:46:14'),
(220, 237, NULL, 'Ni Nyoman Tri Purnami', NULL, 'sayan ubud', NULL, NULL, NULL, '085738031595', 'S1', NULL, '200', '2016-09-21 09:40:25', '2016-09-21 09:40:25'),
(221, 238, NULL, 'Kadek Gede Doni Merta Marantika', NULL, 'desa tumbak bayuh', 80351, '-8.6184214', '115.1429663', '085936116718', 'Sarjana Pendidikan Matematika (S1)', NULL, '200', '2016-09-22 05:17:00', '2016-11-26 22:40:30'),
(222, 239, NULL, 'Made Arista Dewi', NULL, 'Jalan Pulau Seribu Gg. Yudistira No. 2, Singaraja', NULL, NULL, NULL, '085739224075', 's1 pendidikan matematika', NULL, '200', '2016-09-22 05:45:43', '2016-09-22 05:45:43'),
(223, 240, NULL, 'Ni Putu Sulastri', NULL, 'Br. Jasan, Sebatu, Tegallalang, Gianyar, Bali', NULL, NULL, NULL, '081936038599', 'S1 Pendidikan Matematika', NULL, '200', '2016-09-22 06:05:26', '2016-09-22 06:05:26'),
(224, 241, NULL, 'Putu sri ayu padmi', NULL, 'Dusun Kelodan Desa Kalianget Kecamatan Seririt Kabupaten Buleleng Bali', NULL, NULL, NULL, '085739033926', 'S1 Bahasa Inggris', NULL, '200', '2016-09-22 11:40:22', '2016-09-22 11:40:22'),
(225, 242, NULL, 'Luh Gede Tri Purwani Dewi', NULL, 'Jalan Pulau Ambon Gg. Kelinci 10, Denpasar Barat, Denpasar', NULL, NULL, NULL, '085738320599', 'S1 English Language Teaching', NULL, '200', '2016-09-22 14:13:16', '2016-09-22 14:13:16'),
(226, 243, NULL, 'Ayu Juwita', NULL, 'Jln Cekomaria Perum Dosen Kopertis Gutiswa III No 40', NULL, NULL, NULL, '081558905923', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-22 16:59:14', '2016-09-22 16:59:14'),
(227, 244, NULL, 'I DEWA GEDE PUTRA ARDINATA', NULL, 'Jln buana raya perumahan surya buana no 37. Denpasar', NULL, NULL, NULL, '08983141246', 'S1', NULL, '200', '2016-09-23 08:45:11', '2016-09-23 08:45:11'),
(228, 245, NULL, 'I Komang Indra Wibawa', NULL, 'jalan plawa, gang IX B, no. 18', NULL, NULL, NULL, '083119991848', 'S1 Pendidikan Fisika', NULL, '200', '2016-09-23 14:01:56', '2016-09-23 14:01:56'),
(229, 246, NULL, 'Putu Bagus Mahardika', NULL, 'Br. Mantring Tampaksiring', NULL, NULL, NULL, '087861145359', 'S1 Pendidikan Bahasa Inggris', NULL, '200', '2016-09-24 01:07:06', '2016-09-24 01:07:06'),
(230, 247, NULL, 'Gusti Ayu Putu Taharyanti', NULL, 'Jalan Made Bina Perumahan Bina Permai No. 150/Blok 1 Ubung Kaja, Denpasar Utara', NULL, NULL, NULL, '081236310803', 'SMA', NULL, '200', '2016-09-24 01:49:36', '2016-09-24 01:49:36'),
(231, 248, NULL, 'Gusti Ayu Putu Taharyanti', NULL, 'Jl. Made Bina No.150 Denpasar Utara', NULL, NULL, NULL, '08123992696', 'SMA', NULL, '200', '2016-09-24 01:56:05', '2016-09-24 01:56:05'),
(232, 249, NULL, 'Putu Bagus Mahardika', NULL, 'BR. MANTRING TAMPAKSIRING', NULL, NULL, NULL, '083117799616', 'S1 PENDIDIKAN BAHASA INGGRIS', NULL, '200', '2016-09-24 03:07:09', '2016-09-24 03:07:09'),
(233, 250, NULL, 'Herlyn puspita', NULL, 'denpasar', NULL, NULL, NULL, '08174794865', 'S1', NULL, '200', '2016-09-24 04:23:01', '2016-09-24 04:23:01'),
(234, 251, NULL, 'Herlyn puspita', NULL, 'sesetan, denpasar', NULL, NULL, NULL, '081936273747', 'S1', NULL, '200', '2016-09-24 04:36:25', '2016-09-24 04:36:25'),
(235, 252, NULL, 'Ratih Mas Absari', NULL, 'Jalan Pulau Bali Gang IV No. 26, Singaraja', NULL, NULL, NULL, '085739098648', 'SMA', NULL, '200', '2016-09-24 11:01:40', '2016-09-24 11:01:40'),
(236, 253, NULL, 'Ni Luh Putu Suriyatmini ', NULL, 'jl. merpati no 11 monang maning denpasar barat', NULL, NULL, NULL, '081237496408', 's1 biologi', NULL, '200', '2016-09-25 02:43:38', '2016-09-25 02:43:38'),
(237, 254, NULL, 'Ni Luh Putu Suriyatmini, S.Pd', NULL, 'jl. merpati no 11 monang maning Denpasar Barat', NULL, NULL, NULL, '081236857481', 's1 biologi', NULL, '200', '2016-09-25 02:51:47', '2016-09-25 02:51:47'),
(238, 255, NULL, 'Ayuning January', NULL, 'Perumahan Dalung Permai-Kuta Utara-Badung', NULL, NULL, NULL, '085739687556', 'S1', NULL, '200', '2016-09-25 08:32:21', '2016-09-25 08:32:21'),
(239, 256, NULL, 'Luh Ayu Widiari', NULL, 'Desa Sangsit Dusun Abasan,Singaraja,Bali', NULL, NULL, NULL, '087762797657', 'SMA', NULL, '200', '2016-09-26 00:06:17', '2016-09-26 00:06:17'),
(240, 257, NULL, 'Ni Kadek Evie Febrianti', NULL, 'Jalan Tukad Yeh Biu Gang SD 10 Nomor 09', NULL, NULL, NULL, '08873437087', 'SMK', NULL, '200', '2016-09-26 09:00:57', '2016-09-26 09:00:57'),
(241, 258, NULL, 'Ida bagus cahyadi manuaba', NULL, 'Desa Bubunan,dsn kajanan', NULL, NULL, NULL, '081936266993', 'S1 PGSD', NULL, '200', '2016-09-27 00:36:15', '2016-09-27 00:36:15'),
(242, 260, NULL, 'Ni Putu Ayu Rosita Rasmi', NULL, 'Jalan Gelogor Carik, Perum Cuculan Permai no 44 Denpasar', NULL, NULL, NULL, '08174772798', 'S1', NULL, '200', '2016-09-27 08:29:46', '2016-09-27 08:29:46'),
(243, 261, NULL, 'Nyoman Canestra Adi Putra', NULL, 'Jalan Gn. Batur Gg III No. 9, Singaraja', NULL, NULL, NULL, '081337175277', 'S2', NULL, '200', '2016-09-27 23:14:35', '2016-09-27 23:14:35'),
(244, 262, NULL, 'Made Candra Parwati', NULL, 'Perumahan taman sriwedari 4 no 2.Jjalan Raya Kapal Munggu. ', NULL, NULL, NULL, '082341842393', 'S2', NULL, '200', '2016-09-28 06:05:02', '2016-09-28 06:05:02'),
(245, 263, NULL, 'Desak Ketut Putri Handayani', NULL, 'Jl. Bangau, no. 7, Kaliuntu, Singaraja', NULL, NULL, NULL, '085737699754', 'SMA', NULL, '200', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(246, 264, NULL, 'Pande putu sri suandewi', NULL, 'banjar dinas umejero,desa umejero kecamatan busungbiu', NULL, NULL, NULL, '085792606825', 'sarjana (s1 pgsd)', NULL, '200', '2016-09-28 09:54:06', '2016-09-28 09:54:06'),
(247, 265, NULL, 'Gede Irwandika ', NULL, 'Jalan Nangka Utara,Gang Kusumasari, Denpasar', NULL, NULL, NULL, '087863208096', 's1', NULL, '200', '2016-09-30 11:45:13', '2016-09-30 11:45:13'),
(248, 266, NULL, 'Pratyaksa ', NULL, 'dalung oermaiblok bb 41 kuta utara badung bali', NULL, NULL, NULL, '03619004655', 's2', NULL, '200', '2016-10-02 01:35:32', '2016-10-02 01:35:32'),
(249, 267, NULL, 'Ketut canggih dhermawan', NULL, 'jalan setia budi no 125, singaraja-bali', NULL, NULL, NULL, '081339565643', 's1', NULL, '200', '2016-10-04 01:29:17', '2016-10-04 01:29:17');
INSERT INTO `tb_pengajar` (`id`, `user_id`, `zona_id`, `fullname`, `photo`, `pengajar_alamat`, `kodepos`, `latitude`, `longitude`, `pengajar_cp`, `pengajar_pendidikan`, `pengajar_rating`, `status_mengajar`, `created_at`, `updated_at`) VALUES
(250, 268, NULL, 'Kadek jara merani', NULL, 'Banjar dinas segara desa giri emas, kec Sawan, kab Buleleng Bali.', NULL, NULL, NULL, '087762636698', 'S1 Pendidikan Bahasa Bali', NULL, '200', '2016-10-04 08:11:01', '2016-10-04 08:11:01'),
(251, 269, NULL, 'Md Adi Nugraha T', NULL, 'Perumahan Banyuning Permai Blok A1 No 1', NULL, NULL, NULL, '083117313074', 'S1', NULL, '200', '2016-10-05 21:08:24', '2016-10-05 21:08:24'),
(252, 270, NULL, 'Gusti Ayu Nyoman Budiwati', NULL, 'Jln. Suweta No. 22 Sambahan, Ubud.', NULL, NULL, NULL, '087861573822', 'S2', NULL, '200', '2016-10-07 07:07:31', '2016-10-07 07:07:31'),
(253, 271, NULL, 'Ni made premayani', NULL, 'jl pantai indah gang 2 no 27', NULL, NULL, NULL, '085857412553', 's1 pendidikan biologi', NULL, '200', '2016-10-09 05:55:03', '2016-10-09 05:55:03'),
(254, 272, NULL, 'Ratih Ayu Apsari', NULL, 'Jalan Sudirman, Singaraja', NULL, NULL, NULL, '087861726428', 'S2', NULL, '200', '2016-10-10 12:47:20', '2016-10-10 12:47:20'),
(255, 273, NULL, 'Diah Acintya', NULL, 'Jl.Batu Intab IA no 2 Batubulan', NULL, NULL, NULL, '082237788288', 'S1', NULL, '200', '2016-10-11 13:11:41', '2016-10-11 13:11:41'),
(256, 274, NULL, 'Ni Putu Suryantini,SPd', NULL, 'jln. Pantai Pererenan gg gunungkawi', NULL, NULL, NULL, '081936100070', 'S1 fKIP bahasa inggris', NULL, '200', '2016-10-13 01:56:56', '2016-10-13 01:56:56'),
(257, 276, NULL, 'Wina andriani', NULL, 'perumahan ganggu permai', NULL, NULL, NULL, '085792224028', 'S1 biologi', NULL, '200', '2016-10-15 15:19:00', '2016-10-15 15:19:00'),
(258, 277, NULL, 'Ni Putu Sri Utami Putri', NULL, 'Jl. Mataram No.10 Bali ', NULL, NULL, NULL, '081246919899', 's1', NULL, '200', '2016-10-17 00:22:26', '2016-10-17 00:22:26'),
(259, 280, NULL, 'Agus tripayana', NULL, 'denpasar', NULL, NULL, NULL, '085858653426', 's2', NULL, '200', '2016-10-19 02:42:38', '2016-10-19 02:42:38'),
(260, 281, NULL, 'Luh karyawati', NULL, 'jln tegik damai I no I taman graha II taman griya jimbaran', NULL, NULL, NULL, '081338629469', 'D3', NULL, '200', '2016-10-22 05:25:46', '2016-10-22 05:25:46'),
(261, 282, NULL, 'Nita anggraini', NULL, 'Nusa dua', NULL, NULL, NULL, '081805400120', 'S2', NULL, '200', '2016-10-22 05:26:55', '2016-10-22 05:26:55'),
(262, 285, NULL, 'Dista Ariyani', NULL, 'Br. Padang bali-Dalung', NULL, NULL, NULL, '082141825158', 'Sarjana Pendidikan Biologi', NULL, '200', '2016-11-01 09:45:54', '2016-11-01 09:45:54'),
(263, 288, NULL, 'Soelistyawati', NULL, 'international village 1/ b5-22, citraland. surabaya', NULL, NULL, NULL, '0818316271', 'university', NULL, '200', '2016-11-09 13:09:20', '2016-11-09 13:09:20'),
(264, 289, NULL, 'Pak boy', NULL, 'br sebali keliki tegalalang gianyar', NULL, NULL, NULL, '082340053554', 'D1', NULL, '200', '2016-11-11 09:24:46', '2016-11-11 09:24:46'),
(265, 290, NULL, 'Putu Asri Riani Setiawati', NULL, 'Jalan Tukad Badung XIX Blok A No. 33 Denpasar', NULL, NULL, NULL, '081936364005', 'S1 PGSD', NULL, '200', '2016-11-12 02:30:34', '2016-11-12 02:30:34'),
(266, 291, NULL, 'Diana Asti ', NULL, 'Jl. Narakusuma Gg. VI /1, Denpasar ', 80235, '-8.6423491', '115.2348589', '081916339226', 'S1 PGSD', NULL, '200', '2016-11-13 02:28:50', '2016-11-19 21:13:39'),
(267, 293, NULL, 'Putu Andika Panendra, S.Pd.', '2677A3YTg9A5I.jpg', '', NULL, NULL, NULL, '08563990195', 'S1 Pendidikan Seni Rupa Undiksha', NULL, '200', '2016-11-16 03:20:59', '2016-11-22 02:52:29'),
(268, 294, NULL, 'I Ketut Suartika', NULL, 'br.Saraseda,Tampaksiring,Gianyar', NULL, NULL, NULL, '08563741591', 's1', NULL, '200', '2016-11-16 04:48:50', '2016-11-16 04:48:50'),
(269, 295, NULL, 'Bernard Milano', NULL, 'Jalan Tukad Batanghari X', NULL, NULL, NULL, '081246023052', 'S1', NULL, '200', '2016-11-16 05:13:48', '2016-11-16 05:13:48'),
(270, 296, NULL, 'Teguh budiyasa', NULL, 'banjar dauh peken, desa penarungan, kec. mengwi-badung', NULL, NULL, NULL, '085737098829', 'S1 pendidikan sejarah', NULL, '200', '2016-11-17 03:37:12', '2016-11-17 03:37:12'),
(272, 300, NULL, 'Putu Sartika', NULL, 'Jl.Kenyeri no 10, Br. Sumerta, Denpasar, Timur', 80236, '-8.6478228', '115.2300113', '083117238272', 'S1Pendidikan Bahasa Jepang', NULL, '200', '2016-11-21 01:39:07', '2016-11-21 01:39:07'),
(273, 302, NULL, 'I Made Adhy Suryanta Saputra', NULL, 'jalan pulau bawean no 55 denpasar', 80113, '-8.6797886', '115.2085063', '085748288886', 'S1', NULL, '200', '2016-11-21 06:33:26', '2016-11-24 06:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_prestasi_pengajar`
--

CREATE TABLE IF NOT EXISTS `tb_prestasi_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajar_id` int(11) NOT NULL,
  `prestasi` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `tb_prestasi_pengajar`
--

INSERT INTO `tb_prestasi_pengajar` (`id`, `pengajar_id`, `prestasi`, `created_at`, `updated_at`) VALUES
(1, 6, 'Mengambar', '2016-08-30 10:35:33', '2016-08-30 10:35:33'),
(2, 7, 'Awesome', '2016-08-30 10:43:21', '2016-08-30 10:43:21'),
(3, 7, 'Tampan', '2016-08-30 10:43:21', '2016-08-30 10:43:21'),
(4, 7, 'Berani', '2016-08-30 10:43:21', '2016-08-30 10:43:21'),
(5, 8, 'juara 1 lomba tari pendet', '2016-09-11 02:36:56', '2016-09-11 02:36:56'),
(6, 9, 'Juara Mengajar', '2016-09-11 08:11:34', '2016-09-11 08:11:34'),
(7, 10, 'Olimpiade fisika sma', '2016-09-12 02:22:40', '2016-09-12 02:22:40'),
(8, 12, 'Juara 2 Lomba Dharmawacana Porsenijar', '2016-09-12 02:41:44', '2016-09-12 02:41:44'),
(9, 12, 'Juara 2 Lomba Olimpiade Sains Nasional (Kebumian)', '2016-09-12 02:41:44', '2016-09-12 02:41:44'),
(10, 12, 'Juara 2 Lomba Baca Puisi Fakultas Ilmu Pendidikan', '2016-09-12 02:41:44', '2016-09-12 02:41:44'),
(11, 12, 'Juara 1 umum kelas x, xi, xii', '2016-09-12 02:41:44', '2016-09-12 02:41:44'),
(12, 14, 'Pengalaman mengajar ', '2016-09-12 02:51:27', '2016-09-12 02:51:27'),
(13, 19, 'Camper of Pre Service English Teacher Training 2016 Sponsored by RELO US Embassy', '2016-09-12 03:47:58', '2016-09-12 03:47:58'),
(14, 19, 'Cumlauder of English Education Department Unidksha', '2016-09-12 03:47:58', '2016-09-12 03:47:58'),
(15, 27, 'Skripsi Terbaik Wisuda 17 Stikom Bali', '2016-09-12 08:26:34', '2016-09-12 08:26:34'),
(16, 30, 'Juara 1 Lomba Bussines Plan Cooperative Fair ESCO Fakultas Ekonomi Universitas Indonesia tingkat Nas', '2016-09-12 10:33:57', '2016-09-12 10:33:57'),
(17, 30, 'Juara 3 Lomba Desain Kemasan Endek Dinas Perindustrian dan Perdagangan Kota Denpasar tahun 2015', '2016-09-12 10:33:57', '2016-09-12 10:33:57'),
(18, 32, 'Lolos PKM Hibah UNDIKSHA didanai tahun 2013', '2016-09-12 11:56:14', '2016-09-12 11:56:14'),
(19, 32, 'Lolos PKM Hibah UNDIKSHA didanai tahun 2014', '2016-09-12 11:56:14', '2016-09-12 11:56:14'),
(20, 32, 'Lolos PKM Hibah UNDIKSHA didanai tahun 2015', '2016-09-12 11:56:14', '2016-09-12 11:56:14'),
(21, 35, 'Golden Key International Honour Society Award', '2016-09-12 17:09:37', '2016-09-12 17:09:37'),
(22, 48, 'Runner up II Duta Genre putera UNDIKSHA 2013', '2016-09-15 15:21:58', '2016-09-15 15:21:58'),
(23, 48, 'COORDINATOR OF Social Charity social Gathering 2016', '2016-09-15 15:21:58', '2016-09-15 15:21:58'),
(24, 48, 'Pemateri dalam seminar OKK UNDIKSHA 2013', '2016-09-15 15:21:58', '2016-09-15 15:21:58'),
(25, 50, 'Finalist of Genre Ambasador which was held by PIK M Undiksha', '2016-09-15 15:54:51', '2016-09-15 15:54:51'),
(26, 52, 'Pramuka ', '2016-09-15 16:46:56', '2016-09-15 16:46:56'),
(27, 52, 'Pmr, mapala, juara debat bhasa inggris', '2016-09-15 16:46:56', '2016-09-15 16:46:56'),
(28, 54, 'Duta Bali dalam pertukaran Pemuda Indonesia-China 2013', '2016-09-15 16:51:11', '2016-09-15 16:51:11'),
(29, 54, 'Duta Indonesia dalam Shanghai Bhaosan Art Folk Festival tahun 2011', '2016-09-15 16:51:11', '2016-09-15 16:51:11'),
(30, 54, 'Duta Indonesia dalam Andong Mask Dance Festival, Korea 2008', '2016-09-15 16:51:11', '2016-09-15 16:51:11'),
(31, 54, 'Bagus Buleleng 2012', '2016-09-15 16:51:11', '2016-09-15 16:51:11'),
(32, 54, 'Duta Kesenian Universitas Pendidikan Ganesha ke La rochelle University (paris) dan Windesheim Univer', '2016-09-15 16:51:11', '2016-09-15 16:51:11'),
(33, 55, 'Saka bayangkara pramuka', '2016-09-15 16:52:58', '2016-09-15 16:52:58'),
(34, 55, 'PMR', '2016-09-15 16:52:58', '2016-09-15 16:52:58'),
(35, 55, 'Juara debat bahasa inggris antar jurusan', '2016-09-15 16:52:58', '2016-09-15 16:52:58'),
(36, 56, 'Mendapat dana hibah PKM-K tahun 2014', '2016-09-15 22:12:48', '2016-09-15 22:12:48'),
(37, 57, 'Berpengalaman mengajar di SMA/MA berkurikulum 2013', '2016-09-15 22:44:38', '2016-09-15 22:44:38'),
(38, 57, 'Berpengalaman mengajar ESP bagi siswa penjurusan pariwisata, keperawatan dan perkantoran', '2016-09-15 22:44:38', '2016-09-15 22:44:38'),
(39, 60, 'Juara 3 lomba OSN Kebumian tingkat SMA', '2016-09-15 23:45:28', '2016-09-15 23:45:28'),
(40, 61, 'Juara 1 kodya palawakya remaja ', '2016-09-15 23:52:46', '2016-09-15 23:52:46'),
(41, 61, 'Juara 1 kodya Lomba keterampilan siswa SMK ', '2016-09-15 23:52:46', '2016-09-15 23:52:46'),
(42, 63, 'NUEDC Debater 2012', '2016-09-16 00:07:16', '2016-09-16 00:07:16'),
(43, 65, 'Juara III Lomba Pidato Bahasa Jepang Tingkat Universitas Se-Bali', '2016-09-16 00:15:00', '2016-09-16 00:15:00'),
(44, 68, 'Runner up 1 king & queen EED 2013', '2016-09-16 00:20:34', '2016-09-16 00:20:34'),
(45, 68, 'Runner up 2 king & queen FBS 2013', '2016-09-16 00:20:34', '2016-09-16 00:20:34'),
(46, 71, 'Juara 1 OSN PTI Pertemina Bidang Kimia Regional Bali 2010', '2016-09-16 00:24:15', '2016-09-16 00:24:15'),
(47, 74, '2nd place in essay writing competition around Bali Province', '2016-09-16 00:40:02', '2016-09-16 00:40:02'),
(48, 74, '1st place in story telling competition around Badung and Tabanan Regency', '2016-09-16 00:40:02', '2016-09-16 00:40:02'),
(49, 74, '2nd place in story telling competition around Badung and Tabanan Regency', '2016-09-16 00:40:02', '2016-09-16 00:40:02'),
(50, 83, 'Instruktur nasional k 13', '2016-09-16 01:18:14', '2016-09-16 01:18:14'),
(51, 87, 'Juara 1 lomba puisi tingkat kabupaten badung 2014', '2016-09-16 01:49:21', '2016-09-16 01:49:21'),
(52, 87, 'Juara 3 lomba catur putri undiksha 2015', '2016-09-16 01:49:21', '2016-09-16 01:49:21'),
(53, 87, 'Mengajar private matematika', '2016-09-16 01:49:21', '2016-09-16 01:49:21'),
(54, 87, 'Juara harapan 1 lomba pidato', '2016-09-16 01:49:21', '2016-09-16 01:49:21'),
(55, 88, 'Juara 2 lomba menulis kanji tingkat dasar Bali Nihon Genki', '2016-09-16 01:55:11', '2016-09-16 01:55:11'),
(56, 88, 'Runner up 1 duta mahasiswa genre kabupaten buleleng', '2016-09-16 01:55:11', '2016-09-16 01:55:11'),
(57, 88, 'Juara 3 pemilihan mawapres undiksha', '2016-09-16 01:55:11', '2016-09-16 01:55:11'),
(58, 88, 'Juara 3 lomba mini news paper undiksha', '2016-09-16 01:55:11', '2016-09-16 01:55:11'),
(59, 98, 'Guru private ', '2016-09-16 02:32:24', '2016-09-16 02:32:24'),
(60, 104, 'Semi finalis english debating competition 2014', '2016-09-16 03:27:01', '2016-09-16 03:27:01'),
(61, 104, '10 besar finalis tunas muda pemimpin indonesia kategori SMA', '2016-09-16 03:27:01', '2016-09-16 03:27:01'),
(62, 104, 'Finalis essay brawijaya dalam rangka scientific great moment', '2016-09-16 03:27:01', '2016-09-16 03:27:01'),
(63, 107, '10 nominasi lomba essay sebali', '2016-09-16 03:39:45', '2016-09-16 03:39:45'),
(64, 108, 'Juara 1 LKTI Ilmiah ', '2016-09-16 03:44:35', '2016-09-16 03:44:35'),
(65, 108, 'Finalist English Debate', '2016-09-16 03:44:35', '2016-09-16 03:44:35'),
(66, 111, 'Olimpiade Nasional MIPA Jakarta bidang Kimia', '2016-09-16 04:08:03', '2016-09-16 04:08:03'),
(67, 112, '1st winner Young Entrepreneurship Jamboree APEC 2013', '2016-09-16 04:24:41', '2016-09-16 04:24:41'),
(68, 112, 'Certified Hypnotist', '2016-09-16 04:24:41', '2016-09-16 04:24:41'),
(69, 112, 'Aktif melakukan pengajaran, penelitian, dan pengabdian pada masyarakat', '2016-09-16 04:24:41', '2016-09-16 04:24:41'),
(70, 113, 'Mengikuti PIMNAS XXVII di Universitas Diponogoro', '2016-09-16 05:06:47', '2016-09-16 05:06:47'),
(71, 113, 'Juara 2 Liga MIPA (Sepak Bola antara Jurusan se-Fakultas MIPA Undiksha)', '2016-09-16 05:06:47', '2016-09-16 05:06:47'),
(72, 113, 'Juara 2 Futsal antar Jurusan se-Fakultas MIPA Undiksha', '2016-09-16 05:06:47', '2016-09-16 05:06:47'),
(73, 118, 'Juara 3 Lomba Debat Aktivis Mahasiswa se-Undiksha tahun 2013', '2016-09-16 05:59:43', '2016-09-16 05:59:43'),
(74, 118, 'Juara 3 Presentasi Kelompok dan Pembuatan Rencana Usulan Bisnis Kopma Citra Dana Undiksha', '2016-09-16 05:59:43', '2016-09-16 05:59:43'),
(75, 121, 'Lulus dengan predikat sangat memuaskan', '2016-09-16 06:45:00', '2016-09-16 06:45:00'),
(76, 122, 'Actor', '2016-09-16 07:11:46', '2016-09-16 07:11:46'),
(77, 122, 'Musician', '2016-09-16 07:11:46', '2016-09-16 07:11:46'),
(78, 123, 'Juara 3 Tari Pendet dalam rangka dies natalis undiksha', '2016-09-16 07:22:30', '2016-09-16 07:22:30'),
(79, 123, 'Juara 2 Olimpiade Kebumian tingkat kabupaten tahun 2011', '2016-09-16 07:22:30', '2016-09-16 07:22:30'),
(80, 127, 'Koordinator bidang 1 Penalaran dan Keilmuan ', '2016-09-16 07:48:43', '2016-09-16 07:48:43'),
(81, 127, 'Sie Olimpiade Pokja MIPA', '2016-09-16 07:48:43', '2016-09-16 07:48:43'),
(82, 129, 'Jurusan pendidikan biologi', '2016-09-16 08:20:49', '2016-09-16 08:20:49'),
(83, 131, 'Juara III Duta Genre Se-kabupaten Buleleng tahun 2015', '2016-09-16 08:55:03', '2016-09-16 08:55:03'),
(84, 132, 'Jegeg Buleleng 2016', '2016-09-16 08:59:03', '2016-09-16 08:59:03'),
(85, 132, 'Miss Campus Ambassador 2015', '2016-09-16 08:59:03', '2016-09-16 08:59:03'),
(86, 135, 'Guru privat matematika', '2016-09-16 10:03:58', '2016-09-16 10:03:58'),
(87, 136, 'Juara 1 Lomba Inovasi Makanan Tingkat SMA se-Kota Bogor dalam rangka Fiesta Fakultas Teknologi Perta', '2016-09-16 10:09:15', '2016-09-16 10:09:15'),
(88, 138, 'Asisten Dosen Mata Kuliah Mikrobiologi Undiksha Singaraja Tahun Akademik 2015/2016', '2016-09-16 10:16:13', '2016-09-16 10:16:13'),
(89, 141, 'Juara 2 kompetisi nasional jurnal ilmiah pariwisata  STP Trisakti tahun 2016, juara satu sayembara p', '2016-09-16 10:34:21', '2016-09-16 10:34:21'),
(90, 149, 'Juara lomba Debat Bahasa Indonesia dan Membaca Puisi', '2016-09-16 12:14:48', '2016-09-16 12:14:48'),
(91, 151, 'Nominator Anti Corruption Film.Festival Komisi Pemberantasan Korupsi (KPK) Tingkat Nasional 2014', '2016-09-16 12:25:43', '2016-09-16 12:25:43'),
(92, 152, 'Ketua STT 2 periode', '2016-09-16 12:34:50', '2016-09-16 12:34:50'),
(93, 158, 'Mengajar privat', '2016-09-16 14:42:09', '2016-09-16 14:42:09'),
(94, 158, 'Juara 1 lomba puisi', '2016-09-16 14:42:09', '2016-09-16 14:42:09'),
(95, 158, 'Juara 3 lomba catur putri undiksha', '2016-09-16 14:42:09', '2016-09-16 14:42:09'),
(96, 158, 'R.up 1 duta genre kab buleleng', '2016-09-16 14:42:09', '2016-09-16 14:42:09'),
(97, 158, 'Juara harapan 1 lomba pidato', '2016-09-16 14:42:09', '2016-09-16 14:42:09'),
(98, 161, 'Finalis lomba PKM Se-Undiksha', '2016-09-16 23:50:52', '2016-09-16 23:50:52'),
(99, 165, 'senior trainer intel', '2016-09-17 02:58:52', '2016-09-17 02:58:52'),
(100, 165, 'intel education visionary', '2016-09-17 02:58:52', '2016-09-17 02:58:52'),
(101, 167, 'Finalis English Olympiad Universitas Mahendradatta 2013', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(102, 167, 'Big 50 Zetizen Goes to New Zealand by Zetizen Jawa Pos', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(103, 167, 'Juara 1 King and Queen (Pemilihan Putra Putri Jurusan) Pendidikan Bahasa Inggris Universitas Pendidi', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(104, 167, 'Member of Exhibition team on Debate Competition Seminar by English Education Department of STKIP Aga', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(105, 167, 'Big 10 Pemilihan Putra Putri Undiksha 2014', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(106, 167, 'Pemateri Bahasa Inggris dalam kegiatan PELANGI Bali Edukasi', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(107, 167, 'Koordinator Sie Acara Pelatihan Program Mahasiswa Wirausaha HMJ Pendidikan Bahasa Inggris tahun 2015', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(108, 167, 'Koordinator Sie Publikasi dan Dokumentasi Kegiatan English Week HMJ Pendidikan Bahasa Inggris tahun ', '2016-09-17 03:25:03', '2016-09-17 03:25:03'),
(109, 168, 'Juara Umum di SMA 1 TP 45', '2016-09-17 03:56:53', '2016-09-17 03:56:53'),
(110, 172, 'Juara 1 kompetisi Musik se Fakultas MIPA', '2016-09-17 04:49:04', '2016-09-17 04:49:04'),
(111, 173, 'Juara 1 kompetisi musik se Fakultas MIPa', '2016-09-17 04:54:08', '2016-09-17 04:54:08'),
(112, 174, 'Juara 1 kejurnas nasional panjat tebing karagori lead perorangan thn 2011, juara 2 kejurnas nasional', '2016-09-17 06:40:34', '2016-09-17 06:40:34'),
(113, 177, 'JUARA 3 DEBAT AKTIVIS MAHASISWA', '2016-09-17 08:34:16', '2016-09-17 08:34:16'),
(114, 178, 'Penulis Soal Pemantapan UN Provinsi Bali Tingkat SMK Tahun Pelajaran 2014/2015', '2016-09-17 09:17:28', '2016-09-17 09:17:28'),
(115, 178, 'Penulis Soal Pemantapan Kota Denpasar Tingkat SMK Tahun Pelajaran 2014/2015 dan 2015/2016', '2016-09-17 09:17:28', '2016-09-17 09:17:28'),
(116, 180, 'Peserta Olimpiade Matematika', '2016-09-17 13:27:38', '2016-09-17 13:27:38'),
(117, 187, 'Juara 1 lomba fashion show katagori busana casual jeans,', '2016-09-18 03:51:49', '2016-09-18 03:51:49'),
(118, 187, 'Juara harapan 3 lomba fashion show katagori busana casual', '2016-09-18 03:51:49', '2016-09-18 03:51:49'),
(119, 189, 'Juara 1 lomba gugus tingkat kota denpasar dan tk provinsi th 2012', '2016-09-18 04:27:42', '2016-09-18 04:27:42'),
(120, 189, 'Juara 2 lomba modeling kepala paud se kecamatan denpasar timur', '2016-09-18 04:27:42', '2016-09-18 04:27:42'),
(121, 189, 'Juara 3 lomba lari estafet kepala paud se kecamatan denpasar timur', '2016-09-18 04:27:42', '2016-09-18 04:27:42'),
(122, 193, 'Peserta lomba olimpiade matematika', '2016-09-18 11:39:36', '2016-09-18 11:39:36'),
(123, 196, '2012 photography club adviser / teacher', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(124, 196, '2013 mentor the green team indonesia', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(125, 196, '25 oktober - 23 november 2012 berpartisipasi dalam pameran "spiritualism in Indonesia" di Universita', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(126, 196, 'Finalist Egypt International Photo Contest 2012', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(127, 196, 'Top 30 photo entries in SEARCA photo contest 2012 dengan tema "water is life: too much or too little', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(128, 196, 'Bali Advertiser "Siapa"', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(129, 196, 'Photo published in National Geographic Traveler Indonesia May 2013', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(130, 196, 'Finalis dari International Essay Contest for young people yang diselengarakan oleh The Goi Peace Fou', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(131, 196, '3dsense media school "career discovery journey workshop" held from 15-17 Agustus 2016, Singapore. ', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(132, 198, 'Pemenang PKM HIBAH Didanai Universitas Pendidikan Ganesha Tahun 2013', '2016-09-18 16:00:09', '2016-09-18 16:00:09'),
(133, 198, 'Pemenang PKM HIBAH Didanai Universitas Pendidikan Ganesha Tahun 2014', '2016-09-18 16:00:09', '2016-09-18 16:00:09'),
(134, 198, 'Pemenang PKM HIBAH Didanai Universitas Pendidikan Ganesha Tahun 2015', '2016-09-18 16:00:09', '2016-09-18 16:00:09'),
(135, 211, 'Juara 2 randori kempo tingkat prov.bali 2013', '2016-09-19 16:26:45', '2016-09-19 16:26:45'),
(136, 212, 'Koordinator sie stiker dan origamini', '2016-09-20 03:42:05', '2016-09-20 03:42:05'),
(137, 212, 'Koodinator sie konsumsi', '2016-09-20 03:42:05', '2016-09-20 03:42:05'),
(138, 214, 'IPK 3,18 ', '2016-09-20 10:52:04', '2016-09-20 10:52:04'),
(139, 214, 'Juara 1 Lomba Melukis Tingkat Kabupaten Buleleng', '2016-09-20 10:52:04', '2016-09-20 10:52:04'),
(140, 219, 'Juara I Umum', '2016-09-21 08:46:14', '2016-09-21 08:46:14'),
(141, 221, 'Juara 1 lomba story telling se kabupaten badung dan tabanan.', '2016-09-22 05:17:00', '2016-09-22 05:17:00'),
(142, 224, 'TOEFL 503', '2016-09-22 11:40:22', '2016-09-22 11:40:22'),
(143, 227, 'Juara 1 undiksha futsal turnamen', '2016-09-23 08:45:11', '2016-09-23 08:45:11'),
(144, 227, 'Juara 2 music akustik', '2016-09-23 08:45:11', '2016-09-23 08:45:11'),
(145, 227, 'Juara 2 rancangan proposal bisnis', '2016-09-23 08:45:11', '2016-09-23 08:45:11'),
(146, 227, 'Juara 1 futsal tingkat jurusan', '2016-09-23 08:45:11', '2016-09-23 08:45:11'),
(147, 227, 'Juara 2 futsal tingkat jurusan', '2016-09-23 08:45:11', '2016-09-23 08:45:11'),
(148, 229, 'Wakil IV Duta Bahasa Provinsi Bali 2016', '2016-09-24 01:07:06', '2016-09-24 01:07:06'),
(149, 235, 'Peserta 4th Global Work Camp di Jepang tahun 2016', '2016-09-24 11:01:40', '2016-09-24 11:01:40'),
(150, 238, 'Juara 3 lomba pidato', '2016-09-25 08:32:21', '2016-09-25 08:32:21'),
(151, 245, 'Juara 1 Mawirama Tingkat Remaja Putri dalam Porsenijar tahun 2010 dan 2011 Kabupaten Kl', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(152, 245, 'Juara 2 Pencak Silat Kategori Kelas F Putri dalam Porsenijar tahun 2011 Kabupaten Klungkung', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(153, 245, 'Perwakilan Provinsi Bali dalam Kapal Pemuda Nusantara 2015', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(154, 245, 'Peraih Medali Setara Emas Kategori Presentasi dan Perak Kategori Poster dalam PIMNAS ke-28 di Univer', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(155, 245, 'Juara 3 Penulisan Cerpen se-Bali dalam Festival Sastra Jurusan Pendidikan Bahasa dan Sastra Indonesi', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(156, 245, 'Duta Kabupaten Klungkung dalam Pesta Kesenian Bali tahun 2011 dan 2013', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(157, 245, 'Duta Kabupaten Buleleng dalam Pesta Kesenian Bali tahun 2014 dan 2016', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(158, 258, 'Bahasa Jepang ', '2016-10-17 00:22:26', '2016-10-17 00:22:26'),
(159, 258, 'JUDO ', '2016-10-17 00:22:26', '2016-10-17 00:22:26'),
(160, 258, 'Menari', '2016-10-17 00:22:26', '2016-10-17 00:22:26'),
(161, 266, 'Juara 1 Lomba Media Pembelajaran', '2016-11-13 02:28:50', '2016-11-13 02:28:50'),
(162, 267, 'IPK 3,18', '2016-11-16 03:20:59', '2016-11-16 03:20:59'),
(163, 269, 'Pemain Piano', '2016-11-16 05:13:48', '2016-11-16 05:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `tb_program`
--

CREATE TABLE IF NOT EXISTS `tb_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `biaya` varchar(100) NOT NULL,
  `biaya_tambahan` varchar(250) NOT NULL,
  `desk` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tb_program`
--

INSERT INTO `tb_program` (`id`, `nama`, `biaya`, `biaya_tambahan`, `desk`, `created_at`, `updated_at`) VALUES
(1, 'Edukezy Kids (PG / TK A & B)', '45000 / 1  Jam', '45000', 'Program Edukezy Khusus PG / TK. Program CALISTUNG (Baca Tulis Hitung), persiapan TK masuk SD, dengan bahan dan teknik yang menyenangkan, tepat dan mudah dipahami. Guru datang ke rumah siswa. Guru berstandar S1 berpengalaman dibidangnya. Durasi belajar 1 jam tiap pertemuan.', '2016-08-22 07:06:09', '2016-11-22 01:57:29'),
(2, 'Edukezy Privat SD', '60000 / 1,5 Jam', '30000', 'Program Edukezy Khusus SD (kelas 1 - 6). Siswa bebas memilih salah satu pelajaran yang ingin dipelajari. Mencakup pendalaman materi pelajaran, latihan soal, persiapan UTS, UAS & UN. Dengan bahan dan teknik yang menyenangkan, tepat dan mudah dipahami. Guru datang ke rumah siswa. Guru berstandar S1 berpengalaman dibidangnya. Durasi belajar 1,5 jam tiap pertemuan.', '2016-08-22 07:06:09', '2016-11-22 01:58:25'),
(4, 'Edukezy Privat SMP', '65000 / 1,5 Jam', '', 'Program Edukezy Khusus SMP (kelas 7 - 9). Siswa bebas memilih salah satu pelajaran yang ingin dipelajari. Mencakup pendalaman materi pelajaran, latihan soal, persiapan UTS, UAS & UN. Dengan bahan dan teknik yang menyenangkan, tepat dan mudah dipahami. Guru datang ke rumah siswa. Guru berstandar S1, berpengalaman dibidangnya. Durasi belajar 1,5 jam tiap pertemuan.', '2016-10-31 05:10:34', '2016-11-22 01:58:52'),
(5, 'Edukezy Privat SMA / SMK', '70000 / 1,5 Jam', '', 'Program Edukezy Khusus SMA / SMK (kelas 10 - 12). Semua jurusan. Siswa bebas memilih salah satu pelajaran yang ingin dipelajari. Mencakup pendalaman materi pelajaran, latihan soal, persiapan UTS, UAS & UN. Dengan bahan dan teknik yang menyenangkan, tepat dan mudah dipahami. Guru datang ke rumah siswa. Guru berstandar S1, berpengalaman dibidangnya. Durasi belajar 1,5 jam tiap pertemuan.', '2016-10-31 05:12:25', '2016-11-22 01:59:53'),
(6, 'Edukezy Privat Mahasiswa/Umum', '85000 / 1,5 Jam', '', 'Program Edukezy Khusus Mahasiwa / Umum. Semua jurusan sesuai kebutuhan. Siswa bebas memilih salah satu pelajaran yang ingin dipelajari. Mencakup pendalaman materi pelajaran, latihan soal, persiapan Ujian, dll. Guru datang ke rumah siswa. Guru berstandar S1, berpengalaman dibidangnya. Durasi belajar 1,5 jam tiap pertemuan.', '2016-10-31 05:13:48', '2016-11-22 02:00:23'),
(8, 'Edukezy Intensive English', '90000 / 1,5 Jam', '', 'Program Edukezy Bahasa Inggris untuk semua tingkat dan berbagai kebutuhan. Program yang kami tawarkan : Fun English for Children, English for Teenager, TOEFL & IELTS Preparation, English for Special Purpose, English for Tourism, English for Office Staff, & English untuk Kru Kapal Pesiar. Siswa bebas memilih salah satu program yang ingin dipelajari. Mencakup Reading, Listening, Writing, & Speaking. Dengan bahan dan teknik yang menyenangkan, tepat dan mudah dipahami. Guru datang ke rumah siswa. Gu', '2016-10-31 05:55:51', '2016-11-22 02:00:45'),
(9, 'Edukezy Talent (Musik, Vokal & Menggambar)', '100.000 / 1 jam', '', 'Program Edukezy untuk pengembangan bakat. Musik (gitar 7 keyboard), Vokal, dan Menggambar/Melukis. Siswa bebas memilih salah satu program yang ingin diikuti. Melatih bakat sekaligus potensi dan mental para siswa, pemahaman alat musik dan notasi, serta penyaluran para siswa ke event dan lomba publik. Dengan metode yang menyenangkan, tepat dan mudah dipahami. Guru datang ke rumah siswa. Guru berpengalaman dibidangnya. Durasi belajar 1 jam tiap pertemuan.', '2016-11-22 01:56:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_propinsi`
--

CREATE TABLE IF NOT EXISTS `tb_propinsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tb_propinsi`
--

INSERT INTO `tb_propinsi` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Bali', '2016-08-03 05:44:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rating`
--

CREATE TABLE IF NOT EXISTS `tb_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajar_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tb_rating`
--

INSERT INTO `tb_rating` (`id`, `pengajar_id`, `siswa_id`, `jadwal_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 3, 5, '2016-08-23 10:01:41', '2016-08-23 10:01:41'),
(2, 2, 1, 6, 3, '2016-08-25 07:03:39', '2016-08-25 07:03:39'),
(3, 2, 3, 4, 3, '2016-08-28 11:48:06', '2016-08-28 11:48:06'),
(4, 1, 22, 24, 0, '2016-11-24 07:07:45', '2016-11-24 07:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `tb_request`
--

CREATE TABLE IF NOT EXISTS `tb_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_jadwal_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `request_by` enum('SISWA','PENGAJAR') NOT NULL,
  `type` enum('RS','CC') NOT NULL,
  `keterangan` text NOT NULL,
  `tgl_pertemuan` date DEFAULT NULL,
  `jam_pertemuan` time DEFAULT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL COMMENT '0=>non aktif, 1=>proses, 2=>request baru',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_request`
--

INSERT INTO `tb_request` (`id`, `dt_jadwal_id`, `siswa_id`, `pengajar_id`, `request_id`, `request_by`, `type`, `keterangan`, `tgl_pertemuan`, `jam_pertemuan`, `tempat`, `status`, `created_at`, `updated_at`) VALUES
(1, 28, 1, 2, 2, 'PENGAJAR', 'RS', 'males', '2016-09-25', '19:47:00', 'jalan tukad citarum', '1', '2016-09-18 11:48:17', '2016-09-18 11:48:17'),
(2, 27, 1, 2, 2, 'PENGAJAR', 'CC', 'males', NULL, NULL, NULL, '1', '2016-09-18 11:51:25', '2016-09-18 11:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE IF NOT EXISTS `tb_siswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `zona_id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `alamat` text NOT NULL,
  `kodepos` int(5) DEFAULT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `siswa_cp` varchar(12) NOT NULL,
  `siswa_wali` varchar(100) NOT NULL,
  `siswa_pendidikan` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id`, `user_id`, `zona_id`, `fullname`, `photo`, `alamat`, `kodepos`, `tempat_lahir`, `tgl_lahir`, `longitude`, `latitude`, `siswa_cp`, `siswa_wali`, `siswa_pendidikan`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Hendra Wijaya', '19jah39iw3z.jpeg', 'Jalan nangka utara', NULL, 'Tabanan', '1994-08-06', NULL, NULL, '085737353569', 'Wayan aasd', 3, '2016-07-29 17:57:53', '2016-09-01 15:20:59'),
(2, 5, 2, 'I Made Hendra Wijaya', '2I7ughX17Nj.jpg', 'Jalan Wisnu No. 19', NULL, 'Tabanan', '1994-08-06', NULL, NULL, '087645367384', 'I Wayan Bedebah', 1, '2016-08-08 05:43:18', '2016-08-24 19:07:16'),
(4, 8, 1, 'Test register siswa', NULL, 'jalan sanur no.1', 80228, 'Denpasar', '1998-08-14', '115.2576078', '-8.6654523', '0854613279', 'Ketut Jelantik', 1, '2016-08-14 14:20:10', '2016-08-14 14:20:10'),
(5, 10, 1, 'I Made Adhy Suryanta Saputra', NULL, 'Jalan Pulau Misol no 66', 80235, 'Singaraja', '1985-09-02', '115.2030956', '-8.6766877', '081338288886', 'Made Putra', 1, '2016-08-16 04:54:25', '2016-09-11 07:44:42'),
(6, 20, 2, 'Ni nyoman kerti astiti, SP.d', NULL, 'karangasem', 80601, 'Pesangkan', '1992-07-08', '110.6693484', '-7.0518921', '087762644454', 'Ni nyoman suratni', 1, '2016-09-12 02:46:45', '2016-09-12 02:46:45'),
(7, 34, 1, 'Ni Luh Ayu Wahyuni', NULL, 'Jalan Pulau Indah Gg.1 No.1', 80119, 'Denpasar', '1993-05-22', '115.1989336', '-8.6810725', '085738764622', 'I Made Pariugi', 3, '2016-09-12 06:44:48', '2016-09-12 06:44:48'),
(8, 69, 1, 'Hendra Adi Sutika', NULL, 'Jalan Mekar 2 blok b III no. 20, pemogan', 80221, 'Jimbaran ', '1994-06-28', '115.2083405', '-8.7106658', '083114859321', 'I Nengah Jelantik', 5, '2016-09-15 17:42:53', '2016-09-15 17:42:53'),
(9, 125, 2, 'I Gede Bagus Wisnu Bayu Temaja', NULL, 'Banjar Denbantas, Desa Denbantas, Kecamatan Tabanan, Kabupaten Tabanan, Bali', 82115, 'Denbantas', '1994-02-13', '115.1385192', '-8.5163915', '087760231507', 'I Gede Putra', 4, '2016-09-16 04:04:01', '2016-09-16 04:04:01'),
(10, 209, 2, 'I Wayan Heriana', NULL, 'Desa Patas, Kec. Gerokgak Kab. Buleleng', 81155, 'Patas', '1984-11-21', '114.7973983', '-8.2239493', '087863219445', 'Wayan Nama', 4, '2016-09-18 12:21:59', '2016-09-18 12:21:59'),
(11, 227, 1, 'I Putu Juan Dirga Atmaja Suartama', NULL, 'Perum Graha Anyar Gang II Blok B.12 Jimbaran, Kuta Selatan - Bali', 80361, 'Jakarta', '1995-06-23', '115.1592718', '-8.7906945', '089651880510', 'I Nyoman Ardana', 1, '2016-09-19 14:25:49', '2016-09-19 14:25:49'),
(12, 275, 2, 'Nengah Dwi Prawira Putra', NULL, 'Perum Dalung Permai blok j3 no 24, br. blubuh sari, kerobokan kaja, kuta utara, badung', 80361, 'Mataram', '1989-04-02', '115.1740942', '-8.6402762', '085792611624', 'Putu Artana', 4, '2016-10-15 01:43:36', '2016-10-15 01:43:36'),
(13, 278, 1, 'Ni kadek erna yanti', NULL, 'gunaksa bangli', 80614, 'Denpasar', '2000-03-27', '115.354897', '-8.454303', '08563723793', 'I nyoman jaten', 1, '2016-10-17 01:04:19', '2016-10-17 01:04:19'),
(14, 279, 2, 'Owen purusa', NULL, 'Singapadu Sukawati', 80523, 'Tinungan', '1998-06-23', '115.2524268', '-8.556624', '08813133077', 'Ni Komang Sriati', 4, '2016-10-18 11:59:10', '2016-10-18 11:59:10'),
(15, 284, 1, 'Yayan', NULL, 'battbulan', 80256, 'Denpasar', '1994-08-21', '115.2526465', '-8.6129049', '083119316932', 'Pasek bima', 4, '2016-10-30 12:17:43', '2016-10-30 12:17:43'),
(16, 298, 2, 'Kadek Muliartini', NULL, 'Singaraja', 81113, 'Kalibukbuk', '1985-08-08', '115.0925624', '-8.1103177', '085779215750', 'Made  Suta', 5, '2016-11-19 16:09:59', '2016-11-19 16:09:59'),
(17, 299, 2, 'Kadek Muliartini', NULL, 'Singaraja', 81113, 'Kalibukbuk', '1985-08-08', '115.0925624', '-8.1103177', '085792157502', 'Made Suta', 5, '2016-11-19 16:16:55', '2016-11-19 16:16:55'),
(18, 301, 3, 'Ni ketut ayu ratmika', NULL, 'karangasem', 80861, 'Karangasrm', '1998-12-21', '115.5325797', '-8.4161499', '081237941411', 'Ni made wana', 2, '2016-11-21 01:53:10', '2016-11-21 01:53:10'),
(19, 303, 2, 'Gede Yudistira Purnama Putra', '19l62XsARzjT.jpg', 'Dalung Permai Blok J3/24', 80361, 'Denpasar', '1984-11-09', '115.1699367', '-8.6280216', '081393481487', 'Nengah Sutrisni', 5, '2016-11-21 11:17:43', '2016-11-24 06:41:57'),
(20, 305, 9, 'I gusti ayu putu ratnasari', NULL, 'jl sedap malam gang sruni no 10 denpasar,80237', NULL, 'Denpasar', '2008-03-23', '115.2438932', '-8.6518741', '085792518780', 'Dira', 3, '2016-11-24 03:35:12', '2016-11-24 06:41:27'),
(21, 306, 9, 'I Dewa Ayu Ratnawati', NULL, 'jl. trijata II Gg. B no 14,80232', NULL, 'Semaagung', '0000-00-00', '115.2252491', '-8.6435856', '087760116992', 'Dewa Nyoman Balik', 3, '2016-11-24 03:39:50', '2016-11-24 06:37:44'),
(22, 308, 3, 'Pande Kadek Ayu Sugianitri', '22JSLHYn8kOq.gif', 'sukawati', 80572, 'Gianyar ', '2005-10-22', '115.2538192', '-8.5929662', '085792216061', 'Putu putra', 3, '2016-11-24 04:01:04', '2016-11-24 06:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tarif`
--

CREATE TABLE IF NOT EXISTS `tb_tarif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipe` enum('T1','T2','T3') NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `currency` enum('IDR','USD') NOT NULL DEFAULT 'IDR',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tb_tarif`
--

INSERT INTO `tb_tarif` (`id`, `tipe`, `harga`, `keterangan`, `currency`, `created_at`, `updated_at`) VALUES
(1, 'T1', 130000, 'Paket SMA', 'IDR', '2016-08-16 04:39:38', NULL),
(3, 'T2', 0, '0', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:14:57'),
(4, 'T2', 0, '0.5', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:15:19'),
(5, 'T2', 0, '1', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:17:44'),
(6, 'T2', 0, '1.5', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:17:56'),
(7, 'T2', 0, '2', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:18:31'),
(8, 'T2', 0, '2.5', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:18:12'),
(9, 'T2', 5000, '3', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:17:33'),
(10, 'T2', 7000, '3.5', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:17:22'),
(11, 'T2', 10000, '4', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:16:43'),
(12, 'T2', 12000, '4.5', 'IDR', '2016-08-23 09:55:21', '2016-10-31 05:16:29'),
(13, 'T2', 15000, '5', 'IDR', '2016-08-23 09:56:56', '2016-10-31 05:16:07'),
(14, 'T1', 75000, 'Paket TK', 'IDR', '2016-11-15 00:59:07', NULL),
(15, 'T3', 1000, '1', 'IDR', '2016-11-19 11:46:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tingkat_pendidikan`
--

CREATE TABLE IF NOT EXISTS `tb_tingkat_pendidikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tb_tingkat_pendidikan`
--

INSERT INTO `tb_tingkat_pendidikan` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'SMA', '2016-08-03 05:23:07', NULL),
(2, 'SMP', '2016-08-03 05:23:11', NULL),
(3, 'SD', '2016-08-03 05:23:14', NULL),
(4, 'UMUM', '2016-08-03 05:23:19', NULL),
(5, 'SMK', '2016-08-03 05:23:39', NULL),
(6, 'TK/PG', '2016-11-25 03:33:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tingkat_pendidikan_calon_pengajar`
--

CREATE TABLE IF NOT EXISTS `tb_tingkat_pendidikan_calon_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajar_id` int(11) DEFAULT NULL,
  `tingkat_pendidikan` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tingkat_pendidikan_pengajar`
--

CREATE TABLE IF NOT EXISTS `tb_tingkat_pendidikan_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajar_id` int(11) DEFAULT NULL,
  `tingkat_pendidikan_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `tb_tingkat_pendidikan_pengajar`
--

INSERT INTO `tb_tingkat_pendidikan_pengajar` (`id`, `pengajar_id`, `tingkat_pendidikan_id`, `created_at`, `updated_at`) VALUES
(12, 2, 1, '2016-08-04 16:16:56', '2016-08-04 16:16:56'),
(11, 3, 5, '2016-08-04 16:16:12', '2016-08-04 16:16:12'),
(10, 3, 1, '2016-08-04 16:16:12', '2016-08-04 16:16:12'),
(24, 266, 3, '2016-11-19 21:14:21', '2016-11-19 21:14:21'),
(31, 1, 3, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(15, 5, 1, '2016-09-05 10:42:21', '2016-09-05 10:42:21'),
(16, 5, 2, '2016-09-05 10:42:21', '2016-09-05 10:42:21'),
(17, 5, 1, '2016-09-05 11:32:17', '2016-09-05 11:32:17'),
(18, 35, 1, '2016-09-12 17:52:47', '2016-09-12 17:52:47'),
(19, 35, 2, '2016-09-12 17:52:47', '2016-09-12 17:52:47'),
(20, 35, 3, '2016-09-12 17:52:47', '2016-09-12 17:52:47'),
(21, 35, 4, '2016-09-12 17:52:47', '2016-09-12 17:52:47'),
(22, 35, 5, '2016-09-12 17:52:47', '2016-09-12 17:52:47'),
(25, 272, 4, '2016-11-21 01:44:15', '2016-11-21 01:44:15'),
(26, 267, 1, '2016-11-22 02:57:22', '2016-11-22 02:57:22'),
(27, 274, 1, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(28, 274, 2, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(29, 274, 3, '2016-11-22 12:05:36', '2016-11-22 12:05:36'),
(32, 1, 4, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(33, 1, 5, '2016-11-24 06:15:10', '2016-11-24 06:15:10'),
(34, 273, 1, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(35, 273, 2, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(36, 273, 3, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(37, 273, 4, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(38, 273, 5, '2016-11-24 06:45:00', '2016-11-24 06:45:00'),
(39, 273, 1, '2016-11-24 06:45:20', '2016-11-24 06:45:20'),
(40, 273, 2, '2016-11-24 06:45:20', '2016-11-24 06:45:20'),
(41, 273, 3, '2016-11-24 06:45:20', '2016-11-24 06:45:20'),
(42, 273, 1, '2016-11-24 06:45:45', '2016-11-24 06:45:45'),
(43, 273, 2, '2016-11-24 06:45:45', '2016-11-24 06:45:45'),
(44, 273, 3, '2016-11-24 06:45:45', '2016-11-24 06:45:45'),
(45, 221, 1, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(46, 221, 2, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(47, 221, 3, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(48, 221, 5, '2016-11-26 22:41:07', '2016-11-26 22:41:07'),
(49, 221, 1, '2016-11-26 22:41:22', '2016-11-26 22:41:22'),
(50, 221, 2, '2016-11-26 22:41:22', '2016-11-26 22:41:22'),
(51, 221, 3, '2016-11-26 22:41:22', '2016-11-26 22:41:22'),
(52, 266, 3, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(53, 266, 6, '2016-11-27 10:37:35', '2016-11-27 10:37:35'),
(54, 266, 3, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(55, 266, 6, '2016-11-27 10:37:54', '2016-11-27 10:37:54'),
(56, 266, 3, '2016-11-27 10:38:15', '2016-11-27 10:38:15'),
(57, 266, 6, '2016-11-27 10:38:15', '2016-11-27 10:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE IF NOT EXISTS `tb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1=>Aktif,0=>Pending, 3=>Calon Pengajar',
  `type` enum('AD','PG','SW') NOT NULL COMMENT 'AD=>admin, PG=>Pengajar, SW=>Siswa',
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=312 ;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `email`, `password`, `status`, `type`, `token`, `created_at`, `updated_at`) VALUES
(1, 'siswa@gmail.com', 'd76b4fe16e602bba95a7b43a838c37f1', 1, 'SW', NULL, '2016-07-29 17:08:37', NULL),
(2, 'pengajar@gmail.com', '39242600731811472e4c4e0b6055db8a', 1, 'PG', NULL, '2016-07-29 17:53:36', NULL),
(3, 'wijaya@gmail.com', '39242600731811472e4c4e0b6055db8a', 1, 'PG', NULL, '2016-08-03 09:05:57', '2016-08-03 09:06:15'),
(4, 'magic@gmail.com', 'cc93e9b403b8b0e1a7fc4a24b45a4301', 1, 'PG', NULL, '2016-08-04 15:49:38', '2016-08-04 15:50:15'),
(5, 'magic.computer69@gmail.com', '9d45423d83e5014653adc0f2a4a400f2', 1, 'SW', NULL, '2016-08-08 05:43:18', '2016-08-08 05:43:34'),
(6, 'imd@gmail.com', '9d45423d83e5014653adc0f2a4a400f2', 0, 'PG', NULL, '2016-08-13 16:50:59', '2016-08-13 16:51:53'),
(288, 'sulis.susilo@gmail.com', 'df9c1defbd34c791a5ed210173e005f3', 3, 'PG', '117d24c1695d4afcef50cfbd2f32e166', '2016-11-09 13:09:20', '2016-11-09 13:09:20'),
(8, 'sihfb@mail.com', 'bd2e9c3d705c8fe1d7afad3f80abbef2', 0, 'SW', 'e48ce8bef7ab30358236323a5162cbc2', '2016-08-14 14:20:10', '2016-08-14 14:20:10'),
(284, 'yayanartha21@gmail.com', 'ccbf0a5c0f14f09a68076c4804296a62', 1, 'SW', NULL, '2016-10-30 12:17:43', '2016-10-30 12:25:18'),
(10, 'kaknanda_ganda@yahoo.co.id', '4a69f72dff1cd37350eefed69e2e3f0c', 1, 'SW', NULL, '2016-08-16 04:54:25', '2016-08-16 04:55:17'),
(11, 'pengajarbaru@mail.com', '9d45423d83e5014653adc0f2a4a400f2', 2, 'PG', '5f3019c61d8026ca97c78a3727bb079d', '2016-08-30 10:35:33', '2016-08-30 10:35:33'),
(12, 'ppp@mail.com', '9d45423d83e5014653adc0f2a4a400f2', 2, 'PG', 'fe78479654cb43a82db26d2a1b35be13', '2016-08-30 10:43:21', '2016-08-30 10:43:21'),
(13, 'nyoman.swan@gmail.com', '529ca8050a00180790cf88b63468826a', 1, 'AD', NULL, '2016-09-07 15:55:35', '2016-11-15 01:14:55'),
(287, 'prawira02@gmail.com', '32fdd35eb696e0bfdb263fdd177757b6', 1, 'AD', NULL, '2016-11-02 03:05:06', NULL),
(15, 'intenagung344@yahoo.co.id', 'e384817f299a86fc122a6377c6a19dc4', 1, 'PG', 'fdf3ca9973f38d75b5947fc3474ec546', '2016-09-11 02:36:55', '2016-09-11 02:36:55'),
(16, 'elind.blake@gmail.com', '696ed7534349804cf5050ae88bc994ba', 0, 'PG', NULL, '2016-09-11 08:11:34', '2016-09-11 08:12:46'),
(17, 'erna_virgils@yahoo.com', '7fc48f9c38d3eefe924418d043336b31', 0, 'PG', NULL, '2016-09-12 02:22:40', '2016-09-12 02:23:29'),
(18, 'amania2103@gmail.com', 'e60dfc314da61820a266fb75a9fcbef4', 0, 'PG', NULL, '2016-09-12 02:29:03', '2016-09-12 02:29:35'),
(19, 'adnyani10@gmail.com', '58da1e079c35cef03eab769904197f9c', 0, 'PG', NULL, '2016-09-12 02:41:44', '2016-09-12 02:44:03'),
(20, 'kertiastiti@ymail.com', 'e6a65be3d9b151e204b766c185df1d58', 0, 'SW', '2a5ecc8599c1d2f35091eeafc39f997e', '2016-09-12 02:46:45', '2016-09-12 02:46:45'),
(21, 'adinugraha817@gmail.com', '94a83c6c3452029e731bb65a7129a8c6', 0, 'PG', NULL, '2016-09-12 02:47:07', '2016-09-12 02:47:41'),
(22, 'viin.vfvf17@yahoo.com', 'bff9af4622c5d06bf67540aaaa06e22a', 0, 'PG', NULL, '2016-09-12 02:51:27', '2016-09-12 02:58:46'),
(23, 'kadekanie94@gmail.com', '11d81947e54288293a2f14f2abf1933b', 0, 'PG', NULL, '2016-09-12 02:55:36', '2016-09-12 02:57:25'),
(24, 'krisnaistriari@yahoo.com', '1cd1dc6c9dd5736f7501ebcc8bfd495a', 1, 'PG', 'b57f8f3e38a83f167c999c6726f51c59', '2016-09-12 03:33:28', '2016-09-12 03:33:28'),
(25, 'candralestari2 @gmail.com', '0743e6b6bc47a5ede25403d0c2370571', 0, 'PG', NULL, '2016-09-12 03:41:50', '2016-09-12 03:57:42'),
(26, 'candralestari2@gmail.com', '8110b6115d670caa9c6d0adc5ab42411', 0, 'PG', NULL, '2016-09-12 03:45:36', '2016-09-12 03:59:36'),
(27, 'dewisetyathi@yahoo.com', '327d5c1808fa5ea01d89f9028d5a9c2d', 0, 'PG', NULL, '2016-09-12 03:47:58', '2016-09-12 03:48:21'),
(28, 'maswulandari16@gmail.com', '1ac3596e9b65bb0904fe8eba2c0b6314', 0, 'PG', NULL, '2016-09-12 04:17:14', '2016-09-12 04:41:55'),
(29, 'gungnandaraditya26@gmail.com', '346f663f34e92d622d7fcb54e563eeba', 1, 'PG', 'e8e30a2052654378785bb0ed26e3a194', '2016-09-12 04:23:42', '2016-09-12 04:23:42'),
(30, 'kartika_wati10@yahoo.com', '24b5eb4649e3ec72c1195b10055e4bfb', 0, 'PG', NULL, '2016-09-12 04:28:31', '2016-09-12 04:31:19'),
(31, 'gasrihandayani@gmail.com', '4501383b932f44d6dfb68e88c43cbb53', 0, 'PG', NULL, '2016-09-12 04:36:10', '2016-09-12 04:37:26'),
(32, 'maswulandari@gmail.com', 'edea0fa021185cead99721e5ab0a30e3', 1, 'PG', 'b281e6b5e66393f279e45c8573c8df23', '2016-09-12 04:41:23', '2016-09-12 04:41:23'),
(33, 'niputuevisetiawati@gmail.com', '2776f35853a3d062ec2558f0c781099b', 0, 'PG', NULL, '2016-09-12 04:44:10', '2016-09-12 04:57:33'),
(34, 'ayuwahyuni220593@yahoo.com', '912e5736028576c4fd7626c0e2fcfdf5', 0, 'SW', '5af8450a27652ef0234eb09f5652ce06', '2016-09-12 06:44:48', '2016-09-12 06:44:48'),
(35, 'winaandriani5@gmail.com', 'c4e321bd0367094d353281f825248264', 0, 'PG', NULL, '2016-09-12 08:06:43', '2016-09-12 14:33:32'),
(299, 'kadekmuliartini@gmail.com', '95275e0ee8288c7a91a3a40762f86d21', 0, 'SW', 'dd54ca3bab260e9ee0968b262788303c', '2016-11-19 16:16:55', '2016-11-19 16:16:55'),
(37, 'testemail@rhyta.com', '9d45423d83e5014653adc0f2a4a400f2', 3, 'PG', '86ae29a8ae4a4178ccda425cea1fefb0', '2016-09-12 09:11:27', '2016-09-12 09:11:27'),
(51, 'kristinmeta@yahoo.com', '5d689e11f63458983fcbd59d269bfac1', 1, 'PG', '2031732bd76c02dffe846bca6917b351', '2016-09-13 07:33:22', '2016-09-13 07:33:22'),
(42, 'desymustikayani@gmail.com', '7b76a3e9de69ace3b9db5a93af020038', 0, 'PG', NULL, '2016-09-12 10:33:57', '2016-09-12 10:45:14'),
(43, 'nitadeviyanti93@gmail.com', 'f0492f009ceab72e056ecd59b3714efe', 0, 'PG', NULL, '2016-09-12 11:01:54', '2016-09-12 11:02:46'),
(44, 'widiastika25@gmail.com', '16295e72133865b5b700c1dcf5245ee2', 0, 'PG', NULL, '2016-09-12 11:56:14', '2016-09-12 11:58:00'),
(45, 'gadisbalisrihandayani@yahoo.co.id', '3b5412aafb564865c007097e7d25d1e2', 0, 'PG', NULL, '2016-09-12 13:37:08', '2016-09-13 07:05:40'),
(46, 'ikaichi.edogawa2@gmail.com', '8fe4ed52109dd24f8d8d97894310bcb7', 0, 'PG', NULL, '2016-09-12 16:53:38', '2016-09-12 22:30:02'),
(47, 'herysantosa@gmail.com', '96ded4704d75de88bedf1498246dae65', 1, 'PG', NULL, '2016-09-12 17:09:37', '2016-09-12 17:10:06'),
(48, 'zulfikaaini@gmail.com', 'fd0fa272b12eb29dd77f946e58c84671', 1, 'PG', 'e8cc5611aa2a65be0dd8c88bd4efd938', '2016-09-12 22:26:34', '2016-09-12 22:26:34'),
(49, 'ikaichi_edogawa@ymail.com', '7ad177295986b0307e45e7bd7a18e33c', 1, 'PG', '7743ba681cdee3dbbe7d0d142757a269', '2016-09-12 23:09:57', '2016-09-12 23:09:57'),
(50, 'gedeumbara14@gmail.com', 'b1d015f5a47ed16e88108ea2226c972f', 1, 'PG', 'f24e7c588fd64fef0c945321858aeebe', '2016-09-13 00:57:55', '2016-09-13 00:57:55'),
(52, 'kristinmeta@gmail.com', '5d689e11f63458983fcbd59d269bfac1', 1, 'PG', '0824421054a3bbf0a48750b3b8fbd6a8', '2016-09-13 07:38:26', '2016-09-13 07:38:26'),
(53, 'ayuwahyuni220593@gmail.com', '856c4808e2130ad45deb1d3ef52711fe', 0, 'PG', NULL, '2016-09-13 10:29:50', '2016-09-13 10:37:00'),
(54, 'sagungkrisnadarmawati@gmail.com', '956b1b5a59008d0289b876cfa7fd60b6', 0, 'PG', NULL, '2016-09-13 11:01:31', '2016-09-13 11:04:07'),
(55, 'yunitaayyu@yahoo.co.id', '2eaec1767e1d25b2e7c07846e5fb9cd3', 1, 'PG', '6f3cd8d330b22a32a8bbb3ac31da8e73', '2016-09-13 14:02:00', '2016-09-13 14:02:00'),
(56, 'uci_geg@yahoo.com', '862f2dc862e95efab10910f3729088d4', 1, 'PG', 'ccd45eae5352e3f1dba252a2c8bf7bba', '2016-09-13 23:42:11', '2016-09-13 23:42:11'),
(57, 'virgiantitiara@gmail.com', 'b34fb49bf4bdb9af065f65aab9e407e4', 1, 'PG', '15f5941e472cb13cb20c6eb30c25e35b', '2016-09-14 01:20:34', '2016-09-14 01:20:34'),
(58, 'widiartini014@gmail.com', '9a6667dbda0e8bffbde4f83ad8a64627', 0, 'PG', NULL, '2016-09-14 07:15:28', '2016-09-15 06:13:35'),
(59, 'idaarsani@yahoo.co.id', '6015dca7d17a905576cb3b3c9f1bb07a', 0, 'PG', NULL, '2016-09-14 14:15:05', '2016-09-14 15:32:33'),
(283, 'gandaedukasi@yahoo.com', 'd27a82790d7cb3ca0c0aa1f7a990e51f', 1, 'AD', NULL, '2016-10-30 11:30:11', NULL),
(61, 'adikerta@gmai.com', '4ea5e5c058f9c7069fe937737267240a', 1, 'PG', '0bc14dfbcb92f0bf4fdce2a8ec5df50a', '2016-09-15 15:21:58', '2016-09-15 15:21:58'),
(62, 'astrasuryawan221@gmail.com', '2014d83065d2c732427bde3b92395cc2', 0, 'PG', NULL, '2016-09-15 15:40:24', '2016-09-15 15:40:56'),
(63, 'devi.hapsy@gmail.com', '529c8d4823a19e07a408c47c08280984', 0, 'PG', NULL, '2016-09-15 15:54:51', '2016-09-15 16:16:21'),
(64, 'hekaarcana@yahoo.co.co.id', 'ffa113bdc2a91aea91de0eac23cad76f', 1, 'PG', '578e5dd8f7fe7b9c8bba10986da6bc8a', '2016-09-15 16:15:17', '2016-09-15 16:15:17'),
(65, 'suda1374@gmail.com', '2085d8c35c01de73b6f8270e163b1089', 0, 'PG', NULL, '2016-09-15 16:46:56', '2016-09-15 16:54:12'),
(66, 'hendranathawijaya92@yahoo.com', '4c8715a6f7e22d8e0038667dd6039755', 1, 'PG', '5ffd53c97be65bfaea96d4689628e8f9', '2016-09-15 16:50:49', '2016-09-15 16:50:49'),
(67, 'gungriskikendang@yahoo.co.id', '537a1d44000b01f406756ec0f04735f4', 0, 'PG', NULL, '2016-09-15 16:51:11', '2016-09-15 17:07:25'),
(68, 'gedepraptono@gmail.com', 'efcaf7d44fa25d26a3b03378a3dfefe3', 1, 'PG', '4e898d72fa260f606471d65e49d2a06b', '2016-09-15 16:52:58', '2016-09-15 16:52:58'),
(69, 'hendraadisutika@gmail.com', 'e5e6d01f5159ecced635ed307344471a', 1, 'SW', NULL, '2016-09-15 17:42:53', '2016-09-15 17:43:32'),
(70, 'darmaputra.putu@rocketmail.com', '6921a5e9135be157b179a288984cacf3', 0, 'PG', NULL, '2016-09-15 22:12:48', '2016-09-15 22:37:37'),
(71, 'griwanastabhisma@gmail.com', '21a115ab4f5a228e5c099fd6c4410de3', 0, 'PG', NULL, '2016-09-15 22:44:38', '2016-09-15 22:52:49'),
(72, 'igustiputuhendranathawijaya@yahoo.com', '43331a9efdd466572c4ef1a6b635ff2b', 1, 'PG', '7208e3e5744cdec768d2b368bf112061', '2016-09-15 22:49:50', '2016-09-15 22:49:50'),
(73, 'wisnawa_oficial@yahoo.co.id', '415d2c5d502e810170d48c790feb4d71', 0, 'PG', NULL, '2016-09-15 23:35:45', '2016-09-15 23:37:05'),
(74, 'ayukartikadewi2@gmail.com', '573d826b4c97545ef796518853a0931e', 3, 'PG', '62a62f2a905f9d96a464f0aa6a533b91', '2016-09-15 23:45:28', '2016-09-15 23:45:28'),
(75, 'tasuas8@gmail.com', '4c83ec127344c7c3d52a83c5be91ab11', 3, 'PG', '4aafb8164d11f30f710b681b07d4a270', '2016-09-15 23:52:46', '2016-09-15 23:52:46'),
(76, 'dekoni2015@gmail.com', 'dda680c6da5c01f82ea09c44b9093da9', 0, 'PG', NULL, '2016-09-16 00:04:46', '2016-09-16 00:05:16'),
(77, 'putusuardika72@gmail.com', '5259c05150523e06dbcbc6086ac68ab7', 0, 'PG', NULL, '2016-09-16 00:07:16', '2016-09-16 00:07:43'),
(78, 'husniatiputricahyani1995@gmail.com', 'ba2bea3bfc5d042de136545e33a9b9db', 0, 'PG', NULL, '2016-09-16 00:09:36', '2016-09-16 00:18:07'),
(79, 'nobutamizutari@gmail.com', 'c2ed41923b879f44d46600fd50cb2e1f', 0, 'PG', NULL, '2016-09-16 00:15:00', '2016-09-16 00:16:41'),
(80, 'debianiid@gmail. com', '4ac9bf73a66b104f489908b313a2cc91', 3, 'PG', '327cd62a1e39366de07ff17d69fa7479', '2016-09-16 00:15:50', '2016-09-16 00:15:50'),
(81, 'agusjayapharhyuna@gmail.com', '64e75efc3ed20c18018d4e1b993f74f2', 0, 'PG', NULL, '2016-09-16 00:17:35', '2016-09-16 00:22:53'),
(82, 'shasybagus06@gmail.com', 'e51fe491369a671bad5f69c00d5a61c6', 0, 'PG', NULL, '2016-09-16 00:20:34', '2016-09-16 00:35:54'),
(83, 'nurlitahabibah@gmail.com', '2f46e69cf0173576ef4da575e75c0aa9', 0, 'PG', NULL, '2016-09-16 00:21:10', '2016-09-16 00:23:45'),
(84, 'husniatiputricahyani270195@gmail.com', 'ba2bea3bfc5d042de136545e33a9b9db', 0, 'PG', NULL, '2016-09-16 00:23:55', '2016-09-16 00:24:13'),
(85, 'putuseptiantrueno@gmail.com', 'eb66120ec911dedde609bdb6fea31831', 3, 'PG', 'bc757472f9fea65bd181249221bcab68', '2016-09-16 00:24:15', '2016-09-16 00:24:15'),
(86, 'widarishere@gmail.com', '7cd31dee69ff8f2a9464468d65667201', 0, 'PG', NULL, '2016-09-16 00:25:48', '2016-09-16 01:01:50'),
(87, 'helkatara@yahoo.co.id', '2ae9468ec21ab14ac439b4de19efb2b3', 3, 'PG', '87117dda287c6166d0efe958d67658f1', '2016-09-16 00:39:55', '2016-09-16 00:39:55'),
(88, 'effajawas.ej@gmail.com', '1cfbe9418107ac2e3f78e06b0930c83b', 0, 'PG', NULL, '2016-09-16 00:40:02', '2016-09-16 00:41:36'),
(89, 'pande.pradnyana@gmail.com', '467c62060fc99d76a13779413867357d', 0, 'PG', NULL, '2016-09-16 00:40:21', '2016-09-16 00:41:01'),
(90, 'mirasuantaricute@gmail.com', '7aa69c5c94c7ec8bb7c5eee6d02be208', 0, 'PG', NULL, '2016-09-16 00:46:02', '2016-09-16 00:49:08'),
(91, 'komang787@gmail.com', '07470ab479026e878472bf4dd05b7cb2', 0, 'PG', NULL, '2016-09-16 00:50:44', '2016-09-16 00:51:22'),
(92, 'gedeaankarisma@gmail.com', '7f26abfe5b5f7ecac79901fbeca1cccd', 0, 'PG', NULL, '2016-09-16 00:52:01', '2016-09-16 00:56:36'),
(93, 'gitadewahuti@yahoo.co.id', '7a8d8970f3fd464b84a84c8a8d065be9', 3, 'PG', '11b9dc6eb42cb46baf96c9d63efc888d', '2016-09-16 00:54:00', '2016-09-16 00:54:00'),
(94, 'akucintakeju@yahoo.com', 'aa33fb3f4b9efaa4e460c502b6505e87', 0, 'PG', NULL, '2016-09-16 00:56:48', '2016-09-16 01:02:31'),
(95, 'omink.choepid@yahoo.com', 'a91062deacb10af35b539ccdc9c8a753', 3, 'PG', '953f2697add6e876a508fd2fd55a6468', '2016-09-16 01:02:43', '2016-09-16 01:02:43'),
(96, 'widyaanjas7653@gmail.com', '528fcc4858d5223f767adfbe9c40d3d4', 0, 'PG', NULL, '2016-09-16 01:10:34', '2016-09-16 01:12:57'),
(97, 'komangwirasuta@yahoo.com', '8370971e1c18247c551c7dfa6261171a', 3, 'PG', '03892dcbc26edf5e60c7afa98716f26a', '2016-09-16 01:18:14', '2016-09-16 01:18:14'),
(98, 'aripurnaya371@yahoo.com', '827ccb0eea8a706c4c34a16891f84e7b', 3, 'PG', '78d01b042cb191661dc5af33b770336b', '2016-09-16 01:21:42', '2016-09-16 01:21:42'),
(99, 'gekdewigusti@yahoo.com', 'f3cc23a16f2a61519081310ac14a1b17', 0, 'PG', NULL, '2016-09-16 01:31:16', '2016-09-16 01:36:56'),
(100, 'dentisnaky@gmail.com', '593257c7dee8ed9b14f1f538da176a35', 0, 'PG', NULL, '2016-09-16 01:31:19', '2016-09-16 01:32:32'),
(101, 'riaasteria.meisa@gmail.com', 'c6866fb164b9577604c06655b10310df', 3, 'PG', '461e41b0c747a306812f88d107e02118', '2016-09-16 01:49:21', '2016-09-16 01:49:21'),
(102, 'kavhagenki@gmail.com', '9bb1bcaa5fbc14ec79b82f5355a4f6a2', 0, 'PG', NULL, '2016-09-16 01:55:11', '2016-09-16 01:57:10'),
(103, 'gungayuagustini@yahoo.co.id', '49a968998a8d372babeb7f6317bf792b', 0, 'PG', NULL, '2016-09-16 01:55:32', '2016-09-16 03:48:32'),
(104, 'chandragunaaaa@gmail.com', '83d29250722e543bfa481bbac30ee8a1', 0, 'PG', NULL, '2016-09-16 01:57:47', '2016-09-16 01:58:50'),
(105, 'dwiyanti152@yahoo.co.id', 'bfc2345a913a8a6f5c97c9e58d3967d7', 0, 'PG', NULL, '2016-09-16 02:00:30', '2016-09-16 02:23:08'),
(106, 'niagalla@yahoo.com', '3ff6bcda189984e616e408dcc330ee21', 3, 'PG', 'b227bb90b32cd302351263d2287167ed', '2016-09-16 02:10:06', '2016-09-16 02:10:06'),
(107, 'pus21pitha@gmail.com', 'da34149b9d7a4cff1849e0811f1a101a', 0, 'PG', NULL, '2016-09-16 02:10:29', '2016-09-16 02:11:51'),
(108, 'diahciprik@gmail.com', '09aa9049b106ddd2ac5b2f3823ca8c42', 0, 'PG', NULL, '2016-09-16 02:14:46', '2016-09-16 02:15:31'),
(109, 'hendraraharja198@gmail.com', '62c9f75bed71b37d0a7fe31f803b819e', 0, 'PG', NULL, '2016-09-16 02:26:05', '2016-09-16 02:26:44'),
(110, 'adinariyana@gmail.com', '22880128d34e2ba132d54093577b3e94', 0, 'PG', NULL, '2016-09-16 02:29:45', '2016-09-16 02:30:29'),
(111, 'wirafr@gmail.com', 'cf1c78afead7c8275b6e902cc4bbded0', 0, 'PG', NULL, '2016-09-16 02:31:56', '2016-09-16 02:34:04'),
(112, 'leonyyuliadewi@yahoo.com', 'd7fb5ea89cea2fc562dd675fa69157fb', 3, 'PG', '75b6341ace56240392a2692cd2d2ffe8', '2016-09-16 02:32:24', '2016-09-16 02:32:24'),
(113, 'SUARTI_22@yahoo.co.id', '36483c02008c7be0d44914fff6ba2b71', 3, 'PG', '3a5ae6d8c55e5febc3d41781b2237e65', '2016-09-16 03:04:28', '2016-09-16 03:04:28'),
(114, 'luh_diah@hotmail.com', 'c347b338e38ad612aac591bbacf64950', 3, 'PG', '79ec968901f24eac847613a4c7550bd7', '2016-09-16 03:07:32', '2016-09-16 03:07:32'),
(115, 'aartasthana@gmail.com', '6514fe6958b12b14a1a998a668ff9466', 0, 'PG', NULL, '2016-09-16 03:13:52', '2016-09-16 03:15:32'),
(116, 'ninnawibowo@gmail.com', '37d73cf43617f538956344bcc1cb532e', 3, 'PG', 'd0b181c54e8047a2bea3d85a48d63eb4', '2016-09-16 03:14:58', '2016-09-16 03:14:58'),
(117, 'gekagung88@gmail.com', 'ce06317397316eb932f58dd9c902a81e', 0, 'PG', NULL, '2016-09-16 03:15:02', '2016-09-16 03:16:25'),
(118, 'lawrencesabenning@gmail.com', 'bd55fb6bc5bf93783a224d7404945ecd', 0, 'PG', NULL, '2016-09-16 03:27:01', '2016-09-16 03:29:39'),
(119, 'Sriutamy43@gamil.com', '6eba0008154787c8b00e2c7a9d238862', 3, 'PG', 'da14f8a5f4d279067a700f84335f6224', '2016-09-16 03:28:17', '2016-09-16 03:28:17'),
(120, 'aguspadmaputra@yahoo.com', 'eed7bb6f6de83bfa85ba5142be9ee933', 0, 'PG', NULL, '2016-09-16 03:32:41', '2016-09-16 03:34:36'),
(121, 'adiputrarika36@gmail.com', '503cf1d52bc1bc6ac92fe03392a9eccf', 3, 'PG', '1a8c66e38450a3dcf2789653d1951b98', '2016-09-16 03:39:45', '2016-09-16 03:39:45'),
(122, 'ermarosalina21a@gmail.com', '39867e2d88fb555d8633167d9f396ff7', 0, 'PG', NULL, '2016-09-16 03:44:35', '2016-09-16 03:46:56'),
(123, 'widiarta22@gmail.com', '248bc3dd13e338f6df22b9c6e4ef89be', 0, 'PG', NULL, '2016-09-16 03:50:00', '2016-09-16 03:52:45'),
(124, 'jelitasari78@gmail.com', '77b0893cff24b682ad4607dd87dcbe87', 0, 'PG', NULL, '2016-09-16 03:59:41', '2016-09-17 23:28:19'),
(125, 'wisnubt@gmail.com', 'a59ab967ffe4ec4524e16e6b20245b34', 1, 'SW', NULL, '2016-09-16 04:04:01', '2016-09-16 04:09:01'),
(126, 'wsudarma2@gmail.com', 'c80ac7ff2be2b3662c8f56618ee73c85', 0, 'PG', NULL, '2016-09-16 04:08:03', '2016-09-16 04:09:25'),
(127, 'sriwidhiasih@gmail.com', '3104698bfd17a1dbf6e57064ffbe3167', 0, 'PG', NULL, '2016-09-16 04:24:41', '2016-09-16 04:27:42'),
(128, 'adi.mahendra1994@gmail.com', '011067b0a15fd99d52eb51458b709741', 0, 'PG', NULL, '2016-09-16 05:06:47', '2016-09-16 05:07:16'),
(129, 'j.saudila@yahoo.co.id', 'ca044327224c012d12688b0c69ee77c0', 3, 'PG', '9a012072e669892e385906e0036d4efa', '2016-09-16 05:13:33', '2016-09-16 05:13:33'),
(130, 'deniapriani8@gmail.com', '78aae58cc39c3aea2fbbeec9c8b2fdd7', 0, 'PG', NULL, '2016-09-16 05:29:26', '2016-09-16 05:35:30'),
(131, 'budijuli10@gmail.com', '2d16eddd29415119babe429b20b7777f', 3, 'PG', '927104466bc5cdf0cab158ec8489ac6e', '2016-09-16 05:39:57', '2016-09-16 05:39:57'),
(132, 'polakcool33@gmail.com', 'c63814b9356d7ccf5e5c760b50e25678', 0, 'PG', NULL, '2016-09-16 05:51:28', '2016-09-16 05:52:03'),
(133, 'day_arini@yahoo..com', '81d236c18597077eb6f56ea86dbb287d', 3, 'PG', 'dd312e39426544fd30bdd3c921ff0b06', '2016-09-16 05:59:43', '2016-09-16 05:59:43'),
(134, 'endraagustini@gmail.com', 'c4982bb0cc7d3a301ba4964de56ed75f', 0, 'PG', NULL, '2016-09-16 06:18:40', '2016-09-16 06:25:33'),
(135, 'hendraadisutika28@yahoo.co.id', '5238515d0135c69dd837eb99cbf8c32b', 3, 'PG', '2002622b72f2a6b8709442fbc0e8f6ea', '2016-09-16 06:33:10', '2016-09-16 06:33:10'),
(136, 'maya.apsari@ymail.com', 'dd82c946bcc65cd8532ff73f82f85ef7', 3, 'PG', '018b9b60b89aef117d13f3d5d0b58275', '2016-09-16 06:45:00', '2016-09-16 06:45:00'),
(137, 'yogapermana@gmx.com', 'f65a7ca433deae518f8cbfd72b66327a', 0, 'PG', NULL, '2016-09-16 07:11:46', '2016-09-16 07:16:48'),
(138, 'nenyardani008@gmail.com', '47de5267c03937ef08994688b6389393', 3, 'PG', 'ff629cc7c73fff15039ab7c5d8a1882e', '2016-09-16 07:22:30', '2016-09-16 07:22:30'),
(139, 'rita.ayusutha@gmail.com', '351723e01d2730cc07adc9b2231de573', 0, 'PG', NULL, '2016-09-16 07:26:32', '2016-09-16 07:27:03'),
(140, 'sadu_wirawan@yahoo.co.id', '8bee7f448ff705563395c1514902b950', 0, 'PG', NULL, '2016-09-16 07:45:18', '2016-09-16 07:45:55'),
(141, 'pradnyanierma@gmail.com', '6d5be5d1f9ed60636d6297b88c0df219', 0, 'PG', NULL, '2016-09-16 07:48:15', '2016-09-16 07:48:55'),
(142, 'santhiwidya@yahoo.co.id', '828d8a1eba9a2e7430dbcc5664b8405b', 3, 'PG', 'e71ba6dd7e24b1e0d57eb63500775601', '2016-09-16 07:48:43', '2016-09-16 07:48:43'),
(143, 'cempakaputih_bali@yahoo.com', 'e7bb95fec830309f25a35c71e6bec8b4', 3, 'PG', '6444e4b78bb3a366608daad8c8d9207e', '2016-09-16 07:51:26', '2016-09-16 07:51:26'),
(144, 'tiyadogent@rocketmai.com', '165de6102e6f2dbf4225bfff6b66d0ac', 3, 'PG', '5f3bd112bbce41d15ab86c2e5ac53ddf', '2016-09-16 08:20:49', '2016-09-16 08:20:49'),
(145, 'tc.thecreators@gmail.com', '484c2618e841bcd8b6d851ae6d1fe80a', 0, 'PG', NULL, '2016-09-16 08:22:44', '2016-09-16 08:25:24'),
(146, 'gitaputrijasmin@gmail.com', '797059631cdf9f517332419d402423e5', 0, 'PG', NULL, '2016-09-16 08:55:03', '2016-09-16 08:55:34'),
(147, 'febbydecker@gmail.com', '63c3c8372a2d28625d6f176ee399e877', 0, 'PG', NULL, '2016-09-16 08:59:03', '2016-09-16 09:00:31'),
(148, 'kadekwiwik8695@gmail.com', 'e083d31c679747f07d8e3bd1ccfe252c', 0, 'PG', NULL, '2016-09-16 09:11:05', '2016-09-16 09:16:06'),
(149, 'balitulen11@gmail@com', '2e992989a1857644c58ab3e87a00f4ee', 3, 'PG', 'a3299d6dadef8a509c2c383b92658410', '2016-09-16 09:34:04', '2016-09-16 09:34:04'),
(150, 'iluhwanda@gmail.com', 'b1b01804068bec45adcd4730a01beafd', 0, 'PG', NULL, '2016-09-16 10:03:58', '2016-09-16 10:04:46'),
(151, 'josuakribo@yahoo.co.id', 'ebd5365d69ceb6611074de82c4e48f3f', 0, 'PG', NULL, '2016-09-16 10:09:15', '2016-09-16 10:10:22'),
(152, 'meira.aja@gmail.com', 'c0a94077e5b8d8b85d751effbd163a55', 0, 'PG', NULL, '2016-09-16 10:13:43', '2016-09-16 10:14:11'),
(153, 'gitalodjalan@gmail.com', '3c7400aa138207d79748acb75d783749', 3, 'PG', '6ce4f40a54e9a137aa1154abc490609d', '2016-09-16 10:16:13', '2016-09-16 10:16:13'),
(154, 'k0c13t@gmail.com', '68f1638231f6c80ff3326500ec17243e', 0, 'PG', NULL, '2016-09-16 10:19:50', '2016-09-16 10:22:23'),
(155, 'indahdewantii@gmail.com', '89097340183fc6d504e58de65a56742b', 0, 'PG', NULL, '2016-09-16 10:33:52', '2016-09-16 10:53:15'),
(156, 'sanjiwanigandhi@gmail.com', '965abb61f5a8e06be6c2b4241654a766', 0, 'PG', NULL, '2016-09-16 10:34:21', '2016-09-16 10:35:02'),
(157, 'putrinadi@gmail.com', 'e4c3aa3b566a513e1ed5a603235797c5', 0, 'PG', NULL, '2016-09-16 10:47:11', '2016-09-16 10:47:45'),
(158, 'wandariskaadi@gmail.com', '8a90b8bd6b65095710f9b558dc76b3c1', 0, 'PG', NULL, '2016-09-16 10:55:03', '2016-09-16 10:56:01'),
(159, 'artiladewi@gmail.com', 'e401ab4cffaf6530dd22964052be0d0e', 3, 'PG', 'edf5061ed2dd5a3e7c73d2ad956db63a', '2016-09-16 11:06:32', '2016-09-16 11:06:32'),
(160, 'putuyunita18@gmail.com', '6780d868bf28d95070697174a680a858', 0, 'PG', NULL, '2016-09-16 11:11:20', '2016-09-16 11:20:39'),
(161, 'niluhputunopriani@gmail.com', '2b5e7fea0afdbb6d0db195915d92b43d', 0, 'PG', NULL, '2016-09-16 11:19:10', '2016-09-16 11:23:34'),
(162, 'dwilavita1412@gmail.com', '9d153abf494878bce9f9cd7a7e296a51', 3, 'PG', '836321d43349256c152367d22642fc80', '2016-09-16 12:03:51', '2016-09-16 12:03:51'),
(163, 'ayumirah.agung@gmail.com', 'b528861dd5c19e2cd0eefb047f241d4f', 0, 'PG', NULL, '2016-09-16 12:12:47', '2016-09-16 12:13:41'),
(164, 'widyasidi@ymail.com', '4899f163abd6a07f416921f4cae4fa09', 3, 'PG', '340cb95276d41f8eaea93b833de80ede', '2016-09-16 12:14:48', '2016-09-16 12:14:48'),
(165, 'tegarkriswinardi@gmail.com', '199fc395a76d4eb69a31528c8f89d87e', 0, 'PG', NULL, '2016-09-16 12:25:09', '2016-09-16 12:47:01'),
(166, 'bayumogana1@gmail.com', '7caac4e9c9780857edb934106edba79e', 0, 'PG', NULL, '2016-09-16 12:25:43', '2016-09-16 12:29:36'),
(167, 'ichatheru@yahoo.com', '5443bfcefefa4cfce8f2a33845dbba7a', 3, 'PG', 'de83560fea440ba1d3b35e5c8ac065af', '2016-09-16 12:34:50', '2016-09-16 12:34:50'),
(168, 'sangarsana@gmail.com', 'b23d0acaf372a22efedbd4df4c1b9558', 0, 'PG', NULL, '2016-09-16 12:36:28', '2016-09-16 12:37:01'),
(169, 'adepradnyani07@gmail.com', 'b1f3c1a67afb3383797c65792f81d61a', 0, 'PG', NULL, '2016-09-16 13:08:56', '2016-09-16 13:11:45'),
(170, 'wahyudi.ngurah@yahoo.com', '8d6af695732111686a6dcd5406dd3a9f', 0, 'PG', NULL, '2016-09-16 13:41:58', '2016-09-18 14:29:19'),
(171, 'cahyonugroho99@gmail.com', '79bad31c558348ef9a224a1cd208c2fc', 3, 'PG', '6711e7693213f2e12f025c357859bee5', '2016-09-16 14:05:51', '2016-09-16 14:05:51'),
(172, 'cahyonugroho91@gmail.com', '79bad31c558348ef9a224a1cd208c2fc', 3, 'PG', '76d8fc43f061a9e21a873f48da2a7a43', '2016-09-16 14:09:59', '2016-09-16 14:09:59'),
(173, 'meisa.dewi26.md@gmail.com', '5b90ee1f7fa46d2c282c5ccb6543af39', 0, 'PG', NULL, '2016-09-16 14:42:09', '2016-09-16 14:42:59'),
(174, 'arya.risaldi@gmail.com', '553b936882d3a3cac2ed0226daa1439e', 0, 'PG', NULL, '2016-09-16 16:03:56', '2016-09-16 16:12:35'),
(175, 'mr.samsidim@gmail.com', '041c9c7bf7e1030af3128776b5edee37', 3, 'PG', 'c198acb20f3b8d1179940bd0ab245379', '2016-09-16 16:43:06', '2016-09-16 16:43:06'),
(176, 'junieyk@yahoo.co.id', '6fc0b5f31dfb601ec9f3da9a58928c31', 3, 'PG', '1a9052f8e9dd0ec5dace4597c9db6ca9', '2016-09-16 23:50:52', '2016-09-16 23:50:52'),
(177, 'kristinmeta099@gmail.com', '5d689e11f63458983fcbd59d269bfac1', 3, 'PG', '216cc610d2449005ee1d4ff3a6c2884b', '2016-09-17 01:18:41', '2016-09-17 01:18:41'),
(178, 'iputuhendrasetiawan@gmail.com', 'ee5fcb188a6781d31a3d93e1e204d46c', 0, 'PG', NULL, '2016-09-17 01:54:05', '2016-09-17 01:54:45'),
(179, 'owenpurusaarta@gmail.com', '627a128a4c56db06410f2d13b298feed', 0, 'PG', NULL, '2016-09-17 02:32:16', '2016-09-17 02:40:15'),
(180, 'dekmel@gmail.com', 'e9744092ddd20490703d97aec162baed', 3, 'PG', 'e0b6270acc5b3dea56ed52470e913932', '2016-09-17 02:58:52', '2016-09-17 02:58:52'),
(181, 'diyannoorahmad@gmail.com', 'b6a3895b2c3bccaf3fa091c7fc36bcca', 3, 'PG', 'cdba80663ea5dd3856ca346eae9694cf', '2016-09-17 03:13:18', '2016-09-17 03:13:18'),
(182, 'adityaridho789@gmail.com', '248bc3dd13e338f6df22b9c6e4ef89be', 0, 'PG', NULL, '2016-09-17 03:25:03', '2016-09-17 03:26:13'),
(183, 'dewageknia@gmail.com', 'e920513289528d0c0dca79cc47cf6591', 3, 'PG', '6c2bead6c0797a0fc84c2df7d0bde60d', '2016-09-17 03:56:53', '2016-09-17 03:56:53'),
(184, 'dewaayunia@yahoo.co.id', '2e196dacad7ac48df6aed7db78833569', 3, 'PG', 'aa4d4c77f5440ff6d3ed657756c44da1', '2016-09-17 04:01:15', '2016-09-17 04:01:15'),
(185, 'swandithadharma11@gmail.com', '971129a441aad1ff04a3277d28f9fc16', 0, 'PG', NULL, '2016-09-17 04:07:52', '2016-09-17 04:08:28'),
(186, 'noviansyahdedy@gmail.co.id', '3da79360ed402c2f3738ad6a7f7bfc76', 3, 'PG', '3e4b8c566cadbd90c1c76e3808da4ba4', '2016-09-17 04:38:15', '2016-09-17 04:38:15'),
(187, 'Satriaperbawa.Irawan@yahoo.com', 'b42f9a198d76db66b4372e56723bff28', 3, 'PG', '8d0c3cf205c0539e1f0cb25286358edc', '2016-09-17 04:49:04', '2016-09-17 04:49:04'),
(188, 'Satriaperbawa.Irawan@gmail.com', 'b42f9a198d76db66b4372e56723bff28', 3, 'PG', 'ff75f5f3a6d5aba9c6d4a9b3523db0ef', '2016-09-17 04:54:08', '2016-09-17 04:54:08'),
(189, 'agustrayen@gmail.com', 'e4bd5e7c97e74a73b737aeac053d1b7c', 0, 'PG', NULL, '2016-09-17 06:40:34', '2016-09-17 06:45:55'),
(190, 'nathaliakusumasetyarini1@gmail.com', '06bb1ebb454e71a871d0a810f55628ae', 0, 'PG', NULL, '2016-09-17 07:15:09', '2016-09-17 11:08:26'),
(191, 'komangmeriyanti@gmail.com', 'c308a27e9836959e68716051c18e99cc', 0, 'PG', NULL, '2016-09-17 08:23:57', '2016-09-17 08:24:36'),
(192, 'hendraketut21@yahoo.co.id', 'ca73d71227f59a8f7886fbc83eed4882', 3, 'PG', '8f9f313c4aad0de1b256853966a75b12', '2016-09-17 08:34:16', '2016-09-17 08:34:16'),
(193, 'astinamangadi@gmail.com', '98c0dd58ea3e07eecbfd60b97ec7caf1', 3, 'PG', 'be37470b696d64639234638874f6595b', '2016-09-17 09:17:28', '2016-09-17 09:17:28'),
(194, 'coktirta@gmail.com', 'f9fa76a267b379f09f2eaa2f3ab4686a', 0, 'PG', NULL, '2016-09-17 09:49:40', '2016-09-17 09:50:32'),
(195, 'dewi_septiantari@ymail.com', '1df2b34c2553e458a6e862607eafdd6a', 3, 'PG', '3a9e5d077a023637394edcf3995d1b91', '2016-09-17 13:27:38', '2016-09-17 13:27:38'),
(196, 'aagusthini@gmail.com', '7a573f74774e8171226445855ec20f20', 0, 'PG', NULL, '2016-09-17 13:32:00', '2016-09-17 13:32:30'),
(197, 'devierlinta@gmail.com', '8ec6fee34281ec7418a060408036fad6', 3, 'PG', 'aa8b8ee0085ffbb58203a0e9b7570cb5', '2016-09-17 22:32:27', '2016-09-17 22:32:27'),
(198, 'putusuriyatmini@gmail.com', '17733209c4d33534ff80bd3c7b127f55', 3, 'PG', '0332ee5d5b77847fec803c8834871a76', '2016-09-17 23:32:33', '2016-09-17 23:32:33'),
(199, 'ihsanlahibda@gmail.com', 'dcb76da384ae3028d6aa9b2ebcea01c9', 0, 'PG', NULL, '2016-09-18 00:06:13', '2016-09-18 00:07:23'),
(200, 'sagasella2@gmail.com', '211f0ee9da4a193c1b13afeaf324e1fc', 0, 'PG', NULL, '2016-09-18 02:21:40', '2016-09-18 02:23:02'),
(201, 'mithakhuja@gmail.com', 'f22ce1f4de25873775e20a1dd2c2e9d6', 0, 'PG', NULL, '2016-09-18 03:01:35', '2016-09-18 03:06:03'),
(202, 'widari_ayu@ymail.com', '0bb6d5826f6eaaa74ed01dceb98e2172', 3, 'PG', '347b16bffac891a372ded88d554676f8', '2016-09-18 03:51:49', '2016-09-18 03:51:49'),
(203, 'aryxtuti@yahoo.com', 'ea7502c3481902c6f0c75eb8045f1719', 3, 'PG', 'f412cb832509e908ecf5a2b34b7898ca', '2016-09-18 04:23:43', '2016-09-18 04:23:43'),
(204, 'giar_28@yahoo.co.id', '20c1361d79e6855e9e3cc6f32ab341b5', 3, 'PG', '96cfb70f5b3e49b6421601f7d02fd4db', '2016-09-18 04:27:42', '2016-09-18 04:27:42'),
(205, 'thik_dhamazon@yahoo.co.id', '9571fe5fce57186d6f9097eff89f687b', 3, 'PG', '7dd2b7ddb8892aa99cecf53f2ba2954b', '2016-09-18 06:26:45', '2016-09-18 06:26:45'),
(206, 'Aprylsan@gmail.com', '7b089921c0c6282101c376c37a26cfe6', 0, 'PG', NULL, '2016-09-18 11:21:34', '2016-09-18 11:22:02'),
(207, 'antaosd@gmail.com', '4f114334136a38967cb2dbbe2642d2c2', 0, 'PG', NULL, '2016-09-18 11:27:37', '2016-09-18 11:28:25'),
(208, 'dewiseptiantari@gmail.com', '17575c3427b14dc2b8e9aedf683c6c82', 3, 'PG', '215eb6eb0fc846c6785721cd68d1bfeb', '2016-09-18 11:39:36', '2016-09-18 11:39:36'),
(209, 'wayan_heriana84@yahoo.com', 'e0839f4c93500e88c4cbe01818d8854d', 0, 'SW', '2506d5467089adf52fae6ab8f5f4e3ac', '2016-09-18 12:21:59', '2016-09-18 12:21:59'),
(210, 'gitaviviana@yahoo.co.id', '807242a3dba24f7294883ae1f80b9a96', 3, 'PG', 'cb88493c394c176398430102c171e70d', '2016-09-18 12:48:17', '2016-09-18 12:48:17'),
(211, 'igustiputuhendranathawijayaamd@yahoo.com', '4c8715a6f7e22d8e0038667dd6039755', 3, 'PG', 'e1d429aaf147930b40bc636ee4bdc097', '2016-09-18 13:13:23', '2016-09-18 13:13:23'),
(212, 'gunkdharma@gmail.com', 'd02eb2a910297cbaeb994600c5a5ddf7', 3, 'PG', 'dcf604f22f0a4239c2affbb41f130fae', '2016-09-18 13:32:22', '2016-09-18 13:32:22'),
(213, 'wiraadiarmaeni@gmail.com', '78205a5305e27cf3d7635d892ddbdf74', 0, 'PG', NULL, '2016-09-18 14:44:57', '2016-09-18 14:46:03'),
(214, 'widhiastika93@yahoo.com', '1adbb3178591fd5bb0c248518f39bf6d', 3, 'PG', '2fa223d66d4f37ee76b4de7559308b3a', '2016-09-18 16:00:09', '2016-09-18 16:00:09'),
(215, 'aprilldewi17@gmail.com', 'd4a0ae6430a75a3464c3034d8768c319', 3, 'PG', 'c39470f61767009d39845a3902a53805', '2016-09-18 18:14:06', '2016-09-18 18:14:06'),
(216, 'ermandakurniawan@gmail.com', '316c923766991d829f01d9b735aefa27', 3, 'PG', '9188a17f6c7bd80bb995b940a4e4c8f1', '2016-09-18 23:36:48', '2016-09-18 23:36:48'),
(217, 'ermandakurniawan21@gmail.com', '316c923766991d829f01d9b735aefa27', 3, 'PG', '9d257bc3307a66fc4eab866ee913ac96', '2016-09-18 23:41:18', '2016-09-18 23:41:18'),
(218, 'tiaravirgianti701@gmail.com', 'f48b94bb3ac30245e63d83bd51e8fb9c', 3, 'PG', 'f130daf1ffef531d6452976458da57d2', '2016-09-19 01:28:42', '2016-09-19 01:28:42'),
(219, 'rivalbamen@gmail.com', '17bc329fde2d959c874a759a8575aa5c', 0, 'PG', NULL, '2016-09-19 02:48:37', '2016-09-19 02:50:33'),
(220, 'stixutami44@gmail.com', 'b9a35154deb8f04242778bca20b96b35', 3, 'PG', '500d8ee92a92404575dd56993044cbeb', '2016-09-19 05:03:40', '2016-09-19 05:03:40'),
(221, 'eka.ariastini@greenschool.org', 'a8dce6403da36823d88081f9469df3be', 0, 'PG', NULL, '2016-09-19 05:49:31', '2016-09-19 05:50:30'),
(222, 'congadiw87@gmail.com', '6b71eda16cddd028f12b8d10ff1c4141', 0, 'PG', NULL, '2016-09-19 07:00:18', '2016-09-19 07:08:31'),
(223, 'adi_wiputra@yahoo.com', '26b92ece8fc5cadddeb95f2a1568af08', 3, 'PG', '957d2369022ee2f593fb059bb86a5a01', '2016-09-19 07:06:43', '2016-09-19 07:06:43'),
(224, 'finanrayiendra@gmail.com', '289ac26caaf305780a3388b416796e1d', 3, 'PG', '33d1fb0e4fbd5bc128f340bcb27b3252', '2016-09-19 07:25:57', '2016-09-19 07:25:57'),
(225, 'ayuprama04@gmail.com', '0ca88fbcd3da3af8c9ffd624324e43b2', 3, 'PG', '8b3e0f7989367a6a31b12ea4d1f11f18', '2016-09-19 12:08:07', '2016-09-19 12:08:07'),
(226, 'diyarditadipa13@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 3, 'PG', '77eed105b30fdecb29a0701d4d1e4ddd', '2016-09-19 12:34:57', '2016-09-19 12:34:57'),
(227, 'juandirga@gmail.com', '515ad9cef36e74782ba4745d7bfe0aea', 1, 'SW', NULL, '2016-09-19 14:25:49', '2016-09-23 02:49:21'),
(228, 'agungkaton11@gmail.com', 'aa353b477361448736b90c6e23d574be', 3, 'PG', 'f15363f2b6bbb850f923ff0bb6fa6e7f', '2016-09-19 16:26:45', '2016-09-19 16:26:45'),
(229, 'bd.artini@gmail.com', 'bdb844b12f08d43459921c6c67aceb3d', 3, 'PG', '45476ad630bbbc33956bd64ca285dad9', '2016-09-20 03:42:05', '2016-09-20 03:42:05'),
(230, 'kerajinan.ata@gmail.com', '8e76891d55e4eb03647d38ae48fd2339', 3, 'PG', 'ad0e73a31bc545a6107b935e9939bda8', '2016-09-20 06:31:30', '2016-09-20 06:31:30'),
(231, 'andikap4nendra@gmail.com', 'c2aa35a3859009e61869f919e75ac04b', 3, 'PG', '391d7f40f46177fc71e00a1d9b918777', '2016-09-20 10:52:04', '2016-09-20 10:52:04'),
(232, 'sheenta_sukoco@yahoo.co.id', '72484b6bad6c63b40c9f277dbf65c2b2', 3, 'PG', '02a9f4bdd241030294af677653214281', '2016-09-20 11:49:34', '2016-09-20 11:49:34'),
(233, 'witaastitieed@gmail.com', '11652f0ca630da9f3c2f89e1a9a7abbd', 3, 'PG', '19701c48eb0c8db55e576604f2c53b91', '2016-09-20 12:20:28', '2016-09-20 12:20:28'),
(234, 'hestijanuarini@gmail.com', 'a80f54d4140c25ff9ac69ce8914fdf28', 3, 'PG', '0be37fa762acdb5cc9af0b77d0b5419e', '2016-09-21 02:32:15', '2016-09-21 02:32:15'),
(235, 'rimaleliyanti@gmail.com', '5ef1a48b662455461b8716a5277c19d1', 3, 'PG', '49494357a1ccf0aa845763b53d50ff44', '2016-09-21 07:46:20', '2016-09-21 07:46:20'),
(236, 'sriyudiaprilaningrum@gmail.com', '752986842304371ef3fd813ed14f1832', 3, 'PG', '4903e8561ee55e09fd698d05bb781819', '2016-09-21 08:46:14', '2016-09-21 08:46:14'),
(237, 'ninyoman_tripurnami@yahoo.com', '0a7c25dd11d8d98d39caacd5c435a256', 3, 'PG', '88c113afc546ed959d8984bff68c68fb', '2016-09-21 09:40:25', '2016-09-21 09:40:25'),
(238, 'donimarantika1995@gmail.com', 'bf2034b118b925b8ca00df414da57e6c', 3, 'PG', 'a66b2f0fea6f4b99a0b7d85a8c69ee7d', '2016-09-22 05:17:00', '2016-09-22 05:17:00'),
(239, 'arista876@yahoo.com', 'b54b964e1890c27558ead5565477dc32', 3, 'PG', '6ec7eec8aa5a8bc41d56d2954d5a59a5', '2016-09-22 05:45:43', '2016-09-22 05:45:43'),
(240, 'sulastri6152@gmail.com', '712c32d486fef42be4a3f129a25fb780', 3, 'PG', '80900c8d83c28833995b9f9182444a0a', '2016-09-22 06:05:26', '2016-09-22 06:05:26'),
(241, 'putusriayupadmi@gmail.com', '75525536cf2195703b3c6966269365ff', 3, 'PG', '9dc58c70370bba990c34a8c3ca31f6d0', '2016-09-22 11:40:22', '2016-09-22 11:40:22'),
(242, 'purwanidewi19@gmail.com', 'd5560b6140c4f47f2c12f11d37de11eb', 3, 'PG', '26773ef88413ab7dd4bb03d9744bbe62', '2016-09-22 14:13:16', '2016-09-22 14:13:16'),
(243, 'ayujuwita23@yahoo.com', '2270e43c3238db06098fe99970390bc2', 3, 'PG', '0a48f4afd68b7b2566f759e407355437', '2016-09-22 16:59:14', '2016-09-22 16:59:14'),
(244, 'dewaardinata@gmail.com', '7df4213e8b13ba254c04301ae627e550', 3, 'PG', '4df3f43de9cfe11255a9a9434f8caa08', '2016-09-23 08:45:11', '2016-09-23 08:45:11'),
(245, 'indra_wibawa58@yahoo.co.id', '81fdf3c881249f15d8ff376417fcb238', 3, 'PG', '97053180d3fe49ccdeb3766e2472ccbe', '2016-09-23 14:01:56', '2016-09-23 14:01:56'),
(246, 'bagusmahardika53@yahoo.co.id', '070de72fcbf18230b45dcc6da44569bc', 3, 'PG', '35ca2606831b27f6537d6d09424d79ca', '2016-09-24 01:07:06', '2016-09-24 01:07:06'),
(247, 'taharyanti@yahoo.com', '5f0622325a3e66c7b18e8d3b95b98c8f', 3, 'PG', '923e22bdf8ddf1ce335dc9312d53d662', '2016-09-24 01:49:36', '2016-09-24 01:49:36'),
(248, 'taharyanti@gmail.com', '63112797a1d3856e7345355a2022480b', 3, 'PG', 'f5ffc7c5452d431974ce6a381ca981ef', '2016-09-24 01:56:05', '2016-09-24 01:56:05'),
(249, 'bagusmahardika74@gmal.com', '070de72fcbf18230b45dcc6da44569bc', 3, 'PG', '2c7fa832f09e19a2af204eca324376a9', '2016-09-24 03:07:09', '2016-09-24 03:07:09'),
(250, 'lylyn88@yahoo.com', '64237835612f18ee9dd8d46ab09e2bb8', 3, 'PG', 'c7e05aa6b1e07d8310ffc16d16210a8c', '2016-09-24 04:23:01', '2016-09-24 04:23:01'),
(251, 'cenigansari33@yahoo.com', '827ccb0eea8a706c4c34a16891f84e7b', 3, 'PG', '4ff299080f845086d245bb21ab46e32b', '2016-09-24 04:36:25', '2016-09-24 04:36:25'),
(252, 'mas.absari@gmail.com', 'a55bef1a4b1c50ae234997887625180a', 3, 'PG', 'a55bef1a4b1c50ae234997887625180a', '2016-09-24 11:01:40', '2016-09-24 11:01:40'),
(253, 'suriyatmini76@gmail.com', '17733209c4d33534ff80bd3c7b127f55', 3, 'PG', '83eeb85a00e78a05bcc4601f2c2ba2b6', '2016-09-25 02:43:38', '2016-09-25 02:43:38'),
(254, 'suriyatmini1976@gmail.com', '0c94c31637d52103a8539184d6cc3bd5', 3, 'PG', 'ed51bf0f54676d6a8e370ff5af373426', '2016-09-25 02:51:47', '2016-09-25 02:51:47'),
(255, 'kukusbolu93@yahoo.com', 'd692154fb7c05d8a71cc22511c16516e', 3, 'PG', '337512b4fe95dda2ce69d4c974f2ddb9', '2016-09-25 08:32:21', '2016-09-25 08:32:21'),
(256, 'luhayuwidiari289@gmail.com', '6220fb8961469c93e6fa3bf28d75fba3', 3, 'PG', 'ae1937a902f8df6997a89c9c3473e845', '2016-09-26 00:06:17', '2016-09-26 00:06:17'),
(257, 'dedekevie1@gmail.com', 'da45a7a8802298d295b71c82970563f2', 3, 'PG', '01a4528865d2cb4bf7fa5abc76a6c23c', '2016-09-26 09:00:57', '2016-09-26 09:00:57'),
(258, 'gusmang1986@yahoo.co.id', 'e7ccfec7cc0ba0f1208c8f51d191dcfe', 3, 'PG', '2f8acf92e9b8b3ca6665f7bf623a74ee', '2016-09-27 00:36:15', '2016-09-27 00:36:15'),
(259, 'mhsantosa@hotmail.com', '32889bc976c56b8f926deddb7854ae08', 1, 'AD', NULL, '2016-09-27 06:41:14', NULL),
(260, 'ayurositarasmi@gmail.com', '363b86111876c8a11cbeedea0f06cce7', 3, 'PG', '41f980fc66be02a5b9f090d54761699a', '2016-09-27 08:29:46', '2016-09-27 08:29:46'),
(261, 'canestra@yahoo.com', '7ca955bd92ca8b00548ddf36d2e79217', 3, 'PG', '10c39df247d65f0c53219ed39750257d', '2016-09-27 23:14:35', '2016-09-27 23:14:35'),
(262, 'chandrachand85@yahoo.co.uk', '4216bfc817307dbdc92682b4ab350a30', 3, 'PG', '0b440053740211cccd5392d53c50afc0', '2016-09-28 06:05:02', '2016-09-28 06:05:02'),
(263, 'ecaxputri@yahoo.co.id', '36053440c4afa216ff09a8e5f9b72b0b', 3, 'PG', '8ca828d98725b398aa7548d373138d25', '2016-09-28 07:12:36', '2016-09-28 07:12:36'),
(264, 'nandhawik@gmail.com', '47746caa53152b50c961feb3c2ba7408', 3, 'PG', '60023926c4e2f039c9b062bf17ff0ac6', '2016-09-28 09:54:06', '2016-09-28 09:54:06'),
(265, 'iiirwandika@gmail.com', '6441c1608431ce569ccacbcf3925c7da', 3, 'PG', '30d7c7e8ea79a8f92931b64947322fc6', '2016-09-30 11:45:13', '2016-09-30 11:45:13'),
(266, 'tu_pras@yahoo.com', 'b1f9369584734421ad730c30ab3ad9e4', 3, 'PG', '95eb22086fde2ca12f9db5a0e4a5577f', '2016-10-02 01:35:32', '2016-10-02 01:35:32'),
(267, 'dhermawancanggih@gmail.com', '802aed31f5a26bf1d9470493d9b68923', 3, 'PG', 'f3fec7383d2dc27f9ab9daaf54202625', '2016-10-04 01:29:17', '2016-10-04 01:29:17'),
(268, 'jara_merani@ymail.com', '1b084ade794329e311c12b86eb74e977', 3, 'PG', 'b160f683e1a4e9b1acd8abdae1e458e8', '2016-10-04 08:11:01', '2016-10-04 08:11:01'),
(269, 'tristaningrat817@yahoo.com', '94a83c6c3452029e731bb65a7129a8c6', 3, 'PG', '34c5c51c60718625f6a3161bc61cb88a', '2016-10-05 21:08:24', '2016-10-05 21:08:24'),
(270, 'gustiayubudiwati@gmail.com', 'd8b0dc39e3c596fb230682b112b57b42', 3, 'PG', 'a320d72b0c562d4fe9f708e43d649001', '2016-10-07 07:07:31', '2016-10-07 07:07:31'),
(271, 'premaayani015@gmail.com', '720cc62cff09982ab429a37a2d59687f', 3, 'PG', '021a34973ae5a897ba4212357c16baff', '2016-10-09 05:55:03', '2016-10-09 05:55:03'),
(272, 'ra.apsari@gmail.com', '792be2f78b2a482d5afc70010899ef6a', 3, 'PG', '850c4dc145f36d9ff621832982f26540', '2016-10-10 12:47:20', '2016-10-10 12:47:20'),
(273, 'agungdiahacintya@gmail.com', 'f9a99423c41a2ab7cdfb5417462df385', 3, 'PG', '6c3798706c9dd741a57606bc09d17a22', '2016-10-11 13:11:41', '2016-10-11 13:11:41'),
(274, 'santa.ma_rya@yahoo.com', '07501de4e798a168eb38edaa48f3c4cc', 3, 'PG', '0ecfe815a4b822e4d431c062cb099ec6', '2016-10-13 01:56:56', '2016-10-13 01:56:56'),
(275, 'prawira02@gmail.com', '32fdd35eb696e0bfdb263fdd177757b6', 1, 'AD', NULL, '2016-10-15 01:43:36', '2016-10-15 01:44:36'),
(276, 'lastaketut280660@gmail.com', '9ffb4f9f0eccfb7dfb060f9fbc972569', 3, 'PG', '03f268bc796a8beea8496c63b23c14fe', '2016-10-15 15:19:00', '2016-10-15 15:19:00'),
(277, 'Adiutami6501@yahoo.co.id ', 'a29133df0dc8c9f6032390b73fe787e8', 3, 'PG', '8df62cdecc1b8dc296edfd078dae8969', '2016-10-17 00:22:26', '2016-10-17 00:22:26'),
(278, 'utami1914@gmail.com ', 'a29133df0dc8c9f6032390b73fe787e8', 0, 'SW', '8070eab4ded20e9018ef6796c8e78482', '2016-10-17 01:04:19', '2016-10-17 01:04:19'),
(279, 'owenpurusaarta@yahoo.co.id', '627a128a4c56db06410f2d13b298feed', 0, 'SW', 'd05566a0cac56f77608b42f549dd6a13', '2016-10-18 11:59:10', '2016-10-18 11:59:10'),
(280, 'ragenrampih@gmail.com', 'f5c23546521bc8bb4161d993745a56f9', 3, 'PG', 'b12a2ed2cdd1147ce893497b4aafde39', '2016-10-19 02:42:38', '2016-10-19 02:42:38'),
(281, 'ariekaryawati@gmail.com', '65e663cc860bb78c4b02b1d311a1ec5f', 3, 'PG', 'cbe4222b67cc21055fc6568bbd9e60f9', '2016-10-22 05:25:46', '2016-10-22 05:25:46'),
(282, 'mahasaraswati.nita@gmail.com', '5523b01182e858ecc950742f7f2b684c', 3, 'PG', '6604978783b9f2af7933e621a835ad19', '2016-10-22 05:26:55', '2016-10-22 05:26:55'),
(285, 'ariyani.dista@gmail.com', '2cdafccfb281db5fc0ee9a6917756636', 3, 'PG', '1d58961edaceef0bb07112f6c4463cbc', '2016-11-01 09:45:54', '2016-11-01 09:45:54'),
(286, 'admin@edukezy.com', '82be67c3af763b10030b427849e601a1', 1, 'AD', NULL, '2016-11-02 01:54:59', NULL),
(289, 'indahbali59@gmail.com', '312b2dd9314c9e0e301d7d9b90c02738', 3, 'PG', '7fd3a56ac51433166ec0cda4d41079b6', '2016-11-11 09:24:46', '2016-11-11 09:24:46'),
(290, 'asririani19@gmail.com', 'fc0fd7e03668207c0bf5732cbd1c78ea', 3, 'PG', '1f7b0b224fe650e8633c3e2dfe2b8ebe', '2016-11-12 02:30:34', '2016-11-12 02:30:34'),
(291, 'sridianaasti@gmail.com', '560bb811aabc0f4e0c5091e10db6ed38', 3, 'PG', '40fcb09bce8dfc64db3473ade4d8534a', '2016-11-13 02:28:50', '2016-11-13 02:28:50'),
(298, 'kadekmuliartini@gmail..com', '772f803e7481f165ecf17e3b3b14efd1', 0, 'SW', 'd85885cdd0a7cc85fed2e742834536ad', '2016-11-19 16:09:59', '2016-11-19 16:09:59'),
(293, 'andikapanendra@gmail.com', 'c2aa35a3859009e61869f919e75ac04b', 3, 'PG', 'ccc2d50a801272ac37a2497a83eeb448', '2016-11-16 03:20:59', '2016-11-16 03:20:59'),
(294, 'ketutsuartika40@gmail.com', 'ff5229f38551ee1319118f3dc9deef74', 3, 'PG', 'a0f2679e81c50f1008cb44532a9408b3', '2016-11-16 04:48:50', '2016-11-16 04:48:50'),
(295, 'frumensiasanur@gmail.com', '432663c422e8c140c0b258c743b427ad', 3, 'PG', '0ee2ed22e8155f7bf03e3b3d1a04e100', '2016-11-16 05:13:48', '2016-11-16 05:13:48'),
(296, 'teguhndoet@gmail.com', '2cf3e61d0bf71431a48c82ffa67dd579', 3, 'PG', '9df6155edd4ac7d27cee90b3166c689f', '2016-11-17 03:37:12', '2016-11-17 03:37:12'),
(300, 'sartika.mahendraputra@gmail.com', '8efa4746bf5abed5b67e3af9bd8aeaff', 1, 'PG', '55467c15997f8786709120dcf523830f', '2016-11-21 01:39:07', '2016-11-21 01:39:07'),
(301, 'ayuagunk90@gmail.com', 'ccf0c59915cf7091e03c5be3ffd1e552', 1, 'SW', NULL, '2016-11-21 01:53:10', '2016-11-21 01:54:00'),
(302, 'kaknanda0209@gmail.com', '4a69f72dff1cd37350eefed69e2e3f0c', 1, 'PG', 'd371ce522ac9e41c4f6674e58260abc7', '2016-11-21 06:33:26', '2016-11-21 06:33:26'),
(303, 'yudistira.putra911@gmail.com', 'afe3dd613c16544cb825de4d922f9d87', 1, 'SW', NULL, '2016-11-21 11:17:43', '2016-11-21 11:18:27'),
(304, 'iinpramunistiawati@gmail.com', 'c8de7e91caa320418bb10185bac91929', 1, 'PG', 'de119aaf0475508c95cb592e1bda9902', '2016-11-22 12:02:46', '2016-11-22 12:02:46'),
(305, 'ge.katrangan@gmail.com', '6e11436b11d4faa539b690e23fb138c7', 1, 'SW', NULL, '2016-11-24 03:35:12', '2016-11-24 03:57:24'),
(306, 'ayuratna343@gmail.com', '95e99ce5329942b4e48a91262bbd44da', 1, 'SW', NULL, '2016-11-24 03:39:50', '2016-11-24 03:54:47'),
(307, 'elind.blake@gmail.com', 'e90b4ba6c19dd721febd0e0856edb667', 1, 'AD', NULL, '2016-11-24 03:58:17', NULL),
(308, 'ayusugianitri@gmail.com', '866579d26eff04c4c3f88372c45c89a5', 1, 'SW', NULL, '2016-11-24 04:01:04', '2016-11-24 04:40:17'),
(309, 'mhsantosa@hotmail.com', '32b06e7f110b00efacd812c25acbd77e', 1, 'AD', NULL, '2016-11-24 04:01:04', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
