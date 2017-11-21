<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Listado Rutas</title>

	<style>
		tr:first-child{
			font-weight: bold;
			background-color: #C6C9C4;
		}
	</style>
	<link rel="stylesheet" href="/recursos/css/bootstrap.css">
	<link href="<c:url value="/recursos/css/style.css" />" rel="stylesheet">
</head>


<body>
<div id="contact">
	<div class="container">
		<h2 class="text-center">Lista de Rutas</h2>
	<table class="tballrut table-bordered text-center">
		<tr>
            <td>Id</td>
            <td>Pais Origen</td>
            <td>Provincia Origen</td>
			<td>Pais Destino</td>
			<td>Provincia Destino</td>
            <td></td>
		</tr>
		<c:forEach items="${rutas}" var="ruta">
			<tr>
            <td> ${ruta.idRuta}</td>
			<td>${ruta.destinoPartida.pais}</td>
            <td>${ruta.destinoPartida.provincia}</td>
            <td>${ruta.destinoLlegada.pais}</td>
			<td><a class="tdboton" href="<c:url value='/edit-${ruta.idRuta}-ruta' />">${ruta.destinoLlegada.provincia}</a></td>
			<td><a class="tdboton" href="<c:url value='/delete-${ruta.idRuta}-ruta' />">Eliminar</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a class="btn btn-default submit" href="<c:url value='/showAdmin' />">Volver a Admin</a>
	</div>
</div>
</body>
</html>