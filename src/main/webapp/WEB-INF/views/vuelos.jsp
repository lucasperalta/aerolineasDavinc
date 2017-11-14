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
<div id="contact" >
    <div class="container">
        <h1 class="text-center title">Agregar Vuelo</h1>
        <form method="POST"  action="/altaVuelos">
            <input type="hidden" path="idVuelo" id="idDestino"/>
            <div class="form-group">
                <label for="avion">Avion</label>
                <select class="selectpicker" name="avion" id="avion" class=field>
                    <option value="0">Seleccione Avion</option>

                    <c:forEach items="${aviones}" var="avion">
                        <option value="${avion.idAvion}">${avion.marca}-${avion.modelo}-${avion.matricula}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="rutas">Rutas</label>
                <select class="selectpicker" name="ruta" id="ruta" class=field>
                    <option value="0">Seleccione Ruta</option>

                    <c:forEach items="${rutas}" var="ruta">
                        <option value="${ruta.idRuta}">${ruta.destinoPartida.pais} ${ruta.destinoPartida.provincia} - ${ruta.destinoLlegada.pais} ${ruta.destinoLlegada.provincia}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="costoVuelo">Costo del Vuelo</label>
                <input class="form-control costo" type="text" name="costoVuelo" id="costoVuelo">
            </div>
            <input class="btn btn-default submit" type="submit" value="Agregar Vuelo"/>
        </form>
    </div>
</div>
</body>
</html>
