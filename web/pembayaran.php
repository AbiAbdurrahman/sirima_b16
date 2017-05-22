<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
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
              <a class="navbar-brand" href="#">SIRIMA Admin Page</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="#">Home</a></li>
                <li class="active"><a href="#">Membuat Pendaftaran</a></li>
                <li><a href="#">Hasil Seleksi</a></li>
              </ul>
            </div><!--/.nav-collapse -->
          </div>
        </nav>
        <br>
        <br>
        <br>
  			<div class="container" id="input-form">

  			<form action="" method="POST" role="form">
  				<legend class="text-center">FORM PEMBAYARAN</legend><br>
  			 			
          <div class="form-group">
            <label for="usr">ID Pendaftaran</label>
            <input type="text" class="form-control" id="usr" value="1234">
          </div>

          <div class="form-group">
            <label for="usr">Biaya Pendaftaran</label>
            <input type="text" class="form-control" id="usr" value="Rp500.000,00">
          </div>
  				
  			
  				<a href="sukses.html" class="btn btn-info" role="button">Bayar</a>
  			</form>

  		</div>
  	</div>
  </div>
  
  </body>
</html>