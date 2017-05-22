SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

CREATE SCHEMA SIRIMA;

SET search_path to SIRIMA;

SET datestyle to dmY;

CREATE DOMAIN YEAR AS CHAR(4);

CREATE TABLE AKUN(
	username VARCHAR(50) NOT NULL,
	role BOOLEAN NOT NULL,
	password VARCHAR(20) NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE PERIODE_PENERIMAAN(
	nomor SMALLINT NOT NULL,
	tahun YEAR NOT NULL,
	PRIMARY KEY(nomor, tahun)
);

CREATE TABLE JENJANG(
	nama CHAR(2) NOT NULL,
	PRIMARY KEY(nama)
);

CREATE TABLE JADWAL_PENTING(
	nomor SMALLINT NOT NULL,
	tahun YEAR NOT NULL,
	jenjang CHAR(2) NOT NULL,
	waktu_mulai TIMESTAMP NOT NULL,
	waktu_selesai TIMESTAMP NOT NULL,
	deskripsi VARCHAR(150) NOT NULL,
	PRIMARY KEY(nomor, tahun, jenjang, waktu_mulai),
	FOREIGN KEY(nomor, tahun) REFERENCES PERIODE_PENERIMAAN(nomor, tahun),
	FOREIGN KEY(jenjang) REFERENCES JENJANG(nama)  
);

CREATE TABLE PROGRAM_STUDI(
	kode SERIAL NOT NULL,
	nama VARCHAR(100) NOT NULL,
	jenis_kelas VARCHAR(50) NOT NULL,
	nama_fakultas VARCHAR(50) NOT NULL,
	jenjang CHAR(2) NOT NULL,
	PRIMARY KEY(kode),
	FOREIGN KEY(jenjang) REFERENCES JENJANG(nama)  
);

CREATE TABLE PENERIMAAN_PRODI(
	nomor_periode INT NOT NULL,
	tahun_periode YEAR NOT NULL,
	kode_prodi INT NOT NULL,
	kuota INT NOT NULL,
	jumlah_pelamar INT,
	jumlah_diterima INT,
	PRIMARY KEY(nomor_periode, tahun_periode, kode_prodi),
	FOREIGN KEY(nomor_periode, tahun_periode) REFERENCES PERIODE_PENERIMAAN(nomor, tahun),
	FOREIGN KEY(kode_prodi) REFERENCES PROGRAM_STUDI(kode) 
);

CREATE TABLE PELAMAR(
	username VARCHAR(50) NOT NULL,
	nama_lengkap VARCHAR(100) NOT NULL,
	alamat TEXT NOT NULL,
	jenis_kelamin CHAR(1) NOT NULL,
	tanggal_lahir DATE NOT NULL,
	no_ktp CHAR(16) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY(username),
	FOREIGN KEY(username) REFERENCES AKUN(username)
);

CREATE TABLE PENDAFTARAN(
	id SERIAL NOT NULL,
	status_lulus BOOLEAN NOT NULL DEFAULT 'FALSE',
	status_verifikasi BOOLEAN NOT NULL DEFAULT 'FALSE',
	npm CHAR(10),
	pelamar VARCHAR(50) NOT NULL,
	nomor_periode SMALLINT NOT NULL,
	tahun_periode YEAR NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(pelamar) REFERENCES PELAMAR(username),
	FOREIGN KEY(nomor_periode, tahun_periode) REFERENCES PERIODE_PENERIMAAN(nomor, tahun)
);

CREATE TABLE PENDAFTARAN_UUI(
	id_pendaftaran INT NOT NULL,
	rapot VARCHAR(100) NOT NULL,
	surat_rekomendasi VARCHAR(100) NOT NULL,
	asal_sekolah VARCHAR(100) NOT NULL,
	jenis_sma VARCHAR(50) NOT NULL,
	alamat_sekolah TEXT NOT NULL,
	nisn VARCHAR(10) NOT NULL,
	tgl_lulus DATE NOT NULL,
	nilai_uan NUMERIC(10,2) NOT NULL,
	PRIMARY KEY(id_pendaftaran),
	FOREIGN KEY(id_pendaftaran) REFERENCES PENDAFTARAN(id)  
);

CREATE TABLE REKOMENDASI(
	tgl_review DATE NOT NULL,
	id_pendaftaran INT NOT NULL,
	status BOOLEAN NOT NULL,
	nilai INT NOT NULL,
	komentar TEXT NOT NULL,
	PRIMARY KEY(tgl_review, id_pendaftaran),
	FOREIGN KEY(id_pendaftaran) REFERENCES PENDAFTARAN_UUI(id_pendaftaran)
);

CREATE TABLE LOKASI_UJIAN(
	kota VARCHAR(100) NOT NULL,
	tempat VARCHAR(150) NOT NULL,
	PRIMARY KEY(kota,tempat)
);

CREATE TABLE LOKASI_JADWAL(
	kota VARCHAR(100) NOT NULL,
	tempat VARCHAR(150) NOT NULL,
	nomor_periode SMALLINT NOT NULL,
	tahun_periode YEAR NOT NULL,
	jenjang CHAR(2) NOT NULL,
	waktu_awal TIMESTAMP NOT NULL,
	PRIMARY KEY(kota,tempat,nomor_periode,tahun_periode,jenjang,waktu_awal),
	FOREIGN KEY(kota,tempat) REFERENCES LOKASI_UJIAN(kota,tempat),
	FOREIGN KEY(nomor_periode,tahun_periode,jenjang,waktu_awal) REFERENCES JADWAL_PENTING(nomor,tahun,jenjang,waktu_mulai)	
);

CREATE TABLE RUANG_UJIAN(
	kota VARCHAR(100) NOT NULL,
	tempat VARCHAR(150) NOT NULL,
	id SMALLINT NOT NULL,
	PRIMARY KEY(kota,tempat,id),
	FOREIGN KEY(kota, tempat) REFERENCES LOKASI_UJIAN(kota, tempat)
);

CREATE TABLE PENGAWAS(
	nomor_induk VARCHAR(16) NOT NULL,
	nama VARCHAR(100) NOT NULL,
	no_telp TEXT NOT NULL,
	lokasi_kota VARCHAR(100) NOT NULL,
	lokasi_tempat VARCHAR(150) NOT NULL,
	lokasi_id SMALLINT NOT NULL,
	PRIMARY KEY(nomor_induk),
	FOREIGN KEY(lokasi_kota, lokasi_tempat, lokasi_id) REFERENCES RUANG_UJIAN(kota, tempat, id)
);

CREATE TABLE PENDAFTARAN_PRODI(
	id_pendaftaran INT NOT NULL,
	kode_prodi INT NOT NULL,
	status_lulus BOOLEAN NOT NULL,
	PRIMARY KEY(id_pendaftaran,kode_prodi),
	FOREIGN KEY(id_pendaftaran) REFERENCES PENDAFTARAN(id),
	FOREIGN KEY(kode_prodi) REFERENCES PROGRAM_STUDI(kode)
);

CREATE TABLE PENDAFTARAN_SEMAS(
	id_pendaftaran INT NOT NULL,
	status_hadir BOOLEAN NOT NULL,
	nilai_ujian INT NOT NULL,
	no_kartu_ujian CHAR(10) NOT NULL,
	lokasi_kota VARCHAR(100) NOT NULL,
	lokasi_tempat VARCHAR(150) NOT NULL,
	PRIMARY KEY(id_pendaftaran),
	FOREIGN KEY(id_pendaftaran) REFERENCES PENDAFTARAN(id),
	FOREIGN KEY(lokasi_kota, lokasi_tempat) REFERENCES LOKASI_UJIAN(kota, tempat)
);

CREATE TABLE PENDAFTARAN_SEMAS_SARJANA(
	id_pendaftaran INT NOT NULL,
	asal_sekolah VARCHAR(100) NOT NULL,
	jenis_sma VARCHAR(50) NOT NULL,
	alamat_sekolah TEXT NOT NULL,
	nisn VARCHAR(10) NOT NULL,
	tgl_lulus DATE NOT NULL,
	nilai_uan NUMERIC(10, 2) NOT NULL,
	PRIMARY KEY(id_pendaftaran),
	FOREIGN KEY(id_pendaftaran) REFERENCES PENDAFTARAN_SEMAS(id_pendaftaran)
);

CREATE TABLE PENDAFTARAN_SEMAS_PASCASARJANA(
	id_pendaftaran INT NOT NULL,
	nilai_tpa INT NOT NULL,
	nilai_toefl INT NOT NULL,
	jenjang_terakhir CHAR(2) NOT NULL,
	asal_univ VARCHAR(100) NOT NULL,
	alamat_univ TEXT NOT NULL,
	prodi_terakhir VARCHAR(100) NOT NULL,
	nilai_ipk NUMERIC(10, 2) NOT NULL,
	no_ijazah VARCHAR(50) NOT NULL,
	tgl_lulus DATE NOT NULL,
	jenjang CHAR(2) NOT NULL,
	nama_rekomender VARCHAR(100),
	prop_penelitian VARCHAR(100),
	PRIMARY KEY(id_pendaftaran),
	FOREIGN KEY(id_pendaftaran) REFERENCES PENDAFTARAN_SEMAS(id_pendaftaran),
	FOREIGN KEY(jenjang_terakhir) REFERENCES JENJANG(nama),
	FOREIGN KEY(jenjang) REFERENCES JENJANG(nama)
);

CREATE TABLE PEMBAYARAN(
	id SERIAL NOT NULL,
	waktu_bayar TIMESTAMP NOT NULL,
	jumlah_bayar NUMERIC(10,2) NOT NULL,
	id_pendaftaran INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(id_pendaftaran) REFERENCES PENDAFTARAN_SEMAS(id_pendaftaran)
);

INSERT INTO JENJANG(nama) VALUES 
	('S1'),
	('S2'),
	('S3');

INSERT INTO PROGRAM_STUDI(kode, nama, jenis_kelas, nama_fakultas, jenjang) VALUES
	(1, 'Kedokteran', 'Reguler', 'Kedokteran', 'S1'),
	(2, 'Matematika', 'Reguler', 'Matematika dan Pengetahuan Alam', 'S1'),
	(3, 'Teknik Sipil', 'Reguler', 'Teknik', 'S1'),
	(4, 'Ilmu Komputer', 'Reguler', 'Ilmu Komputer', 'S1'),
	(5, 'Kedokteran', 'Reguler', 'Kedokteran', 'S2'),
	(6, 'Fisika', 'Reguler', 'Matematika dan Pengetahuan Alam', 'S2'),
	(7, 'Teknik Sipil', 'Reguler', 'Teknik', 'S2'),
	(8, 'Ilmu Komputer', 'Reguler', 'Ilmu Komputer', 'S2'),
	(9, 'Kedokteran', 'Reguler', 'Kedokteran', 'S3'),
	(10, 'Biologi', 'Reguler', 'Matematika dan Pengetahuan Alam', 'S3'),
	(11, 'Teknik Sipil', 'Reguler', 'Teknik', 'S3'),
	(12, 'Ilmu Komputer', 'Reguler', 'Ilmu Komputer', 'S3'),
	(13, 'Kedokteran', 'Internasional', 'Kedokteran', 'S1'),
	(14, 'Biologi', 'Internasional', 'Matematika dan Pengetahuan Alam', 'S1'),
	(15, 'Teknik Industri', 'Internasional', 'Teknik', 'S1'),
	(16, 'Ilmu Komputer', 'Internasional', 'Ilmu Komputer', 'S1'),
	(17, 'Kedokteran', 'Paralel', 'Kedokteran', 'S1'),
	(18, 'Biologi', 'Paralel', 'Matematika dan Pengetahuan Alam', 'S1'),
	(19, 'Teknik Industri', 'Paralel', 'Teknik', 'S1'),
	(20, 'Ilmu Komputer', 'Paralel', 'Ilmu Komputer', 'S1');

INSERT INTO PERIODE_PENERIMAAN(nomor, tahun) VALUES
	(1, '2007'),
	(2, '2008'),
	(3, '2009');

INSERT INTO JADWAL_PENTING(nomor, tahun, jenjang, waktu_mulai, waktu_selesai, deskripsi) VALUES 
	(1,	'2007',	'S1',	'21/6/2007 08:00',	'30/6/2007 09:00',	'Pendaftaran Online'),
	(1,	'2007',	'S1',	'1/7/2007 08:00',	'10/7/2007 09:00',	'Pembayaran'),
	(1,	'2007',	'S1',	'11/7/2007 08:00',	'20/7/2007 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(1,	'2007',	'S1',	'22/7/2007 07:00',	'22/7/2007 15:00',	'Ujian Saringan Masuk'),
	(1,	'2007',	'S1',	'13/8/2007 17:00',	'13/9/2007 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(1,	'2007',	'S2',	'21/4/2007 08:00',	'30/4/2007 09:00',	'Pendaftaran Online'),
	(1,	'2007',	'S2',	'1/5/2007 08:00',	'10/5/2007 09:00',	'Pembayaran'),
	(1,	'2007',	'S2',	'11/5/2007 08:00',	'20/5/2007 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(1,	'2007',	'S2',	'22/5/2007 07:00',	'22/5/2007 09:00',	'Ujian Saringan Masuk'),
	(1,	'2007',	'S2',	'13/6/2007 17:00',	'13/7/2007 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(1,	'2007',	'S3',	'21/3/2007 08:00',	'30/3/2007 09:00',	'Pendaftaran Online'),
	(1,	'2007',	'S3',	'31/3/2007 08:00',	'9/4/2007 09:00',	'Pembayaran'),
	(1,	'2007',	'S3',	'10/4/2007 08:00',	'19/4/2007 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(1,	'2007',	'S3',	'21/4/2007 07:00',	'21/4/2007 09:00',	'Ujian Saringan Masuk'),
	(1,	'2007',	'S3',	'13/5/2007 17:00',	'13/6/2007 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(2,	'2008',	'S1',	'21/6/2008 08:00',	'30/6/2008 09:00',	'Pendaftaran Online'),
	(2,	'2008',	'S1',	'1/7/2008 08:00',	'10/7/2008 09:00',	'Pembayaran'),
	(2,	'2008',	'S1',	'11/7/2008 08:00',	'20/7/2008 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(2,	'2008',	'S1',	'22/7/2008 07:00',	'22/7/2008 15:00',	'Ujian Saringan Masuk'),
	(2,	'2008',	'S1',	'13/8/2008 17:00',	'13/9/2008 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(2,	'2008',	'S2',	'21/4/2008 08:00',	'30/4/2008 09:00',	'Pendaftaran Online'),
	(2,	'2008',	'S2',	'1/5/2008 08:00',	'10/5/2008 09:00',	'Pembayaran'),
	(2,	'2008',	'S2',	'11/5/2008 08:00',	'20/5/2008 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(2,	'2008',	'S2',	'22/5/2008 07:00',	'22/5/2008 09:00',	'Ujian Saringan Masuk'),
	(2,	'2008',	'S2',	'13/6/2008 17:00',	'13/7/2008 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(2,	'2008',	'S3',	'21/3/2008 08:00',	'30/3/2008 09:00',	'Pendaftaran Online'),
	(2,	'2008',	'S3',	'31/3/2008 08:00',	'9/4/2008 09:00',	'Pembayaran'),
	(2,	'2008',	'S3',	'10/4/2008 08:00',	'19/4/2008 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(2,	'2008',	'S3',	'21/4/2008 07:00',	'21/4/2008 09:00',	'Ujian Saringan Masuk'),
	(2,	'2008',	'S3',	'13/5/2008 17:00',	'13/6/2008 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(3,	'2009',	'S1',	'21/6/2009 08:00',	'30/6/2009 09:00',	'Pendaftaran Online'),
	(3,	'2009',	'S1',	'1/7/2009 08:00',	'10/7/2009 09:00',	'Pembayaran'),
	(3,	'2009',	'S1',	'11/7/2009 08:00',	'20/7/2009 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(3,	'2009',	'S1',	'22/7/2009 07:00',	'22/7/2009 15:00',	'Ujian Saringan Masuk'),
	(3,	'2009',	'S1',	'13/8/2009 17:00',	'13/9/2009 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(3,	'2009',	'S2',	'21/4/2009 08:00',	'30/4/2009 09:00',	'Pendaftaran Online'),
	(3,	'2009',	'S2',	'1/5/2009 08:00',	'10/5/2009 09:00',	'Pembayaran'),
	(3,	'2009',	'S2',	'11/5/2009 08:00',	'20/5/2009 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(3,	'2009',	'S2',	'22/5/2009 07:00',	'22/5/2009 09:00',	'Ujian Saringan Masuk'),
	(3,	'2009',	'S2',	'13/6/2009 17:00',	'13/7/2009 17:00',	'Pengumuman Hasil Seleksi Masuk'),
	(3,	'2009',	'S3',	'21/3/2009 08:00',	'30/3/2009 09:00',	'Pendaftaran Online'),
	(3,	'2009',	'S3',	'31/3/2009 08:00',	'9/4/2009 09:00',	'Pembayaran'),
	(3,	'2009',	'S3',	'10/4/2009 08:00',	'19/4/2009 09:00',	'Pencetakan Kartu Tanda Ujian'),
	(3,	'2009',	'S3',	'21/4/2009 07:00',	'21/4/2009 09:00',	'Ujian Saringan Masuk'),
	(3,	'2009',	'S3',	'13/5/2009 17:00',	'13/6/2009 17:00',	'Pengumuman Hasil Seleksi Masuk');

INSERT INTO LOKASI_UJIAN(kota, tempat) VALUES
	('Depok',	'Universitas Indonesia'),
	('Jakarta',	'Universitas Trisakti'),
	('Tangerang',	'Universitas Swiss dan Jerman'),
	('Depok',	'Universitas Gunadarma'),
	('Jakarta',	'Universitas Negeri Jakarta'),
	('Tangerang',	'Prasetya Mulya'),
	('Depok',	'Bina Sarana Informatika'),
	('Jakarta',	'Universitas Bina Nusantara'),
	('Tangerang',	'Universitas Pelita Harapan');

INSERT INTO LOKASI_JADWAL(kota, tempat, nomor_periode, tahun_periode, jenjang, waktu_awal) VALUES
	('Depok',	'Universitas Indonesia',	1,	'2007',	'S1',	'22/7/2007 07:00'),
	('Jakarta',	'Universitas Trisakti',		2,	'2008',	'S1',	'22/7/2008 07:00'),
	('Tangerang',	'Universitas Swiss dan Jerman',		3,	'2009',	'S1',	'22/7/2009 07:00'),
	('Depok',	'Universitas Gunadarma', 	1,	'2007',	'S2',	'22/5/2007 07:00'),
	('Jakarta',	'Universitas Negeri Jakarta',	2,	'2008',	'S2',	'22/5/2008 07:00'),
	('Tangerang',	'Prasetya Mulya',	3,	'2009',	'S2',	'22/5/2009 07:00'),
	('Depok',	'Bina Sarana Informatika',	1,	'2007',	'S3',	'21/4/2007 07:00'),
	('Jakarta',	'Universitas Bina Nusantara',	2,	'2008',	'S3',	'21/4/2008 07:00'),
	('Tangerang',	'Universitas Pelita Harapan',	3,	'2009',	'S3',	'21/4/2009 07:00');

INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Depok','Universitas Indonesia','1');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Depok','Universitas Indonesia','2');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Jakarta','Universitas Trisakti','3');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Jakarta','Universitas Trisakti','4');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Tangerang','Universitas Swiss dan Jerman','5');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Tangerang','Universitas Swiss dan Jerman','6');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Depok','Universitas Gunadarma','7');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Depok','Universitas Gunadarma','8');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Jakarta','Universitas Negeri Jakarta','9');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Jakarta','Universitas Negeri Jakarta','10');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Tangerang','Prasetya Mulya','11');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Tangerang','Prasetya Mulya','12');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Depok','Bina Sarana Informatika','13');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Depok','Bina Sarana Informatika','14');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Jakarta','Universitas Bina Nusantara','15');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Jakarta','Universitas Bina Nusantara','16');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Tangerang','Universitas Pelita Harapan','17');
INSERT INTO RUANG_UJIAN (kota,tempat,id) VALUES ('Tangerang','Universitas Pelita Harapan','18');

INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('3482652437928350','Sri Lestari','085635425346','Depok','Universitas Indonesia','1');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('7334324392748327','Jaron Wahyudi','085710283323','Depok','Universitas Indonesia','2');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('2843792911203407','Gani Ganiyu','081112412380','Jakarta','Universitas Trisakti','3');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('0230173012901370','Dewi Dania','087592382939','Jakarta','Universitas Trisakti','4');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('1830183901839201','Zara Ghufran','083809813087','Tangerang','Universitas Swiss dan Jerman','5');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('6219829182378910','Anissa Van Hemmer','086571892173','Tangerang','Universitas Swiss dan Jerman','6');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('7287387381901821','Toto Harmono','087632832998','Depok','Universitas Gunadarma','7');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('9212982901384802','Attiya Ana Valensi','086632942308','Depok','Universitas Gunadarma','8');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('8218373899010101','Yudi Mahabrata','081520193812','Jakarta','Universitas Negeri Jakarta','9');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('5286137126829003','Tivon Otegi','087821028390','Jakarta','Universitas Negeri Jakarta','10');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('6423874832732829','Hansel Tanaka Permana','085629318910','Tangerang','Prasetya Mulya','11');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('2893718927138100','Vina Aquila Avanti','087597134234','Tangerang','Prasetya Mulya','12');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('4324783924793969','Shahabi Hilman Rain','085621982387','Depok','Bina Sarana Informatika','13');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('5589723874832422','Kevin Agila Frianto','083213821083','Depok','Bina Sarana Informatika','14');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('3892018392010101','Karina Albar Vashti','085521381281','Jakarta','Universitas Bina Nusantara','15');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('3218371917391912','Jessica Galicia','081366667778','Jakarta','Universitas Bina Nusantara','16');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('9283902839021001','Tevin Aura Arditi','087129182389','Tangerang','Universitas Pelita Harapan','17');
INSERT INTO PENGAWAS (nomor_induk,nama,no_telp,lokasi_kota,lokasi_tempat,lokasi_id) VALUES ('7313891155555555','Mirza Pratiwi Arkanda','085772671997','Tangerang','Universitas Pelita Harapan','18');

INSERT INTO AKUN(username, role, password) VALUES 
('taniya555', FALSE, 'notabot99'),
('agil69', FALSE, 'falsebot78');

INSERT INTO PELAMAR(username, nama_lengkap, alamat, jenis_kelamin, tanggal_lahir, no_ktp, email) VALUES
('taniya555', 'Taniya Putri', 'Jl. Cendrawasih No. 3, Depok', 'P', '2/12/1990', '9582983128380139', 'taniya.putri@gmail.com'),
('agil69', 'Agil Baskoro', 'Jl. Echo No. 17 Ragunan, Jakarta Selatan', 'L', '11/11/1989', '018310294751737', 'aqu.agila@hotmail.com');

INSERT INTO PENDAFTARAN(id, status_lulus, status_verifikasi, npm, pelamar, nomor_periode, tahun_periode) VALUES
(1234, TRUE, TRUE, '0128347355', 'taniya555', 1, '2007'),
(5678, TRUE, TRUE, '0183845039', 'agil69', 1, '2007');

INSERT INTO PENDAFTARAN_PRODI(id_pendaftaran, kode_prodi, status_lulus) VALUES
(1234, 4, TRUE),
(5678, 1, TRUE);

INSERT INTO PENERIMAAN_PRODI(nomor_periode, tahun_periode, kode_prodi, kuota, jumlah_pelamar, jumlah_diterima) VALUES
(1, '2007', 4, 350, 0, 0),
(1, '2007', 3, 400, 0, 0),
(2, '2008', 4, 200, 0, 0);

CREATE OR REPLACE FUNCTION UpdateJumlahPelamar()
RETURNS trigger AS
$$
	DECLARE
		jml_pelamar integer;
	BEGIN

	IF(TG_OP = 'INSERT')THEN
		SELECT jumlah_pelamar into jml_pelamar 
		FROM PENERIMAAN_PRODI PR, PENDAFTARAN P
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = P.id and P.nomor_periode = PR.nomor_periode;
		IF(jml_pelamar = NULL)THEN
			jml_pelamar = 0;
		END IF;
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jml_pelamar +1
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		 RETURN new;
	ELSIF(TG_OP = 'UPDATE')THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jumlah_pelamar +1
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jumlah_pelamar -1
		WHERE old.kode_prodi = PR.kode_prodi and
		 old.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		 RETURN new;
	ELSIF(TG_OP = 'DELETE')THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jumlah_pelamar -1
		WHERE old.kode_prodi = PR.kode_prodi and
		 old.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		 RETURN old;
	END IF;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;


CREATE TRIGGER UpdateJumlahPelamar 
AFTER INSERT OR UPDATE OR DELETE
ON  PENDAFTARAN_PRODI
EXECUTE PROCEDURE UpdateJumlahPelamar();

CREATE OR REPLACE FUNCTION UpdateJumlahDiterima()
RETURNS trigger AS
$$
	DECLARE
		jml_diterima integer;
	BEGIN
	IF(new.status_lulus <> old.status_lulus && new.status_lulus = TRUE)THEN
		SELECT jumlah_pelamar into jml_diterima 
		FROM PENERIMAAN_PRODI PR, PENDAFTARAN P
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = P.id and P.nomor_periode = PR.nomor_periode;
		IF(jml_diterima = NULL)THEN
			jml_diterima = 0;
		END IF;
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_diterima = jml_diterima +1
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		UPDATE PENDAFTARAN P
		SET status_lulus = TRUE
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		RETURN new;
	ELSIF(new.status_lulus <> old.status_lulus && new.status_lulus = FALSE)THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_diterima = jumlah_diterima -1
		WHERE old.kode_prodi = PR.kode_prodi and
		 old.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		UPDATE PENDAFTARAN P
		SET status_lulus = FALSE
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		RETURN new;
	END IF;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

CREATE TRIGGER UpdateJumlahDiterima 
AFTER UPDATE
ON  PENDAFTARAN_PRODI
EXECUTE PROCEDURE UpdateJumlahPelamar();