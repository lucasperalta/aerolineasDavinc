<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Lista de Aviones</title>

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
		<h2 class="text-center">Lista de Aviones</h2>
		<table class="tball table-bordered text-center">
		<tr>
            <td>Id</td>
            <td>Modelo</td>
            <td>Matricula</td>
            <td>Butacas</td>
            <td>Marca</td>

            <td></td>
		</tr>
		<c:forEach items="${aviones}" var="avion">
			<tr>
            <td> ${avion.idAvion}</td>
			<td>${avion.modelo}</td>
			<td>${avion.matricula}</td>
			<td>${avion.butacas}</td>
			<td><a class="tdboton" href="<c:url value='/edit-${avion.idAvion}-avion' />">${avion.marca}</a></td>
			<td><a class="tdboton" href="<c:url value='/delete-${avion.idAvion}-avion' />">Eliminar</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a class="btn btn-default submit" href="<c:url value='/showAdmin' />">Volver a Admin</a>
	</div>
</div>
</body>
</html>