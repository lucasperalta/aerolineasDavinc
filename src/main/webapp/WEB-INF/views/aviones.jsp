<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Aviones</title>
    <link rel="stylesheet" href="/recursos/css/bootstrap.css">
    <link href="<c:url value="/recursos/css/style.css" />" rel="stylesheet">
<style>

	.error {
		color: #ff0000;
	}
</style>

</head>

<body>
<div id="contact">
	<div class="container">

	<h2> Aviones</h2>
    <c:set var="action" value="/altaAviones" />


	     <c:if test = "${edit}">
             <c:set var="action" value="/updateAviones" />

		 </c:if>
	<form:form method="POST" modelAttribute="aviones" >

		<form:input type="hidden" path="idAvion" id="idAvion"/>
		<table>
			<tr>
				<div class="form-group">
				<td><label for="marca">Marca: </label> </td>
				<td><form:input path="marca" id="marca"/></td>
				<td><form:errors path="marca" cssClass="error"/></td>
				</div>
		    </tr>
	    
			<tr>
				<div class="form-group">
				<td><label for="modelo">Modelo: </label> </td>
				<td><form:input path="modelo" id="modelo"/></td>
				<td><form:errors path="modelo" cssClass="error"/></td>
				</div>
		    </tr>
	
			<tr>
				<div class="form-group">
					<td><label for="matricula">Matricula: </label> </td>
					<td><form:input path="matricula" id="matricula"/></td>
					<td><form:errors path="matricula" cssClass="error"/></td>
				</div>
		    </tr>

			<tr>
				<td colspan="3">
					<c:choose>
						<c:when test="${edit}">
							<input class="btn btn-default submit" type="submit" value="Editar"/>
						</c:when>
				</td>
				<td>
						<c:otherwise>
							<input class="btn btn-default submit" type="submit" value="Agregar"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</form:form>
	<br/>
	<br/>
	<a class="btn btn-default submit" href="<c:url value='/showAdmin' />">Volver a admin</a>
	</div>
</div>
</body>
</html>