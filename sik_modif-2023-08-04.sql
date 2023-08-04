SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `sik_baru`.`penilaian_medis_ralan_hemodialisa`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `anamnesis` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hubungan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ruangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nyeri` enum('Tidak Nyeri','Nyeri Ringan','Nyeri Sedang','Nyeri Berat','Nyeri Sangat Berat','Nyeri Tak Tertahankan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_nutrisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hipertensi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dm` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bsk` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `osk` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isk` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bst` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ub` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pgl` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pl` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kon` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dialisis` date NULL DEFAULT NULL,
  `capd` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transplantasi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keadaan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kesadaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bb` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tb` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `suhu` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nadi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `td` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `napas` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sklera` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `konjungtiva` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jvp` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kardiomegali` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bising` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `whezzing` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ronchi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hepatomegali` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `splenomegali` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ascites` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edema` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thorax` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ekg` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bno` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usg` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `renogram` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `biopsi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ctscan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `arteriografi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kultur` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lab` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hematokrit` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hemoglobin` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `leukosit` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `trombosit` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hitung` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ureum` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kreatinin` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `asamurat` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sgot` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sgpt` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hbsag` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ct` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `urin` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cct` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `antihcv` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `penilaian_medis_ralan_hemodialisa_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik_baru`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_medis_ralan_hemodialisa_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `sik_baru`.`dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

ALTER TABLE `sik_baru`.`set_akun` DROP FOREIGN KEY `set_akun_ibfk_58`;

ALTER TABLE `sik_baru`.`set_akun` DROP FOREIGN KEY `set_akun_ibfk_59`;

ALTER TABLE `sik_baru`.`set_akun` DROP FOREIGN KEY `set_akun_ibfk_60`;

ALTER TABLE `sik_baru`.`set_akun` DROP FOREIGN KEY `set_akun_ibfk_61`;

ALTER TABLE `sik_baru`.`set_akun` DROP FOREIGN KEY `set_akun_ibfk_62`;

ALTER TABLE `sik_baru`.`set_akun` DROP FOREIGN KEY `set_akun_ibfk_63`;

ALTER TABLE `sik_baru`.`set_akun` ADD CONSTRAINT `set_akun_ibfk_58` FOREIGN KEY (`Pengadaan_Dapur`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `sik_baru`.`set_akun` ADD CONSTRAINT `set_akun_ibfk_59` FOREIGN KEY (`Stok_Keluar_Dapur`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `sik_baru`.`set_akun` ADD CONSTRAINT `set_akun_ibfk_60` FOREIGN KEY (`Kontra_Stok_Keluar_Dapur`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `sik_baru`.`set_akun` ADD CONSTRAINT `set_akun_ibfk_61` FOREIGN KEY (`PPN_Keluaran`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `sik_baru`.`set_akun` ADD CONSTRAINT `set_akun_ibfk_62` FOREIGN KEY (`Diskon_Piutang`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `sik_baru`.`set_akun` ADD CONSTRAINT `set_akun_ibfk_63` FOREIGN KEY (`Piutang_Tidak_Terbayar`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE `sik_baru`.`set_akun_mandiri`  (
  `kd_rek` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `client_id` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `client_secret` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kd_rek`) USING BTREE,
  CONSTRAINT `set_akun_mandiri_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

ALTER TABLE `sik_baru`.`user` ADD COLUMN `akun_host_to_host_bank_mandiri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penilaian_awal_medis_ralan_kulit_kelamin`;

ALTER TABLE `sik_baru`.`user` ADD COLUMN `penilaian_medis_ralan_hemodialisa` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `akun_host_to_host_bank_mandiri`;

ALTER TABLE `sik_baru`.`user` ADD COLUMN `penilaian_level_kecemasan_ranap_anak` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penilaian_medis_ralan_hemodialisa`;

SET FOREIGN_KEY_CHECKS=1;