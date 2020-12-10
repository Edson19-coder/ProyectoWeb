
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TG-GAMER [Noticias]</title>
    <link rel="icon" href="assets/Recursos/Logo.jpg">
    <link rel="stylesheet" href="assets/css/noticias.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function() 
      {
         
          var prueba = <%= session.getAttribute("id")%>;
          var prueba2 = "<%= session.getAttribute("username")%>";
          var prueba3 = "<%= session.getAttribute("foto")%>";

          
          if(prueba !== null)
          {
            alert(prueba);  
            $("#EstaONo").remove();
            $("#imagenUser").src= prueba3;
            $("#NombreUser").value= prueba2;

            
    
          }else{
               $("#imagenUser").remove();
               $("#NombreUser").remove();
               $("#LogOFF").remove();

          }
          
      });
    </script>
</head>

<body>
    <!--NavBar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp">
            <img src="assets/Recursos/Logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
            CineTicias
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
       
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
          <ul class="navbar-nav mr-auto">
              <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home </a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="noticias.jsp">Noticia <span class="sr-only">(current)</span></a>
              </li>

              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Usuario
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="perfil.jsp">Perfil</a>
                    <a class="dropdown-item" href="edicion.jsp">Edicion</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Configuracion</a>
                  </div>
              </li>  
              <li class="nav-item">
                  <a class="nav-link" href="login_register.jsp">Login/Registrar</a>
              </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
          <form id="EstaONo" action="login_register.jsp" class="form-inline my-2 my-lg-0" style="padding-left: 50px; padding-right: 10px;">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login/Registrar</button>
          </form>

          <img id="imagenUser" src="http://cdn.onlinewebfonts.com/svg/img_506739.png" alt="ImagenPerfil" width="50" height="30" style="padding-left: 10px; padding-right: 10px;">
          <a id="NombreUser">Username</a>
            
          <form id="LogOFF" action="logOffController" class="form-inline my-2 my-lg-0" style="padding-left: 20px; padding-right: 10px;">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log Out</button>
          </form>            
        </div>
    </nav>
    <br>
    <div class="container">
      <!--Cards-->
      <h3>Recientes</h1>
      <hr class="my-4">
      <div class="Destacados container-fluid">
            <div class="row row-cols-1 row-cols-md-3">
                <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                    <img class="card-img-top" src="https://static0.srcdn.com/wordpress/wp-content/uploads/2019/12/Mulan-2020-movie-official-poster.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="noticiaEspecifica.jsp" class="btn btn-primary">Detalles</a>
                    </div>
                  </div>  
                  <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                    <img class="card-img-top" src="https://static0.srcdn.com/wordpress/wp-content/uploads/2019/12/Mulan-2020-movie-official-poster.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="noticiaEspecifica.jsp" class="btn btn-primary">Detalles</a>
                    </div>
                  </div>  
                  <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                    <img class="card-img-top" src="https://static0.srcdn.com/wordpress/wp-content/uploads/2019/12/Mulan-2020-movie-official-poster.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="noticiaEspecifica.jsp" class="btn btn-primary">Detalles</a>
                    </div>
                  </div>  
                </div>
      </div>
      <br>
      <h3>Mas vistos</h1>
      <hr class="my-4">
      <div class="Destacados container-fluid">
            <div class="row row-cols-1 row-cols-md-3">
                <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                    <img class="card-img-top" src="https://static0.srcdn.com/wordpress/wp-content/uploads/2019/12/Mulan-2020-movie-official-poster.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="noticiaEspecifica.jsp" class="btn btn-primary">Detalles</a>
                    </div>
                  </div>  
                  <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                    <img class="card-img-top" src="https://static0.srcdn.com/wordpress/wp-content/uploads/2019/12/Mulan-2020-movie-official-poster.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="noticiaEspecifica.jsp" class="btn btn-primary">Detalles</a>
                    </div>
                  </div>  
                  <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                    <img class="card-img-top" src="https://static0.srcdn.com/wordpress/wp-content/uploads/2019/12/Mulan-2020-movie-official-poster.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="noticiaEspecifica.jsp" class="btn btn-primary">Detalles</a>
                    </div>
                  </div>  
                </div>
      </div>
      <br>

    </div>  
    
    <section id="footer">
	    <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">         
	    	<p><u><a href="#">CineTicias</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
	    	<p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="#" target="_blank">Sunlimetech</a></p>
	    </div>
	</section>

</body>

</html>