<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Track Pendaftaran</title>

    <!-- Bootstrap -->

    <link href="css/trackpendaftaran.css" rel="stylesheet" type="text/css">
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
            <li class="active"><a href="#">Rekap Pendaftaran</a></li>
            <li><a href="#">Hasil Seleksi</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container" id="input-form">
      <form>
        <div class="form-group">
          <label>Periode</label>
          <select class="form-control" id="periode-penerimaan">
            <?php
              $conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16");
              $sql = "SELECT * from SIRIMA.periode_penerimaan";

              $result = pg_query($conn, $sql);

              while ($row = pg_fetch_row($result)) {
                echo "<option>$row[0] - $row[1]</option>";
              }
            ?>
            <!-- <option>2007</option>
            <option>2008</option>
            <option>2009</option> -->
          </select>
        </div>
        <div class="form-group">
          <label>Jenjang</label>
          <select class="form-control" id="jenjang">
            <?php
              $conn = pg_connect("host=localhost port=5432 dbname=abdurrahmansaleh51 user=postgres password=basdatb16");
              $sql = "SELECT * from SIRIMA.jenjang";

              $result = pg_query($conn, $sql);

              while ($row = pg_fetch_row($result)) {
                echo "<option value='$row[0]'>$row[0]</option>";
              }
            ?>
            <!-- <option>S1</option>
            <option>S2</option>
            <option>S3</option> -->
          </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
    <div class="container" id="tabel-hasil">
      <!-- <table class="table table-striped">
            <thead>
              <tr>
                <th>Nama Prodi</th>
                <th>Jenis Kelas</th>
                <th>Nama Fakultas</th>
                <th>Kuota</th>
                <th>Jumlah Pelamar</th>
                <th>Jumlah Diterima</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Ilmu Komputer</td>
                <td>Reguler</td>
                <td>Ilmu Komputer</td>
                <td>110</td>
                <td>400</td>
                <td>110</td>
              </tr>
              <tr>
                <td>Teknik Industri</td>
                <td>Paralel</td>
                <td>Teknik</td>
                <td>140</td>
                <td>200</td>
                <td>58</td>
              </tr>
            </tbody>
      </table> -->
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>