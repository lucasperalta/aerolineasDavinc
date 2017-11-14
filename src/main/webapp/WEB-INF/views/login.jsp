<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>

    <style>

        .error {
            color: #ff0000;
        }
    </style>

</head>

body>
<div id="contact">
    <div class="container">
        <h2 class="text-center">Login</h2>

        <div class="login">
            <form:form method="POST" action="/login" >
            <table>
                <tr>

                    <td><div class="form-group">
                        <label for="usuario">Usuario: </label> </td>
                    <td><input class="form-control" type="text" name="usuario" id="usuario"/></td>
        </div>

        </tr>

        <tr>
            <td><div class="form-group">
                <label for="Password">Password: </label> </td>
            <td><input class="form-control" type="password" name="password" id="password"/></td>
    </div>
    </tr>




    <tr>
        <td colspan="3">
            <input class="btn btn-default submit sublog" type="submit" value="Entrar"/>

        </td>
    </tr>
    </table>
    </form:form>
</div>
</div>
</div>
</body>
</html>