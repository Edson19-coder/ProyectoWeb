<%@page import="com.pw.dbconnection.models.NoticiasModel"%>
<%@page import="com.pw.dbconnection.models.MediaModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%  String userName = (String) session.getAttribute("name_user"); 
    Integer idUser = (Integer) session.getAttribute("id_user");
    String tipo_user = (String) session.getAttribute("tipo_user");
    List<NoticiasModel> noticias = (List<NoticiasModel>) request.getAttribute("noticias");
    List<MediaModel> media = (List<MediaModel>) request.getAttribute("media");
    %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TG-GAMER</title>
    <link rel="icon" href="assets/Recursos/logomain.png">
    <link rel="stylesheet" href="assets/css/index.css">
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
        <a class="navbar-brand" href="Home">
            <img src="assets/Recursos/logomain.png" width="30" height="30" class="d-inline-block align-top" alt="">
            TG-GAMER
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
       
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
          <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>

              <% if(userName != null){ %>
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%= userName %>
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="MiPerfil?idUser=<%= idUser %>">Perfil</a>
                    <%if(tipo_user.equals("Administrador") || tipo_user.equals("Editor")){%>
                    <a class="dropdown-item" href="Edicion">Edicion</a>
                    <%}%>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="Configuracion">Configuracion</a>
                    <div class="dropdown-divider"></div>
                    <%if(tipo_user.equals("Administrador") || tipo_user.equals("Creador de Contenido")){%>
                    <a class="dropdown-item" href="CrearNoticia?accion=crear">Crear noticia</a>
                    <a class="dropdown-item" href="MisNoticias">Mis noticias</a>
                    <%}%>
                  </div>
              </li>  
              <%}%>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <% if(userName == null){ %>
                <form id="EstaONo" class="form-inline my-2 my-lg-0" style="padding-left: 50px; padding-right: 10px;">
                    <a href="LogInController" class="btn btn-outline-success my-2 my-sm-0" >Login/Registrar</a>
                </form>
            <%}else{%>
            <form id="EstaONo" class="form-inline my-2 my-lg-0" style="padding-left: 50px; padding-right: 10px;">
                    <a href="LogOffController" class="btn btn-outline-success my-2 my-sm-0" >Salir</a>
            </form>
            <%}%>
            <img id="imagenUser" src="http://cdn.onlinewebfonts.com/svg/img_506739.png" alt="ImagenPerfil" width="50" height="30" style="padding-left: 10px; padding-right: 10px;">
            <a id="NombreUser">Username</a>
            
            <form id="LogOFF" action="logOffController" class="form-inline my-2 my-lg-0" style="padding-left: 20px; padding-right: 10px;">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log Out</button>
            </form>

        </div>
    </nav>
    <br>
    <div class="container" style="padding-bottom:20px;">
      <!--Carrusel-->
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                  <img class="d-block w-100" src="https://na.finalfantasyxvi.com/assets/images/na/common/pageTransitionObjType01/character_pc.jpg" alt="First slide">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Nuevo Final Fantasy saldra para PS5</h5>
                    <a id="aCarrusel" href="noticiaEspecifica.jsp">El CEO de Square confirmo que Final Fantasy saldra para PS5</a>
                  </div>        
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="https://media.vandal.net/i/1706x960/82244/halo-infinite-202072216173826_1.jpg" alt="Second slide">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Hola Infinito</h5>
                    <a id="aCarrusel" href="noticiaEspecifica.jsp">Halo Infinite saldra para XBOX Series X</a>
                  </div>      
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="https://media.comicbook.com/2020/09/attack-on-titan-1237922.jpeg" alt="Third slide">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Shingeki No Kyojin</h5>
                    <a id="aCarrusel" href="noticiaEspecifica.jsp">Nueva temporada se acerca</a>
                  </div>      
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
      </div> 
      <br>
      <!--Cards-->
      <div class="Destacados container-fluid">
          
            <div class="row row-cols-1 row-cols-md-3">
                
                <% if(noticias != null){
                    for(NoticiasModel noticia : noticias){
                        if(noticia.getStatus() == 2 ){%>
                <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                    <%for(MediaModel m : media){ 
                        if(m.getMediNoticia() == noticia.getIdnoticia()){%>
                    <img class="card-img-top" src="<%= m.getMediaUrl() %>" alt="Card image cap">
                    <%}}%>
                  <div class="card-body">
                    <h5 class="card-title"><%= noticia.getTitulo() %></h5>
                    <p class="card-text"><%= noticia.getDescripcion() %></p>
                    <a href="VerNoticia?idNoticia=<%= noticia.getIdnoticia() %>" class="btn btn-primary">Detalles</a>
                  </div>
                </div>   
                <%}}}%>
                
            </div>
      </div>
    </div>  
    
    
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <style>
      .fa {
        padding: 20px;
        font-size: 30px;
        width: 50px;
        text-align: center;
        text-decoration: none;
        margin: 5px 2px;
      }
      
      .fa:hover {
          opacity: 0.7;
      }
      

      
      </style>
      </head>
      <body>
      
          <h2><span class="badge badge-secondary">Siguenos!</span></h2>
      
      <!-- Add font awesome icons -->
      <a href="https://www.facebook.com/" class="fa fa-facebook"></a>
      <a href="https://twitter.com/" class="fa fa-twitter"></a>
      <a href="https://www.youtube.com/" class="fa fa-youtube"></a>
      <a href="https://www.instagram.com/" class="fa fa-instagram"></a>
          <br>
          <br>

    </form>
</body>
    
    <section id="footer">
	    <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">         
	    	<p><u><a href="#">TG-GAMER</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
	    	<p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="#" target="_blank">Sunlimetech</a></p>
	    </div>
	</section>

</body>

</html>