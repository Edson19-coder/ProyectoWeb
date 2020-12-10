<%@page import="com.pw.dbconnection.models.NoticiasModel"%>
<%@page import="com.pw.dbconnection.models.MediaModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%  String userName = (String) session.getAttribute("name_user");
    List<NoticiasModel> noticias = (List<NoticiasModel>) request.getAttribute("noticias");
    List<MediaModel> media = (List<MediaModel>) request.getAttribute("media");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TG-GAMER [Edicion]</title>
        <link rel="icon" href="assets/Recursos/Logo.jpg">
        <link rel="stylesheet" href="assets/css/edicion.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

                    <% if (userName != null) {%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= userName%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="perfil.jsp">Perfil</a>
                            <a class="dropdown-item" href="edicion.jsp">Edicion</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Configuracion</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="CrearNoticia">Crear noticia</a>
                        </div>
                    </li>  
                    <%}%>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <% if (userName == null) { %>
                <form id="EstaONo" class="form-inline my-2 my-lg-0" style="padding-left: 50px; padding-right: 10px;">
                    <a href="LogInController" class="btn btn-outline-success my-2 my-sm-0" >Login/Registrar</a>
                </form>
                <%} else {%>
                <img id="imagenUser" src="http://cdn.onlinewebfonts.com/svg/img_506739.png" alt="ImagenPerfil" width="50" height="30" style="padding-left: 10px; padding-right: 10px;">
                <a id="NombreUser">Username</a>
                <form id="LogOFF" action="logOffController" class="form-inline my-2 my-lg-0" style="padding-left: 20px; padding-right: 10px;">
                    <a href="LogOffController" class="btn btn-outline-success my-2 my-sm-0" >Salir</a>
                </form>
                <%}%>

            </div>
        </nav>

        <br>
        <div class="container">
            <div class="jumbotron">
                <h4>Mis Noticias</h4>
                <hr class="my-4">
                <div class="row row-cols-1 row-cols-md-3">

                    <% if (noticias != null) {
                            for (NoticiasModel noticia : noticias) {
                                for (MediaModel m : media) {%>
                    <div class="card col-12 col-sm-6 col-md-4" style="width: 18rem;">
                        <img class="card-img-top" src="<%= m.getMediaUrl()%>" alt="Card image cap" style="padding-top: 10px;" >
                        <div class="card-body">
                            <h5 class="card-title"><%= noticia.getTitulo()%></h5>
                            <p class="card-text"><%= noticia.getDescripcion()%></p>
                            <% if (noticia.getMotivo() != null) {%>
                            <h8 class="card-title" style="color: red;">Motivo</h8>
                            <p class="card-text"><%= noticia.getMotivo()%></p>
                            <div class="d-flex justify-content-around">
                                <a id="aceptar" href="CrearNoticia?accion=editar&idNoticia=<%= noticia.getIdnoticia() %>" class="btn btn-success">Editar</a>
                            </div>
                            <%} else {%>
                            <p class="card-text"></p>
                            <%}%>
                        </div>
                    </div>  
                    <%}
                            }
                        }
                    %>
                </div>
            </div>
        </div>  

    </body>

</html>
