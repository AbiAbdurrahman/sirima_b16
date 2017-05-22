<?php

	$nomorperiode = (int) pg_escape_string($_POST["periode"]);
	$jenjang = pg_escape_string($_POST["jenjang"]);
	$kodeprodi = (int) pg_escape_string($_POST["prodi"]);

	if (isset($nomorperiode) && isset($jenjang) && isset($kodeprodi)) {
		
		/* localhost 
		$conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16"); */

		/* kawung */
		$conn = pg_connect("host=dbpg.cs.ui.ac.id dbname=b216 user=b216 password=bdb1622016");

		$sql = 'SELECT DISTINCT PD.Id, P.nama_lengkap, P.alamat, P.jenis_kelamin, P.tanggal_lahir, P.no_ktp, P.email FROM SIRIMA.PELAMAR P, SIRIMA.PENDAFTARAN PD, SIRIMA.PENDAFTARAN_PRODI PP, SIRIMA.PROGRAM_STUDI PS WHERE P.username = PD.pelamar AND PD.Id = PP.Id_pendaftaran AND PD.nomor_periode = ' . $nomorperiode . ' AND PP.kode_prodi = ' . $kodeprodi . ' AND PP.status_lulus = TRUE';

		$result = pg_query($conn, $sql);

		while ($row = pg_fetch_row($result)) {
			echo "<tr>
	                    <td>$row[0]</td>
	                    <td>$row[1]</td>
	                    <td>$row[2]</td>
	                    <td>$row[3]</td>
	                    <td>$row[4]</td>
	                    <td>$row[5]</td>
	                    <td>$row[6]</td>
	              </tr>";
		}
	} else die("mohon masukkan data yang lengkap");
?>