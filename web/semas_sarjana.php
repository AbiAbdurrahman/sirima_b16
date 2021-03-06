<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
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
  				<legend class="text-center">FORM PENDAFTARAN SEMAS SARJANA</legend><br>
  			
          <div class="form-group">
            <label for="usr">Asal Sekolah</label>
            <input type="text" class="form-control" id="usr">
          </div>

  				<label for="sel1">Jenis SMA:</label>
			      <select class="form-control" id="sel1">
              <option>(pilih SMA)</option>
			        <option>IPA</option>
			        <option>IPS</option>
 			        <option>Bahasa</option>
      			  </select>
   			    <br>

          <div class="form-group">
            <label for="usr">Alamat Sekolah</label>
            <input type="text" class="form-control" id="usr">
          </div>
  			  
          <div class="form-group">
            <label for="usr">NISN</label>
            <input type="text" class="form-control" id="usr">
          </div>

          <div class="form-group"> <!-- Date input -->
            <label class="control-label" for="date">Date</label>
            <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>
          </div>

          <script type="text/javascript">
            $(document).ready(function(){
              var date_input=$('input[name="date"]'); //our date input has the name "date"
              var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
              var options={
                format: 'mm/dd/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
              };
              date_input.datepicker(options);
            })
          </script>

          <div class="form-group">
            <label for="usr">Nilai UAN</label>
            <input type="text" class="form-control" id="usr">
          </div>

          <label for="sel1">Pilihan prodi 1</label>
            <select class="form-control" id="sel1">
              <option>(pilih Prodi)</option>
              <option>Ilmu Komputer</option>
              <option>Sastra Jawa</option>
              <option>Sastra Arab</option>
              <option>Ilmu Komunikasi</option>
              <option>Sistem Informasi</option>
              <option>Matematika</option>
              <option>Psikologi</option>
              <option>Teknik Mesin</option>
              <option>Bisnis Syariah</option>
              </select>
            <br>

          <label for="sel1">Pilihan prodi 2 (tidak wajib)</label>
            <select class="form-control" id="sel1">
              <option>(pilih Prodi)</option>
              <option>Ilmu Komputer</option>
              <option>Sastra Jawa</option>
              <option>Sastra Arab</option>
              <option>Ilmu Komunikasi</option>
              <option>Sistem Informasi</option>
              <option>Matematika</option>
              <option>Psikologi</option>
              <option>Teknik Mesin</option>
              <option>Bisnis Syariah</option>
              </select>
            <br>

          <label for="sel1">Pilihan prodi 3 (tidak wajib)</label>
            <select class="form-control" id="sel1">
              <option>(pilih Prodi)</option>
              <option>Ilmu Komputer</option>
              <option>Sastra Jawa</option>
              <option>Sastra Arab</option>
              <option>Ilmu Komunikasi</option>
              <option>Sistem Informasi</option>
              <option>Matematika</option>
              <option>Psikologi</option>
              <option>Teknik Mesin</option>
              <option>Bisnis Syariah</option>
              </select>
            <br>
  				
          <label for="sel1">Lokasi kota ujian</label>
            <select class="form-control" id="sel1">
              <option>(pilih kota)</option>
              <option>Jakarta Selatan</option>
              <option>Jakarta Utara</option>
              <option>Jakarta Timur</option>
              <option>Depok</option>
              <option>Jakarta Barat</option>
              <option>Jakarta Pusat</option>
              <option>Bogor</option>
              <option>Bekasi</option>
              <option>Tangerang</option>
              </select>
            <br>

          <label for="sel1">Lokasi tempat ujian</label>
            <select class="form-control" id="sel1">
              <option>(pilih tempat ujian)</option>
              <option>SMA 1 Bogor</option>
              <option>SMA 1 Depok</option>
              <option>SMA Al Izhar</option>
              <option>SMA 1 Tangerang Selatan</option>
              <option>SMA Pangudi Luhur</option>
              <option>SMA Bhakti Mulya 400</option>
              <option>SMA Al Azhar Pusat</option>
              <option>SMA Labschool Rawamangun</option>
              </select>
            <br>
  			
  				<a href="pembayaran.html" class="btn btn-info" role="button">Simpan</a>
  			</form>

  	   </div>
  	</div>
  </div>
  
  </body>
</html>