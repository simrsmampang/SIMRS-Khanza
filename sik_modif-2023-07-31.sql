SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `sik_baru`.`bayar_piutang` DROP FOREIGN KEY `bayar_piutang_ibfk_4`;

ALTER TABLE `sik_baru`.`bayar_piutang` DROP FOREIGN KEY `bayar_piutang_ibfk_5`;

ALTER TABLE `sik_baru`.`bayar_piutang` ADD CONSTRAINT `bayar_piutang_ibfk_4` FOREIGN KEY (`kd_rek_diskon_piutang`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `sik_baru`.`bayar_piutang` ADD CONSTRAINT `bayar_piutang_ibfk_5` FOREIGN KEY (`kd_rek_tidak_terbayar`) REFERENCES `sik_baru`.`rekening` (`kd_rek`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `sik_baru`.`gambar` ADD COLUMN `kulitkelamin` longblob NOT NULL AFTER `gigigeligi`;

ALTER TABLE `sik_baru`.`master_masalah_keperawatan_mata` ROW_FORMAT = Compact;

ALTER TABLE `sik_baru`.`pasien` MODIFY COLUMN `keluarga` enum('AYAH','IBU','ISTRI','SUAMI','SAUDARA','ANAK','DIRI SENDIRI','LAIN-LAIN') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `pnd`;

ALTER TABLE `sik_baru`.`penilaian_awal_keperawatan_mata` ROW_FORMAT = Compact;

ALTER TABLE `sik_baru`.`penilaian_awal_keperawatan_mata_masalah` ROW_FORMAT = Compact;

CREATE TABLE `sik_baru`.`penilaian_medis_ralan_kulitdankelamin`  (
  `no_rawat` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `kd_dokter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anamnesis` enum('Autoanamnesis','Alloanamnesis') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hubungan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keluhan_utama` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rps` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rpd` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `rpo` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rpk` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kesadaran` enum('Compos Mentis','Apatis','Delirum') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `td` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nadi` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `suhu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `bb` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nyeri` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `gcs` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `statusderma` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pemeriksaan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosis` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `diagnosis2` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permasalahan` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `terapi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tindakan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `edukasi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no_rawat`) USING BTREE,
  INDEX `kd_dokter`(`kd_dokter`) USING BTREE,
  CONSTRAINT `penilaian_medis_ralan_kulitdankelamin_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `sik_baru`.`reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_medis_ralan_kulitdankelamin_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `sik_baru`.`dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE
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

ALTER TABLE `sik_baru`.`user` ADD COLUMN `penilaian_awal_medis_ralan_kulit_kelamin` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `rekap_pengajuan_biaya`;

SET FOREIGN_KEY_CHECKS=1;