<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
</head>
<body>
    
    <nav>
        <ul>
           <li> <a href="<c:url value='/aviones' />">Agregar Avion</a></li>
            <li> <a href="<c:url value='/destinos' />">Destinos</a></li>
            <li><a href="<c:url value='/rutas' />">Nueva Ruta</a></li>
            <li><a href="<c:url value='/vuelos' />">Agregar Vuelos</a></li>
        </ul>
    </nav>
    

</body>
</html>