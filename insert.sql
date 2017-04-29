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

INSERT INTO LOKASI_UJIAN(kota, tempat, nomor_periode, tahun_periode, jenjang, waktu_awal) VALUES
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
