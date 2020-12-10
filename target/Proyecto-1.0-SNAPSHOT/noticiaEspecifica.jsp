<%@page import="com.pw.dbconnection.models.FavoritoModel"%>
<%@page import="com.pw.dbconnection.models.ComentarioModel"%>
<%@page import="com.pw.dbconnection.models.CategoryModel"%>
<%@page import="com.pw.dbconnection.models.MediaModel"%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.NoticiasModel"%>
<%  String userName = (String) session.getAttribute("name_user");
    Integer idUser = (Integer) session.getAttribute("id_user");
    String tipo_user = (String) session.getAttribute("tipo_user");
    NoticiasModel noticia = (NoticiasModel) request.getAttribute("noticia");
    List<MediaModel> media = (List<MediaModel>) request.getAttribute("media");
    CategoryModel categoria = (CategoryModel) request.getAttribute("categoria");
    List<ComentarioModel> comments = (List<ComentarioModel>) request.getAttribute("comentarios");
    List<ComentarioModel> answers = (List<ComentarioModel>) request.getAttribute("respuestas");%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TG-GAMER [Articulo]</title>
        <link rel="icon" href="assets/Recursos/Logo.jpg">
        <link rel="stylesheet" href="assets/css/noticiaEspecifica.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/comentarios.css">
    </head>

    <body>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v8.0&appId=3496486320412131&autoLogAppEvents=1" nonce="WNPCBicN"></script>
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
            <h1 style="text-align: center;"><%= noticia.getTitulo()%></h1>
            <hr class="my-4">
            <div class="row">
                <div class="col-10">
                    <h4><%= categoria.getName()%></h4>
                    <p><%= noticia.getDescripcion()%></p>
                </div>
                <div class="text-right col-2">
                    <% if (idUser != null) {
                            FavoritoModel isFav = (FavoritoModel) request.getAttribute("isFav");
                            if (isFav != null) {%>
                    <a href="Favorito?idFav=<%= isFav.getIdfavorito()%>&not=<%= noticia.getIdnoticia()%>&acc=delete" class="">
                        <i class='fas fa-save' style='font-size:24px'></i>
                    </a>
                    <%} else {%>
                    <a href="Favorito?not=<%= noticia.getIdnoticia()%>&acc=add" class="">
                        <i class='far fa-save' style='font-size:24px'></i>
                    </a>
                    <%}
                        }%>
                </div>
            </div>
            <hr class="my-4">
            <!--------------------------------------------------------- CAROUSEL --------------------------------------------------------->
            <div id="carouselCaptionid" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselCaptionid" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselCaptionid" data-slide-to="1"></li>
                    <li data-target="#carouselCaptionid" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <%
                        int i = 0;
                        for (MediaModel m : media) {
                            if (i == 0) {
                                i++;
                    %>
                    <div class="carousel-item active">
                        <img src="<%= m.getMediaUrl()%>"
                             class="d-block w-100" alt="...">
                    </div>
                    <%} else {%>
                    <div class="carousel-item">
                        <img src="<%= m.getMediaUrl()%>"
                             class="d-block w-100" alt="...">
                    </div>
                    <%}
                        }%>
                </div>
                <a class="carousel-control-prev" href="#carouselCaptionid" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselCaptionid" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br>
            <!--Noticia en si-->
            <section>
                <p><%= noticia.getContenido()%></p>
            </section>

            <!-- Comentarios Principal -->
            <div class="comments-container">
                <h1>Comentarios</h1>

                <% if (comments != null) {
                        for (ComentarioModel comentario : comments) {%>
                <ul id="comments-list" class="comments-list">
                    <li>

                        <form method="POST" action="Comentario">
                            <div class="comment-main-level">
                                <!-- Avatar -->
                                <% String pic = comentario.getUsuario().getFoto();
                                    if (pic != null) {%>
                                <div class="comment-avatar"><img src="<%= pic%>" alt=""></div>
                                    <%} else {%>
                                <div class="comment-avatar"><img src="https://www.softzone.es/app/uploads/2018/04/guest.png" alt=""></div>    
                                    <%}%>
                                <!-- Contenedor del Comentario -->
                                <div class="comment-box">
                                    <div class="comment-head">
                                        <h6 class="comment-name by-author"><a href="MiPerfil?idUser=<%= comentario.getUsuario().getId()%>"><%= comentario.getUsuario().getUsername()%></a></h6>
                                        <span><%= comentario.getFecha()%></span> 
                                        <% if (tipo_user.equals("Moderador") || tipo_user.equals("Administrador")) {%>
                                        <div class="boton-corazon text-right">
                                            <a href="Comentario?comid=<%= comentario.getIdcomentarios()%>&acc=deleteCom&not=<%= comentario.getIdNoticia()%>"> 
                                                <i class='far fa-trash-alt' style='font-size:24px'></i>
                                            </a>
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="comment-content"><%= comentario.getContenido()%></div>
                                </div>
                            </div>
                        </form>
                        <!-- Respuestas de los comentarios -->
                        <%for (ComentarioModel answer : answers) {
                                if (answers != null && answer.getIdComentario() == comentario.getIdcomentarios()) {%>
                        <ul class="comments-list reply-list">
                            <li>
                                <!-- Avatar -->
                                <% String pic2 = answer.getUsuario().getFoto();
                                    if (pic2 != null) {%>
                                <div class="comment-avatar"><img src="<%= pic2%>" alt=""></div>
                                    <%} else {%>
                                <div class="comment-avatar"><img src="https://www.softzone.es/app/uploads/2018/04/guest.png" alt=""></div>    
                                    <%}%>
                                <!-- Contenedor del Comentario -->
                                <div class="comment-box">
                                    <div class="comment-head">
                                        <h6 class="comment-name"><a href="Porfile?user=<%= answer.getUsuario().getId()%>"><%= answer.getUsuario().getUsername()%></a></h6>
                                        <span><%=answer.getFecha()%>   </span>
                                        <% if (tipo_user.equals("Moderador") || tipo_user.equals("Administrador")) {%>
                                        <div class="boton text-right">
                                            <a href="Comentario?ansid=<%= answer.getIdcomentarios()%>&acc=deleteAns&not=<%= answer.getIdNoticia()%>" class="">
                                                <i class='far fa-trash-alt' style='font-size:24px'></i>
                                            </a>
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="comment-content"><%=answer.getContenido()%></div>
                                </div>
                            </li>
                        </ul>
                        <%}
                            }%>
                    </li>
                    <form method="POST" action="Comentario">
                        <div class="form-group comment-box" style="margin-top: -30px" >
                            <textarea name="content" id="description" class="form-control" style="margin-top: 5px;" ></textarea>
                            <div class="text-right">
                                <input type="hidden" name="not" value="<%= noticia.getIdnoticia()%>">
                                <input type="hidden" name="comentario" value="<%= comentario.getIdcomentarios()%>">
                                <input type="hidden" name="acc" value="responder">
                                <button id="btn-comment" type="submit" class="btn btn-primary" name="accion" value="Responder" style="margin-top: 5px;">Responder</button>
                            </div>
                        </div>
                    </form>
                </ul> 
                <%}
                    }%>

                <form method="POST" action="Comentario">
                    <div class="form-group">
                        <textarea name="content" id="description" class="form-control" style="margin-top: 5px;"></textarea>
                        <div class="text-right">
                            <input type="hidden" name="not" value="<%= noticia.getIdnoticia()%>">
                            <input type="hidden" name="acc" value="comentar">
                            <button id="btn-comment" type="submit" class="btn btn-primary" name="accion" value="Comentar" style="margin-top: 5px;">Comentar</button>
                        </div>
                    </div>
                </form>
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