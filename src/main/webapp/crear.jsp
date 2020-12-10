<%@page import="com.pw.dbconnection.models.NoticiasModel"%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.CategoryModel"%>
<%  String userName = (String) session.getAttribute("name_user");
    List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("Categories");
    String accion = request.getParameter("accion");%>
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
            <% if (accion.equals("crear")) { %>
            <!--Cards-->
            <div class="Destacados container-fluid">
                <form action="CrearNoticia" method="POST" enctype="multipart/form-data" class="" style="padding-top: 20px;">
                    <div class="form-group">
                        <input type="text" name="title" titulo="" tit="" placeholder="Título" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="text" name="description" descripcion="" desc="" placeholder="Descripción" class="form-control">
                    </div> 
                    <div class="form-group">
                        <textarea name="content" name="content" id="description" class="form-control" placeholder="Cuerpo de la Noticia"></textarea>
                    </div>
                    <input type="hidden" name="acc" placeholder="Descripción" class="form-control" value="crear">
                    <div class="form-group">
                        <label for="category">Categoria</label>
                        <select name="category" id="category" class="form-control">
                            <option value="-1">Categoria</option>
                            <%
                                for (CategoryModel category : categories) {
                            %>
                            <option value="<%= category.getIdcategory()%>"><%= category.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group" >
                        <label for="exampleFormControlFile1">Example file input</label>
                        <input type="file" name="image" class="form-control-file" id="exampleFormControlFile1">
                        <input type="file" name="image2" class="form-control-file" id="exampleFormControlFile1">
                        <input type="file" name="image3" class="form-control-file" id="exampleFormControlFile1">
                        <small id="emailHelp" class="form-text text-muted">El tamaño maximo de archivo es 5 Mb</small>
                    </div>
                    <button id="btn-login-id" type="submit" class="btn btn-primary col-3">Create</button>
                </form>
            </div>
            <%} else if (accion.equals("editar")) {%>
            <%  NoticiasModel noticia = (NoticiasModel) request.getAttribute("noticia");%>
            <!--Cards-->
            <div class="Destacados container-fluid">
                <form action="CrearNoticia" method="POST" enctype="multipart/form-data" class="" style="padding-top: 20px;">
                    <div class="form-group">
                        <input type="text" name="title" titulo="" tit="" placeholder="Título" class="form-control" value="<%= noticia.getTitulo()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" name="description" descripcion="" desc="" placeholder="Descripción" class="form-control" value="<%= noticia.getDescripcion()%>">
                    </div> 
                    <div class="form-group">
                        <textarea name="content" name="content" id="description" class="form-control" placeholder="Cuerpo de la Noticia"><%= noticia.getContenido()%></textarea>
                    </div>
                    <input type="hidden" name="acc" placeholder="Descripción" class="form-control" value="editar">
                    <input type="hidden" name="idNot" placeholder="Descripción" class="form-control" value="<%= noticia.getIdnoticia() %>">
                    <div class="form-group">
                        <label for="category">Categoria</label>
                        <select name="category" id="category" class="form-control">
                            <option value="-1">Categoria</option>
                            <%
                                for (CategoryModel category : categories) {
                                    if (noticia.getCategoria() == category.getIdcategory()) {
                            %>
                            <option selected="selected" value="<%= category.getIdcategory()%>"><%= category.getName()%></option>
                            <%} else {%>
                            <option value="<%= category.getIdcategory()%>"><%= category.getName()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <button id="btn-login-id" type="submit" class="btn btn-primary col-3">Editar</button>
                </form>
            </div>
            <%}%>
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
