
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Hasil Seleksi</title>

    <!-- Bootstrap -->

    <link href="css/hasilseleksi.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" id="admin-navbar">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Sirima Admin Page</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">Home</a></li>
            <li><a href="trackpendaftaran.php">Rekap Pendaftaran</a></li>
            <li class="active"><a href="#">Hasil Seleksi</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container" id="input-form">
      <form name="preference" id="post-preference" method="POST">
        <div class="form-group" id="opsi-periode">
          <label>Periode</label>
          <select class="form-control" name="periode" id="periode-penerimaan">
            <?php
              
              /* localhost
              $conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16");*/
              /* kawung */
              $conn = pg_connect("host=dbpg.cs.ui.ac.id dbname=b216 user=b216 password=bdb1622016");
              $sql = "SELECT * from SIRIMA.periode_penerimaan";

              $result = pg_query($conn, $sql);

              while ($row = pg_fetch_row($result)) {
                echo "<option value='$row[0]'>$row[0] - $row[1]</option>";
              }
            ?>
            <!-- <option>2007</option> -->
          </select>
        </div>
        <div class="form-group" id="opsi-jenjang">
          <label>Jenjang</label>
          <select class="form-control" id="jenjang" name="jenjang" onclick="getProdi(this.value)">
            <?php
              /* localhost
              $conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16");*/
              /* kawung */
              $conn = pg_connect("host=dbpg.cs.ui.ac.id dbname=b216 user=b216 password=bdb1622016");
              $sql = "SELECT * from SIRIMA.jenjang";

              $result = pg_query($conn, $sql);

              while ($row = pg_fetch_row($result)) {
                echo "<option value='$row[0]'>$row[0]</option>";
              }

            ?>
          </select>
        </div>
        <div class="form-group" id="opsi-prodi">         
          <!-- div ini diisi melalui proses yang ada di optionprodi.php -->
        </div>
        <br>
        <input type="button" class="btn btn-primary" onclick="submitpreferences(this.form)" name="submit" value="Submit"/>
      </form>
    </div>
    <div class="container" id="tabel-hasil">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Id Pendaftaran</th>
                <th>Nama Lengkap</th>
                <th>Alamat</th>
                <th>Jenis Kelamin</th>
                <th>Tanggal Lahir</th>
                <th>No. KTP</th>
                <th>Email</th>
              </tr>
            </thead>
            <tbody id="table-result">
              <!-- tabel ini diisi melalui proses yang ada di seleksiprocess.php -->
            </tbody>
      </table> 
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">
      function getProdi(jenjang) {
        $.ajax({
          url: 'optionprodi.php?jenjang=' + jenjang,
          success: function(data) {
            $("#opsi-prodi").html(data);
          }
        });
      }
      function submitpreferences(form) {
        $.ajax({
          method: 'POST',
          url: 'seleksiprocess.php',
          data: $(form).serialize(),
          success: function(data) {
            $('#table-result').html(data);
          }
        });
      }
    </script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>