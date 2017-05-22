<?php

	$periode = (int) pg_escape_string($_GET["periode"]);
	/* localhost
    $conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16");*/
    /* kawung */
    $conn = pg_connect("host=dbpg.cs.ui.ac.id dbname=b216 user=b216 password=bdb1622016");
    $sql = 'SELECT * from SIRIMA.jenjang J WHERE J.nama IN (SELECT PS.jenjang FROM SIRIMA.PROGRAM_STUDI PS, SIRIMA.PENERIMAAN_PRODI PEP WHERE PEP.kode_prodi = PS.kode AND PEP.nomor_periode = ' . $periode . ') ';
    $result = pg_query($conn, $sql);
	
	echo '<label>Jenjang</label>';
    echo '<select class="form-control" id="jenjang" name="jenjang">';

    while ($row = pg_fetch_row($result)) {
        echo "<option value='$row[0]'>$row[0]</option>";
    }
           
    echo '</select>';

?>