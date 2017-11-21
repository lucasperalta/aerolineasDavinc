<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <link rel="stylesheet" href="/recursos/css/bootstrap.css">
    <link href="<c:url value="/recursos/css/style.css" />" rel="stylesheet">
</head>
<body>

<div id="contact">
    <div class="container">
        <h1 class="text-center">Menú Admin</h1>
    <nav class="admin">
        <ul>
           <li> <a class="btn btn-default submit" href="<c:url value='/aviones' />">Agregar Avion</a></li>
            <li> <a class="btn btn-default submit" href="<c:url value='/listarAviones' />">Listar Aviones</a></li>
            <li> <a class="btn btn-default submit" href="<c:url value='/destinos' />">Agregar Destinos</a></li>
            <li> <a class="btn btn-default submit" href="<c:url value='/listarDestinos' />">Listar Destinos</a></li>
            <li><a  class="btn btn-default submit" href="<c:url value='/rutas' />">Agregar Ruta</a></li>
            <li> <a  class="btn btn-default submit" href="<c:url value='/listarRutas' />">Listar Rutas</a></li>
            <li><a  class="btn btn-default submit" href="<c:url value='/vuelos' />">Agregar Vuelos</a></li>
            <li> <a class="btn btn-default submit" href="<c:url value='/listarVuelos' />">Listar Vuelos</a></li>

        </ul>


    </nav>
    


    </div>
</div>
</body>
</html>