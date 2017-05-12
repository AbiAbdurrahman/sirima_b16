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
        
  			
  			<div class="container" id="input-form">
  				<form action="" method="POST" role="form">
  				<h3 class="text-center">FORM PEMILIHAN JENJANG UNTUK PENDAFTARAN</h3><br>
  			
  				<label for="sel1">Jenjang (pilih salah satu):</label>
			      <select class="form-control" id="sel1">
			      	<option>(pilih jenjang)</option>
			        <option>S1</option>
			        <option>S2</option>
 			        <option>S3</option>
      			  </select>
   			    <br>
  			
  				
  			
  				<a href="semas_sarjana.html" class="btn btn-info" role="button">Pilih</a>
  			</div>

  			
  			</form>

  		</div>
  	
  	
  </div>
  
  </body>
</html>