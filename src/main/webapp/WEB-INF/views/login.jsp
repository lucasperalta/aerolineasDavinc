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

<body>

<h2>Registration Form</h2>

<form:form method="POST" action="/login" >
    <table>
        <tr>
            <td><label for="usuario">Usuario: </label> </td>
            <td><input type="text" name="usuario" id="usuario"/></td>
        </tr>

        <tr>
            <td><label for="Password">Password: </label> </td>
            <td><input type="password" name="password" id="password"/></td>
        </tr>




        <tr>
            <td colspan="3">
                <input type="submit" value="submit"/>

            </td>
        </tr>
    </table>
</form:form>

</body>
</html>