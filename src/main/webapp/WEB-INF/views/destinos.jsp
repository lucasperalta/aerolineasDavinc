<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Destinos</title>

<style>

	.error {
		color: #ff0000;
	}
</style>

</head>

<body>

	<h2>Destinos</h2>
    <c:set var="action" value="/altaDestino" />

	<c:if test = "${edit}">
		<c:set var="action" value="/updateDestino" />

	</c:if>
	<form:form method="POST" modelAttribute="destinos" action="${action}">
		<form:input type="hidden" path="idDestino" id="idDestino"/>
		<table>
			<tr>
				<td><label for="pais">pais: </label> </td>
				<td><form:input path="pais" id="pais"/></td>
				<td><form:errors path="pais" cssClass="error"/></td>
		    </tr>
	    
			<tr>
				<td><label for="provincia">provincia: </label> </td>
				<td><form:input path="provincia" id="provincia"/></td>
				<td><form:errors path="provincia" cssClass="error"/></td>
		    </tr>
	


			<tr>
				<td colspan="3">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="editar"/>
						</c:when>
						<c:otherwise>
							<input type="submit" value="agregar"/>
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