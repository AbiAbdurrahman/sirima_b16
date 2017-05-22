<?php

	/* localhost
	$conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16"); */

	/* kawung */
	$conn = pg_connect("host=dbpg.cs.ui.ac.id dbname=b216 user=b216 password=bdb1622016");

	$sql = "SELECT * from SIRIMA.program_studi WHERE jenjang = '" . pg_escape_string($_GET["jenjang"]) . "'";

	$result = pg_query($conn, $sql);

	echo '<label>Prodi</label>';
	echo '<select class="form-control" name="prodi" id="program-studi">';

	while ($row = pg_fetch_row($result)) {
		echo "<option value='$row[0]'>$row[4] $row[1] $row[2]</option>";
	}

	echo '</select>';

?>