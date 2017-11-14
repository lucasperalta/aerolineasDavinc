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

</head>


<body>
	<h2>Lista de Rutas</h2>
	<table>
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
			<td><a href="<c:url value='/edit-${ruta.idRuta}-ruta' />">${ruta.destinoLlegada.provincia}</a></td>
			<td><a href="<c:url value='/delete-${ruta.idRuta}-ruta' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="<c:url value='/showAdmin' />">Volver a Admin</a>
</body>
</html>