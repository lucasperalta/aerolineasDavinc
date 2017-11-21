<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Rutas</title>
    <link rel="stylesheet" href="/recursos/css/bootstrap.css">
    <link href="<c:url value="/recursos/css/style.css" />" rel="stylesheet">
</head>
<body>
<div id="contact">
    <div class="container">
        <h1 class="text-center title">Rutas</h1>
<c:if test="${not empty error}">
    Error: ${error}
</c:if>


<c:set var="action" value="/altaRutas" />


<c:if test = "${edit}">
    <c:set var="action" value="/updateRutas" />

</c:if>

<form method="POST" action="${action}">
    <input type="hidden" path="idDestino" id="idDestino"/>
    <div class="form-group">
<label for="origen">Origen</label>
<select name="origen" id="origen" class=field>
    <option value="0">Seleccione Origen</option>

    <c:forEach items="${destinos}" var="destino">
        <c:choose>
        <c:when test="${destinosOrigenSelectId==destino.idDestino}">
            <option selected value="${destino.idDestino}">${destino.pais}-${destino.provincia}</option>
        </c:when>
        <c:otherwise>
            <option value="${destino.idDestino}">${destino.pais}-${destino.provincia}</option>
        </c:otherwise>
    </c:choose>
</c:forEach>
</select>
    </div>


    <div class="form-group">
<label for="destino">Destino</label>
<select name="destino" id="destino" class=field>
    <option value="0">Seleccione Destino</option>

    <c:forEach items="${destinos}" var="destino">
        <c:choose>
            <c:when test="${destinosLlegadaSelectId==destino.idDestino}">
                <option selected value="${destino.idDestino}">${destino.pais}-${destino.provincia}</option>
            </c:when>
            <c:otherwise>
                <option value="${destino.idDestino}">${destino.pais}-${destino.provincia}</option>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</select>
    </div>
    <table class="tballdes">
        <tr>
    <td colspan="3">
        <c:choose>
        <c:when test="${edit}">
            <input class="btn btn-default submit boton"  type="submit" value="Editar"/>
        </c:when>
    </td>
    <td>
        <c:otherwise>
            <input class="btn btn-default submit boton"  type="submit" value="Agregar"/>
        </c:otherwise>
        </c:choose>
    </td>
    </tr>
    </table>
</form>

<a class="btn btn-default submit" href="<c:url value='/showAdmin' />">Volver a Admin</a>

</body>
</html>
