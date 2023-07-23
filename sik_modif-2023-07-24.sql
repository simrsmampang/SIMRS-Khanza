SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `sik`.`antripenolakananjuranmedis`  (
  `no_surat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`catatan_adime_gizi`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `asesmen` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `diagnosis` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `monitoring` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `evaluasi` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `instruksi` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `catatan_adime_gizi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catatan_adime_gizi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

ALTER TABLE `sik`.`catatan_cek_gds` DROP PRIMARY KEY;

ALTER TABLE `sik`.`catatan_cek_gds` ADD PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE;

CREATE TABLE `sik`.`checklist_kriteria_keluar_hcu`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `kriteria1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria6` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria7` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria8` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria9` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria10` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria11` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria12` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  CONSTRAINT `checklist_kriteria_keluar_hcu_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `sik`.`pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_kriteria_keluar_hcu_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`checklist_kriteria_keluar_icu`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `kriteria1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria6` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria7` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria8` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria9` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria10` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria11` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  CONSTRAINT `checklist_kriteria_keluar_icu_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `sik`.`pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_kriteria_keluar_icu_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`checklist_kriteria_masuk_hcu`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `kardiologi1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kardiologi2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kardiologi3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kardiologi4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kardiologi5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kardiologi6` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pernapasan1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pernapasan2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pernapasan3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `syaraf1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `syaraf2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `syaraf3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `syaraf4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pencernaan1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pencernaan2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pencernaan3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pencernaan4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pembedahan1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pembedahan2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hematologi1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hematologi2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `infeksi` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  CONSTRAINT `checklist_kriteria_masuk_hcu_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `sik`.`pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_kriteria_masuk_hcu_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`checklist_kriteria_masuk_icu`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `prioritas1_1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas1_2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas1_3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas1_4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas1_5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas1_6` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_6` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_7` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas2_8` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas3_1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas3_2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas3_3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioritas3_4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_tanda_vital_1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_tanda_vital_2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_tanda_vital_3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_tanda_vital_4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_tanda_vital_5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_laborat_1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_laborat_2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_laborat_3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_laborat_4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_laborat_5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_laborat_6` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_radiologi_1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_radiologi_2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_1` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_3` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_4` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_5` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_6` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_7` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kriteria_fisiologis_klinis_8` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  CONSTRAINT `checklist_kriteria_masuk_icu_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `sik`.`pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_kriteria_masuk_icu_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`follow_up_dbd`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `hemoglobin` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hematokrit` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `leokosit` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `trombosit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `terapi_cairan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tgl_perawatan`, `jam_rawat`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `follow_up_dbd_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follow_up_dbd_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`hasil_tindakan_eswl`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mulai` datetime NOT NULL,
  `selesai` datetime NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tindakan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_analgesik` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obat_lain` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uraian_tindakan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uraian_tindakan_focus` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uraian_tindakan_rate` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uraian_tindakan_power` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uraian_tindakan_shock` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diintegrasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kekurangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anjungan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `mulai`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `hasil_tindakan_eswl_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hasil_tindakan_eswl_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `sik`.`dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hasil_tindakan_eswl_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`master_masalah_keperawatan_geriatri`  (
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_masalah` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_masalah`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`master_menolak_anjuran_medis`  (
  `kode_penolakan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_penolakan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_penolakan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`master_rencana_keperawatan_geriatri`  (
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_rencana` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rencana_keperawatan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_rencana`) USING BTREE,
  INDEX `kode_masalah`(`kode_masalah`) USING BTREE,
  CONSTRAINT `master_rencana_keperawatan_geriatri_ibfk_1` FOREIGN KEY (`kode_masalah`) REFERENCES `sik`.`master_masalah_keperawatan_geriatri` (`kode_masalah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`pemantauan_ews_neonatus`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `parameter1` enum('<= 29','30 - 39','40 - 60','>= 61') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor1` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter2` enum('<= 90','90 - 93','>= 94') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor2` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor3` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter4` enum('<= 80','81 - 119','120 - 160','161 - 180','>= 181') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor4` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter5` enum('Berat','Ringan','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor5` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter6` enum('>= 3 Detik','<= 3 Detik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor6` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter7` enum('<= 36,5','36,5 - 37,5','>= 37,5') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor7` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter8` enum('Pink','Pucat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor8` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_total` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_total` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code_blue` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `pemantauan_ews_neonatus_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemantauan_ews_neonatus_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`pemantauan_meows_obstetri`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `parameter_pernapasan` enum('>= 30','21 - 30','11 - 20','< 12') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_pernapasan` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_saturasi` enum('> 95','90 - 94','< 90') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_saturasi` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_temperatur` enum('> 38','35 - 35.9','36 - 37.9','< 35') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_temperatur` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_tekanan_darah_sistole` enum('> 160','150 - 159','100 - 140','90 - 99','< 90') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_tekanan_darah_sistole` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_tekanan_darah_diastole` enum('> 110','90 - 109','< 90') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_tekanan_darah_diastole` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_denyut_jantung` enum('> 120','100 - 120','51 - 99','40 - 50','< 40') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_denyut_jantung` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_kesadaran` enum('Alert','Verbal','Pain','Unresponsive') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_kesadaran` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_ketuban` enum('Khas','Busuk') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_ketuban` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_discharge` enum('Normal','Banyak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_discharge` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter_proteinuria` enum('Negatif','+','++>') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_proteinuria` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `skor_total` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parameter_total` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code_blue` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `pemantauan_meows_obstetri_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemantauan_meows_obstetri_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

ALTER TABLE `sik`.`pemantauan_pews_dewasa` ADD CONSTRAINT `pemantauan_pews_dewasa_ibfk_2` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `sik`.`pengajuan_biaya`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `urgensi` enum('Cito','Emergensi','Biasa') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uraian_latar_belakang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tujuan_pengajuan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `target_sasaran` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_kegiatan` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL,
  `keterangan` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_pj` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Proses Pengajuan','Disetujui','Ditolak','Divalidasi') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_pengajuan`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  INDEX `nik_pj`(`nik_pj`) USING BTREE,
  CONSTRAINT `pengajuan_biaya_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `sik`.`pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pengajuan_biaya_ibfk_2` FOREIGN KEY (`nik_pj`) REFERENCES `sik`.`pegawai` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`pengajuan_biaya_disetujui`  (
  `no_pengajuan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`no_pengajuan`) USING BTREE,
  CONSTRAINT `pengajuan_biaya_disetujui_ibfk_1` FOREIGN KEY (`no_pengajuan`) REFERENCES `sik`.`pengajuan_biaya` (`no_pengajuan`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`penilaian_awal_keperawatan_ralan_geriatri`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `td` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `gcs` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `bmi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan_utama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rpd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rpk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rpo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alergi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `alat_bantu` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_bantu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `prothesa` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_pro` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adl` enum('Mandiri','Dibantu') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_psiko` enum('Tenang','Takut','Cemas','Depresi','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_psiko` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hub_keluarga` enum('Baik','Tidak Baik') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tinggal_dengan` enum('Sendiri','Orang Tua','Suami / Istri','Lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_tinggal` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ekonomi` enum('Baik','Cukup','Kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `budaya` enum('Tidak Ada','Ada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_budaya` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi` enum('Pasien','Keluarga') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_edukasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_a` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_b` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `berjalan_c` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hasil` enum('Tidak beresiko (tidak ditemukan a dan b)','Resiko rendah (ditemukan a/b)','Resiko tinggi (ditemukan a dan b)') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lapor` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_lapor` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg1` enum('Tidak','Tidak Yakin','Ya, 1-5 Kg','Ya, 6-10 Kg','Ya, 11-15 Kg','Ya, >15 Kg') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai1` enum('0','1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sg2` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai2` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_hasil` tinyint(4) NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `provokes` enum('Proses Penyakit','Benturan','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_provokes` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quality` enum('Seperti Tertusuk','Berdenyut','Teriris','Tertindih','Tertiban','Lain-lain') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_quality` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `menyebar` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `skala_nyeri` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `durasi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri_hilang` enum('Istirahat','Medengar Musik','Minum Obat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_nyeri` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pada_dokter` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ket_dokter` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi_kemampuan_bacatulis` enum('Baik','Kurang','Tidak Bisa') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_kebutuhan_penerjemah` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_keterangan_kebutuhan_penerjemah` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_hambatan` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_hambatan_kategori` enum('-','Pendengaran','Penglihatan','Kognitif','Fisik','Budaya','Emosi','Bahasa','Lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi_keterangan_hambatan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_cara_bicara` enum('Normal','Gangguan Bicara') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_bahasa_isyarat` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_menerima_informasi` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_keterangan_menerima_informasi` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi_metode_belajar` enum('Audio','Lisan','Visual','Demonstrasi','Tulisan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fraily_phenotype_berat_badan` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fraily_phenotype_berat_badan_nilai` tinyint(4) NULL DEFAULT NULL,
  `fraily_phenotype_aktifitas_fisik` enum('Tidak Terbatas/Sedikit Terbatas','Sangat Terbatas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fraily_phenotype_aktifitas_fisik_nilai` tinyint(4) NULL DEFAULT NULL,
  `fraily_phenotype_kelelahan` enum('0 - 2 Hari','3 - 7 Hari') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fraily_phenotype_kelelahan_nilai` tinyint(4) NULL DEFAULT NULL,
  `fraily_phenotype_kekuatan` enum('Melemah < 20 %','Melemah > 20 %') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fraily_phenotype_kekuatan_nilai` tinyint(4) NULL DEFAULT NULL,
  `fraily_phenotype_waktu_berjalan` enum('Tidak Melambat','Melambat') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fraily_phenotype_waktu_berjalan_nilai` tinyint(4) NULL DEFAULT NULL,
  `fraily_phenotype_nilai_total` tinyint(4) NULL DEFAULT NULL,
  `fraily_phenotype_status` enum('Sehat','Sedikit Lemah','Lemah','Sangat Lemah') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rencana` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_geriatri_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_geriatri_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`penilaian_awal_keperawatan_ralan_masalah_geriatri`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_masalah` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_masalah`) USING BTREE,
  INDEX `kode_masalah`(`kode_masalah`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_masalah_geriatri_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_masalah_geriatri_ibfk_2` FOREIGN KEY (`kode_masalah`) REFERENCES `sik`.`master_masalah_keperawatan_geriatri` (`kode_masalah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`penilaian_awal_keperawatan_ralan_rencana_geriatri`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_rencana` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `kode_rencana`) USING BTREE,
  INDEX `kode_rencana`(`kode_rencana`) USING BTREE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_rencana_geriatri_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_awal_keperawatan_ralan_rencana_geriatri_ibfk_2` FOREIGN KEY (`kode_rencana`) REFERENCES `sik`.`master_rencana_keperawatan_geriatri` (`kode_rencana`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`penilaian_lanjutan_resiko_jatuh_geriatri`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `penilaian_jatuh_skala1` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai1` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala2` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai2` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai3` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala4` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai4` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala5` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai5` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala6` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai6` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala7` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai7` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala8` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai8` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala9` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai9` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala10` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai10` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_skala11` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penilaian_jatuh_nilai11` tinyint(4) NULL DEFAULT NULL,
  `penilaian_jatuh_totalnilai` tinyint(4) NULL DEFAULT NULL,
  `hasil_skrining` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `saran` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_lanjutan_resiko_jatuh_geriatri_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`penilaian_risiko_dekubitus`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `kondisi_fisik` enum('Baik','Sedang','Buruk','Sangat Buruk') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kondisi_fisik_nilai` tinyint(4) NULL DEFAULT NULL,
  `status_mental` enum('Sadar','Apatis','Bingung','Stupor') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_mental_nilai` tinyint(4) NULL DEFAULT NULL,
  `aktifitas` enum('Jalan Sendiri','Jalan Dengan Bantuan','Kursi Roda','Di Tempat Tidur') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `aktifitas_nilai` tinyint(4) NULL DEFAULT NULL,
  `mobilitas` enum('Bebas Bergerak','Agar Terbatas','Sangat Terbatas','Tidak Mampu Bergerak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobilitas_nilai` tinyint(4) NULL DEFAULT NULL,
  `inkontinensia` enum('Kontinen','Kadang-kadang Inkontinensia Urine','Selalu Inkontenesia Urine','Inkontinensia Alvi Dan Urine') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `inkontinensia_nilai` tinyint(4) NULL DEFAULT NULL,
  `totalnilai` tinyint(4) NULL DEFAULT NULL,
  `kategorinilai` enum('Risiko Rendah','Risiko Sedang','Risiko Tinggi') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_risiko_dekubitus_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_risiko_dekubitus_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`penilaian_risiko_jatuh_neonatus`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `intervensi1` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi2` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi4` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi5` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi6` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi7` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi8` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intervensi9` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi1` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi2` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi4` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edukasi5` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sasaran1` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sasaran2` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sasaran3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sasaran4` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `evaluasi1` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `evaluasi2` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `evaluasi3` enum('Tidak','Ya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`, `tanggal`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `penilaian_risiko_jatuh_neonatus_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_risiko_jatuh_neonatus_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `sik`.`petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

ALTER TABLE `sik`.`rekonsiliasi_obat` MODIFY COLUMN `rekonsiliasi_obat_saat` enum('Admisi','Transfer Antar Ruang','Pindah Faskes Lain','Pulang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `tanggal_wawancara`;

CREATE TABLE `sik`.`surat_penolakan_anjuran_medis`  (
  `no_surat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `hubungan` enum('Suami','Istri','Anak','Ayah','Ibu','Saudara','Keponakan','Adik','Kakak','Orang Tua','Diri Sendiri','-') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pj` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `umur_pj` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_ktppj` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jkpj` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_penolakan` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alasan_penolakan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `informasi_risiko_penolakan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE,
  INDEX `nik`(`nik`) USING BTREE,
  INDEX `no_rawat`(`no_rawat`) USING BTREE,
  INDEX `kode_penolakan`(`kode_penolakan`) USING BTREE,
  CONSTRAINT `surat_penolakan_anjuran_medis_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_penolakan_anjuran_medis_ibfk_2` FOREIGN KEY (`kode_penolakan`) REFERENCES `sik`.`master_menolak_anjuran_medis` (`kode_penolakan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surat_penolakan_anjuran_medis_ibfk_3` FOREIGN KEY (`nik`) REFERENCES `sik`.`pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`surat_penolakan_anjuran_medis_pembuat_pernyataan`  (
  `no_surat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_surat`) USING BTREE,
  CONSTRAINT `surat_penolakan_anjuran_medis_pembuat_pernyataan_ibfk_1` FOREIGN KEY (`no_surat`) REFERENCES `sik`.`surat_penolakan_anjuran_medis` (`no_surat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `sik`.`template_laporan_operasi`  (
  `no_template` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_operasi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_preop` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosa_postop` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jaringan_dieksisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permintaan_pa` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `laporan_operasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_template`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

ALTER TABLE `sik`.`user` ADD COLUMN `pemantauan_meows_obstetri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penilaian_pasien_keracunan`;

ALTER TABLE `sik`.`user` ADD COLUMN `catatan_adime_gizi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `pemantauan_meows_obstetri`;

ALTER TABLE `sik`.`user` ADD COLUMN `pengajuan_biaya` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `catatan_adime_gizi`;

ALTER TABLE `sik`.`user` ADD COLUMN `penilaian_awal_keperawatan_ralan_geriatri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `pengajuan_biaya`;

ALTER TABLE `sik`.`user` ADD COLUMN `master_masalah_keperawatan_geriatri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penilaian_awal_keperawatan_ralan_geriatri`;

ALTER TABLE `sik`.`user` ADD COLUMN `master_rencana_keperawatan_geriatri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `master_masalah_keperawatan_geriatri`;

ALTER TABLE `sik`.`user` ADD COLUMN `checklist_kriteria_masuk_hcu` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `master_rencana_keperawatan_geriatri`;

ALTER TABLE `sik`.`user` ADD COLUMN `checklist_kriteria_keluar_hcu` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `checklist_kriteria_masuk_hcu`;

ALTER TABLE `sik`.`user` ADD COLUMN `penilaian_risiko_dekubitus` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `checklist_kriteria_keluar_hcu`;

ALTER TABLE `sik`.`user` ADD COLUMN `master_menolak_anjuran_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penilaian_risiko_dekubitus`;

ALTER TABLE `sik`.`user` ADD COLUMN `penolakan_anjuran_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `master_menolak_anjuran_medis`;

ALTER TABLE `sik`.`user` ADD COLUMN `laporan_tahunan_penolakan_anjuran_medis` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penolakan_anjuran_medis`;

ALTER TABLE `sik`.`user` ADD COLUMN `template_laporan_operasi` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `laporan_tahunan_penolakan_anjuran_medis`;

ALTER TABLE `sik`.`user` ADD COLUMN `hasil_tindakan_eswl` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `template_laporan_operasi`;

ALTER TABLE `sik`.`user` ADD COLUMN `checklist_kriteria_masuk_icu` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `hasil_tindakan_eswl`;

ALTER TABLE `sik`.`user` ADD COLUMN `checklist_kriteria_keluar_icu` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `checklist_kriteria_masuk_icu`;

ALTER TABLE `sik`.`user` ADD COLUMN `akses_dokter_lain_rawat_jalan` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `checklist_kriteria_keluar_icu`;

ALTER TABLE `sik`.`user` ADD COLUMN `follow_up_dbd` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `akses_dokter_lain_rawat_jalan`;

ALTER TABLE `sik`.`user` ADD COLUMN `penilaian_risiko_jatuh_neonatus` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `follow_up_dbd`;

ALTER TABLE `sik`.`user` ADD COLUMN `persetujuan_pengajuan_biaya` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penilaian_risiko_jatuh_neonatus`;

ALTER TABLE `sik`.`user` ADD COLUMN `pemeriksaan_fisik_ralan_per_penyakit` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `persetujuan_pengajuan_biaya`;

ALTER TABLE `sik`.`user` ADD COLUMN `penilaian_lanjutan_resiko_jatuh_geriatri` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `pemeriksaan_fisik_ralan_per_penyakit`;

ALTER TABLE `sik`.`user` ADD COLUMN `pemantauan_ews_neonatus` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `penilaian_lanjutan_resiko_jatuh_geriatri`;

ALTER TABLE `sik`.`user` ADD COLUMN `validasi_persetujuan_pengajuan_biaya` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `pemantauan_ews_neonatus`;

ALTER TABLE `sik`.`user` ADD COLUMN `riwayat_perawatan_icare_bpjs` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `validasi_persetujuan_pengajuan_biaya`;

SET FOREIGN_KEY_CHECKS=1;