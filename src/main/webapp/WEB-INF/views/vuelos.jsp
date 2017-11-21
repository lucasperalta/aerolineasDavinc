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

        <c:set var="action" value="/altaVuelos" />


        <c:if test = "${edit}">
            <c:set var="action" value="/updateVuelos" />

        </c:if>

        <form method="POST" action="${action}">
            <input type="hidden" name="idVuelo" id="idVuelo" value="${idVuelo}"/>
            <div class="form-group">
                <label for="avion">Avion</label>

                <select class="selectpicker" name="avion" id="avion" class=field>
                    <option value="0">Seleccione Avion</option>

                    <c:forEach items="${aviones}" var="avion">

                        <c:choose>
                            <c:when test="${avionSeleccionado==avion.idAvion}">
                                <option selected value="${avion.idAvion}">${avion.marca}-${avion.modelo}-${avion.matricula}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${avion.idAvion}">${avion.marca}-${avion.modelo}-${avion.matricula}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="rutas">Rutas</label>
                <select class="selectpicker" name="ruta" id="ruta" class=field>
                    <option value="0">Seleccione Ruta</option>

                    <c:forEach items="${rutas}" var="ruta">
                        <c:choose>
                            <c:when test="${rutaSeleccionada==ruta.idRuta}">
                                <option selected value="${ruta.idRuta}">${ruta.destinoPartida.pais} ${ruta.destinoPartida.provincia} - ${ruta.destinoLlegada.pais} ${ruta.destinoLlegada.provincia}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${ruta.idRuta}">${ruta.destinoPartida.pais} ${ruta.destinoPartida.provincia} - ${ruta.destinoLlegada.pais} ${ruta.destinoLlegada.provincia}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="costoVuelo">Costo del Vuelo</label>
                <c:choose>
                    <c:when test="${edit}">
                        <input class="form-control costo" type="text" name="costoVuelo" id="costoVuelo" value="${costoVuelo}">
                    </c:when>
                    <c:otherwise>
                        <input class="form-control costo" type="text" name="costoVuelo" id="costoVuelo" >
                    </c:otherwise>
                </c:choose>
            </div>
            <c:choose>
                <c:when test="${edit}">
                    <input class="btn btn-default submit" type="submit" value="editar"/>
                </c:when>
                <c:otherwise>
                    <input class="btn btn-default submit" type="submit" value="agregar"/>
                </c:otherwise>
            </c:choose>        </form>
    </div>
    <a class="btn btn-default submit"  href="<c:url value='/showAdmin' />">Volver a admin</a>

</div>
</body>
</html>
