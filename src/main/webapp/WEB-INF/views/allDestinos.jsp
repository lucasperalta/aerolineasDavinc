<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Lista de Destinos</title>

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
		<h2 class="text-center">Lista de Destinos</h2>
	<table class="tballdes table-bordered text-center">
		<tr>
            <td>Id</td>
            <td>Pais</td>
            <td>Provincia</td>
            <td></td>
		</tr>
		<c:forEach items="${destinos}" var="destino">
			<tr>
            <td> ${destino.idDestino}</td>
			<td>${destino.pais}</td>

			<td><a class="tdboton" href="<c:url value='/edit-${destino.idDestino}-destino' />">${destino.provincia}</a></td>
			<td><a class="tdboton" href="<c:url value='/delete-${destino.idDestino}-destino' />">Eliminar</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a class="btn btn-default submit" href="<c:url value='/showAdmin' />">Volver a Admin</a>
	</div>
</div>
</body>
</html>