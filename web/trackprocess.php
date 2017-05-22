<?php

	$nomorperiode = (int) pg_escape_string($_POST["periode"]);
	$jenjang = pg_escape_string($_POST["jenjang"]);

	/* localhost
	$conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16"); */

	/* kawung */
	$conn = pg_connect("host=dbpg.cs.ui.ac.id dbname=b216 user=b216 password=bdb1622016");

	$sql = 'SELECT PS.nama, PS.jenis_kelas, PS.nama_fakultas, PEP.kuota, PEP.jumlah_pelamar, PEP.jumlah_diterima FROM SIRIMA.PROGRAM_STUDI PS, SIRIMA.PENERIMAAN_PRODI PEP WHERE PS.kode = PEP.kode_prodi AND PEP.nomor_periode = ' . $nomorperiode . ' AND PS.jenjang = ' . "'" . $jenjang . "'";

	$result = pg_query($conn, $sql);

	while ($row = pg_fetch_row($result)) {
		# code...
		echo "<tr>
				<td>$row[0]</td>
				<td>$row[1]</td>
				<td>$row[2]</td>
				<td>$row[3]</td>
				<td>$row[4]</td>
				<td>$row[5]</td>
			  </tr>";
	}
?>