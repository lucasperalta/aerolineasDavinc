<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty error}">
    Error: ${error}
</c:if>


<c:set var="action" value="/altaRutas" />


<c:if test = "${edit}">
    <c:set var="action" value="/updateRutas" />

</c:if>

<form method="POST" action="${action}">
    <input type="hidden" path="idDestino" id="idDestino"/>

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
    <c:choose>
        <c:when test="${edit}">
            <input type="submit" value="editar"/>
        </c:when>
        <c:otherwise>
            <input type="submit" value="agregar"/>
        </c:otherwise>
    </c:choose>
</form>

Go back to <a href="<c:url value='/showAdmin' />">Volver a admin</a>

</body>
</html>
