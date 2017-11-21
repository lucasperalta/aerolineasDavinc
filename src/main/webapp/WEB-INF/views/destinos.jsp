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
<div id="contact">
	<div class="container">
		<h2 class="text-center">Destinos</h2>
		<div class="login">
    <c:set var="action" value="/altaDestino" />

	<c:if test = "${edit}">
		<c:set var="action" value="/updateDestino" />

	</c:if>
	<form:form method="POST" modelAttribute="destinos" action="${action}">
		<form:input type="hidden" path="idDestino" id="idDestino"/>
		<table>
			<tr>
				<div class="form-group">
				<td><label for="pais">Pais: </label> </td>
				<td><form:input path="pais" id="pais"/></td>
				<td><form:errors path="pais" cssClass="error"/></td>
				</div>
		    </tr>
	    
			<tr>
				<div class="form-group">
				<td><label for="provincia">Provincia: </label> </td>
				<td><form:input path="provincia" id="provincia"/></td>
				<td><form:errors path="provincia" cssClass="error"/></td>
				</div>
		    </tr>
	


			<tr>
				<td colspan="3">
					<c:choose>
						<c:when test="${edit}">
							<input class="btn btn-default submit" type="submit" value="editar"/>
						</c:when>
				</td>
				<td>
						<c:otherwise>
							<input class="btn btn-default submit" type="submit" value="agregar"/>
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
	</div>
</body>
</html>