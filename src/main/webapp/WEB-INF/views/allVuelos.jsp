<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Listado Vuelos</title>

	<style>
		tr:first-child{
			font-weight: bold;
			background-color: #C6C9C4;
		}
	</style>

</head>


<body>
	<h2>Lista de Vuelos</h2>
	<table>
		<tr>
            <td>Id</td>
			<td>Costo</td>
            <td>Matricula Avion</td>
			<td>Estado del vuelo</td>
            <td>Pais Origen</td>
            <td>Provincia Origen</td>
			<td>Pais Destino</td>
			<td>Provincia Destino</td>

            <td></td>
		</tr>
		<c:forEach items="${vuelos}" var="vuelo">
			<tr>
            <td> ${vuelo.idVuelo}</td>
            <td> ${vuelo.costoVuelo}</td>
            <td> ${vuelo.avion.matricula}</td>
			<td> ${vuelo.vueloHabilitado}</td>
            <td>${vuelo.ruta.destinoPartida.pais}</td>
            <td>${vuelo.ruta.destinoPartida.provincia}</td>
            <td>${vuelo.ruta.destinoLlegada.pais}</td>
			<td><a href="<c:url value='/edit-${vuelo.idVuelo}-vuelo' />">${vuelo.ruta.destinoLlegada.provincia}</a></td>
			<td><a href="<c:url value='/delete-${vuelo.idVuelo}-vuelo' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="<c:url value='/showAdmin' />">Volver a Admin</a>
</body>
</html>