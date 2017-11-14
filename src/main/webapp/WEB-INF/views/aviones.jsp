<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Aviones</title>

<style>

	.error {
		color: #ff0000;
	}
</style>

</head>

<body>

	<h2> Aviones</h2>
    <c:set var="action" value="/altaAviones" />


	     <c:if test = "${edit}">
             <c:set var="action" value="/updateAviones" />

		 </c:if>
	<form:form method="POST" modelAttribute="aviones" action="${action}">

		<form:input type="hidden" path="idAvion" id="idAvion"/>
		<table>
			<tr>
				<td><label for="marca">marca: </label> </td>
				<td><form:input path="marca" id="marca"/></td>
				<td><form:errors path="marca" cssClass="error"/></td>
		    </tr>
	    
			<tr>
				<td><label for="modelo">modelo: </label> </td>
				<td><form:input path="modelo" id="modelo"/></td>
				<td><form:errors path="modelo" cssClass="error"/></td>
		    </tr>
	
			<tr>
				<td><label for="matricula">matricula: </label> </td>
				<td><form:input path="matricula" id="matricula"/></td>
				<td><form:errors path="matricula" cssClass="error"/></td>
		    </tr>

			<tr>
				<td><label for="butacas">cantidad butacas: </label> </td>
				<td><form:input path="butacas" id="butacas"/></td>
				<td><form:errors path="butacas" cssClass="error"/></td>
			</tr>

			<tr>
				<td colspan="3">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="editar"/>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Agregar"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</form:form>
	<br/>
	<br/>
	Go back to <a href="<c:url value='/showAdmin' />">Volver a admin</a>
</body>
</html>