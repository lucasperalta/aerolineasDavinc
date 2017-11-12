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
<form method="POST"  action="/altaVuelos">
    <input type="hidden" path="idVuelo" id="idDestino"/>

<label for="avion">Avion</label>
<select name="avion" id="avion" class=field>
    <option value="0">Seleccione Avion</option>

    <c:forEach items="${aviones}" var="avion">
    <option value="${avion.idAvion}">${avion.marca}-${avion.modelo}-${avion.matricula}</option>
</c:forEach>
</select>

<label for="rutas">Rutas</label>
<select name="ruta" id="ruta" class=field>
    <option value="0">Seleccione Ruta</option>

    <c:forEach items="${rutas}" var="ruta">
        <option value="${ruta.idRuta}">${ruta.destinoPartida.pais} ${ruta.destinoPartida.provincia} - ${ruta.destinoLlegada.pais} ${ruta.destinoLlegada.provincia}</option>
    </c:forEach>
</select>

    <label for="costoVuelo">Costo del Vuelo</label>

    <input type="text" name="costoVuelo" id="costoVuelo">

<input type="submit" value="Agregar Vuelo"/>
</form>
</body>
</html>
