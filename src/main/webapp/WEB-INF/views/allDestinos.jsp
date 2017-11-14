<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>University Enrollments</title>

	<style>
		tr:first-child{
			font-weight: bold;
			background-color: #C6C9C4;
		}
	</style>

</head>


<body>
	<h2>Lista de Destinos</h2>
	<table>
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

			<td><a href="<c:url value='/edit-${destino.idDestino}-destino' />">${destino.provincia}</a></td>
			<td><a href="<c:url value='/delete-${destino.idDestino}-destino' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="<c:url value='/showAdmin' />">Volver a Admin</a>
</body>
</html>