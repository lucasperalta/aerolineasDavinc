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
	<h2>List of Employees</h2>	
	<table>
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
			<td><a href="<c:url value='/edit-${avion.idAvion}-avion' />">${avion.marca}</a></td>
			<td><a href="<c:url value='/delete-${avion.idAvion}-avion' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="<c:url value='/showAdmin' />">Volver a Admin</a>
</body>
</html>