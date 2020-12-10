<%@page import="com.pw.dbconnection.models.MediaModel"%>
<%@page import="com.pw.dbconnection.models.FavoritoModel"%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.User"%>
<%  String userName = (String) session.getAttribute("name_user");
    User usuario = (User) request.getAttribute("usuario");
    List<FavoritoModel> fav = (List<FavoritoModel>) request.getAttribute("fav"); 
    List<MediaModel> media = (List<MediaModel>) request.getAttribute("media");%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CineTicias [Perfil]</title>
    <link rel="icon" href="assets/Recursos/Logo.jpg">
    <link rel="stylesheet" href="assets/css/perfil.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
      $(document).ready(function() 
      {
         
          var prueba = <%= session.getAttribute("id")%>;
          var prueba2 = "<%= session.getAttribute("username")%>";
          var prueba3 = "<%= session.getAttribute("foto")%>";

          
          if(prueba !== null)
          {
            alert("adrian chikito");  
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
              <li class="nav-item">
                <a class="nav-link" href="noticias.jsp">Noticia</a>
              </li>

              <% if(userName != null){ %>
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%= userName %>
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="MiPerfil">Perfil</a>
                    <a class="dropdown-item" href="Edicion">Edicion</a>
                    <a class="dropdown-item" href="MisNoticias">Mis noticias</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="Configuracion">Configuracion</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="CrearNoticia?accion=crear">Crear noticia</a>
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
    <div class="container">
        <div class="jumbotron">
            <h1 class="display-5">Mi Perfil</h1>
            <div class="container d-flex align-items-center">
                <div class="image-cropper">
                <% if(usuario.getFoto()!= null && !usuario.getFoto().equals("")){ %>
                <img src="<%= usuario.getFoto() %>" alt="avatar" class="profile-pic">
                <%}else{%>
                <img src="https://www.softzone.es/app/uploads/2018/04/guest.png" alt="avatar" class="profile-pic">
                <%}%>
                    <img src="https://www.dmarge.com/wp-content/uploads/2015/07/Daniel-Craig-Style-2-of-23.jpg" alt="avatar" class="profile-pic">
                </div>
                <section id="nombre">
                    <p class="lead"><%= usuario.getUsername() %></p>
                    <p class="lead"><%= usuario.getDescripcion() %></p>
                </section>
                
            </div> 
                <% if( usuario.getFacebook()!= null && !usuario.getFacebook().equals("")){ %>
                <a href="<%= usuario.getFacebook() %>" class="fa fa-facebook"></a>
                <%}%>
                <a href="<%= usuario.getTwitter() %>" class="fa fa-twitter"></a>
        </div>
        <div class="jumbotron">
            <h4>Favoritos</h4>
            <hr class="my-4">
            <% if(fav!=null){
                for(FavoritoModel favorito : fav){ %>
            <div class="d-flex align-items-center">
                 <%for(MediaModel m : media){ 
                        if(m.getMediNoticia() == favorito.getNoticia().getIdnoticia()){%>
                        <img id="imagenoticia" class="card-img-top" src="<%= m.getMediaUrl() %>" alt="Card image cap">
                <%}}%>
                <section style="padding-left: 1%;">
                    <h6><%= favorito.getNoticia().getTitulo() %></h6>
                    <hr class="my-4">
                    <p><%= favorito.getNoticia().getDescripcion() %></p>
                    <a href="VerNoticia?idNoticia=<%= favorito.getNoticia().getIdnoticia() %>">Ver</a>      
                </section>
            </div>
            <br>
            <%}}%>

        </div>


    </div>  
  
    <section id="footer">
	    <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">         
	    	<p><u><a href="#">TG-GAMER</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
	    	<p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="#" target="_blank">Sunlimetech</a></p>
	    </div>
	</section>

</body>

</html>