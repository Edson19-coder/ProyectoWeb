<%-- 
    Document   : index
    Created on : 4/10/2020, 02:00:58 PM
    Author     : magoc
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/main.css"/>
    </head>
    <body>
        <h1>Registrarse!</h1>
        <!--En action ira la ruta del Controller-->
        <!--En este caso enviaremos un archivo no se les olvide el enctype-->
        <form action="./UsersController" method="POST" enctype="multipart/form-data">
            <label for="name">Nombre</label>  
            <input type="text" name="name" id="name" />
            <label for="password">Contraseña</label>
            <input type="password" name="password" id="password" />
            <label for="image">Perfil</label>
            <input type="file" name="image" id="image" />
            <input type="submit" value="Registrarse" />
        </form>
        <ol>
            <c:forEach var ="user" items="${users}">
                <li>
                    ${user.userName}
                    <br>
                    ${user.password}
                    <br>
                    ${user.urlImage}
                    <br>
                    <img src="${user.urlImage}"/>
                </li>
                                
            </c:forEach>
        </ol>
    </body>
</html>
