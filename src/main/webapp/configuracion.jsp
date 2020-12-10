<%@page import="com.pw.dbconnection.models.NoticiasModel"%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.CategoryModel"%>
<%  String userName = (String) session.getAttribute("name_user");
    String email = (String) session.getAttribute("correo_user");
    String pass = (String) session.getAttribute("password_user");
    String pathPhoto = (String) session.getAttribute("foto_user");
    String facebook = (String) session.getAttribute("facebook_user");
    String twitter = (String) session.getAttribute("twitter_user");
    String descripcion = (String) session.getAttribute("descripcion_user");%>
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
            $(document).ready(function ()
            {

                var prueba = <%= session.getAttribute("id")%>;
                var prueba2 = "<%= session.getAttribute("username")%>";
                var prueba3 = "<%= session.getAttribute("foto")%>";


                if (prueba !== null)
                {
                    alert(prueba);
                    $("#EstaONo").remove();
                    $("#imagenUser").src = prueba3;
                    $("#NombreUser").value = prueba2;



                } else {
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
                            <a class="dropdown-item" href="crear.jsp">Crear noticia</a>
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
            <div class="user-image text-center">
                <%if (pathPhoto != null) {%>
                <a class="user-img">
                    <img class="imgOrbed" src="<%= pathPhoto%>" alt="" >
                </a>
                <%} else {%>
                <a class="user-img">
                    <img class="imgOrbed" src="https://www.softzone.es/app/uploads/2018/04/guest.png" alt="" >
                </a>
                <%}%>
            </div>

            <form action="Configuracion" method="POST" enctype="multipart/form-data">
                <input type="file" name="image" class="form-control-file" id="exampleFormControlFile1">
                <small id="emailHelp" class="form-text text-muted text-center" >El tamaño maximo de archivo es 5 Mb</small>
                <div class="form-group">
                    <label for="user-name-id">User name</label>
                    <input name="userName" type="text" class="form-control" id="user-name-id" value="<%=userName%>">
                </div>
                <div class="form-group">
                    <label for="user-email-id">Email address</label>
                    <input name="userEmail" type="email" class="form-control" id="user-email-id" aria-describedby="emailHelp" value="<%=email%>">
                </div>
                <div class="form-group">
                    <label for="user-pass-id">Password</label>
                    <input name="userPass" type="password" class="form-control" id="user-pass-id" value="<%=pass%>">
                </div>
                <%if (facebook != null) {%>
                <div class="form-group">
                    <label for="user-facebook-id">Facebook</label>
                    <input name="userFace" type="text" class="form-control" id="user-facebook-id" value="<%=facebook%>">
                </div>
                <%} else {%>
                <div class="form-group">
                    <label for="user-facebook-id">Facebook</label>
                    <input name="userFace" type="text" class="form-control" id="user-facebook-id" placeholder="URL de tu perfil de Facebook" >
                </div>
                <%}%>
                <%if (twitter != null) {%>
                <div class="form-group">
                    <label for="user-instagram-id">Instagram</label>
                    <input name="userTwitter" type="text" class="form-control" id="user-instagram-id" value="<%=twitter%>">
                </div>
                <%} else {%>
                <div class="form-group">
                    <label for="user-instagram-id">Facebook</label>
                    <input name="userTwitter" type="text" class="form-control" id="user-instagram-id" placeholder="URL de tu perfil de Instagram" >
                </div>
                <%}%>
                <%if (descripcion != null) {%>
                <div class="form-group">
                    <label for="user-sobremi-id">Sobre mi</label>
                    <textarea name="content" name="content" id="user-sobremi-id" class="form-control" ><%=descripcion%></textarea>
                </div>
                <%} else {%>
                <div class="form-group">
                    <label for="user-sobremi-id">Sobre mi</label>
                    <textarea name="content" name="content" id="user-sobremi-id" class="form-control" placeholder="Sobre mi..."></textarea>
                </div>
                <%}%>
                <button type="submit" class="btn btn-primary" >Guardar</button>
            </form>
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

</body>

<section id="footer">
    <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">         
        <p><u><a href="#">TG-GAMER</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
        <p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="#" target="_blank">Sunlimetech</a></p>
    </div>
</section>

</body>

</html>
