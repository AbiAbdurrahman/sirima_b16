<!DOCTYPE html>
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
            <li><a href="#">Rekap Pendaftaran</a></li>
            <li class="active"><a href="#">Hasil Seleksi</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container" id="input-form">
      <form>
        <div class="form-group">
          <label>Periode</label>
          <select class="form-control" id="periode-penerimaan">
            <option>2007</option>
            <option>2008</option>
            <option>2009</option>
          </select>
        </div>
        <div class="form-group">
          <label>Jenjang</label>
          <select class="form-control" id="periode-penerimaan">
            <option>S1</option>
            <option>S2</option>
            <option>S3</option>
          </select>
        </div>
        <div class="form-group">
          <label>Prodi</label>
          <select class="form-control" id="periode-penerimaan">
            <option>Ilmu Komputer Reguler</option>
          </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
    <div class="container" id="tabel-hasil">
      <!-- <table class="table table-striped">
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
            <tbody>
              <tr>
                <td>1234</td>
                <td>Taniya Putri</td>
                <td>Jl. Cendrawasih 2, Depok</td>
                <td>Perempuan</td>
                <td>2 Desember 1990</td>
                <td>1234543456678</td>
                <td>Taniya@gmail.com</td>
              </tr>
              <tr>
                <td>5678</td>
                <td>Agil Baskoro</td>
                <td>Jl. Veteran 15, Jakarta</td>
                <td>Laki-laki</td>
                <td>15 November 1990</td>
                <td>0987656787655</td>
                <td>agil@gmail.com</td>
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