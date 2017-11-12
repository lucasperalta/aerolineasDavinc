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
<form method="POST"  action="/altaRutas">
    <input type="hidden" path="idDestino" id="idDestino"/>

<label for="origen">Origen</label>
<select name="origen" id="origen" class=field>
    <option value="0">Seleccione Origen</option>

    <c:forEach items="${destinos}" var="destino">
    <option value="${destino.idDestino}">${destino.pais}-${destino.provincia}</option>
</c:forEach>
</select>

<label for="destino">Destino</label>
<select name="destino" id="destino" class=field>
    <option value="0">Seleccione Destino</option>

    <c:forEach items="${destinos}" var="destino">
        <option value="${destino.idDestino}">${destino.pais}-${destino.provincia}</option>
    </c:forEach>
</select>

<input type="submit" value="Agregar Ruta"/>
</form>
</body>
</html>
