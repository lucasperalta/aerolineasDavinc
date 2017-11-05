<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
</head>
<body>
    
    <nav>
        <ul>
           <li> <a href="#">Agregar Avion</a></li>
            <li> <a href="<c:url value='/destinos' />">Destinos</a></li>
            <li><a href="#">Nueva Ruta</a></li>
            <li><a href="#">Analizar Ganancias</a></li>
        </ul>
    </nav>
    
    <h1>Agregar Avión</h1>
    <form action="setAvion">
    
    <label for="modelo">Modelo</label>
    <input type="text" name="modelo">
    
    <label for="marca">Marca</label>
    <input type="text" name="marca">
    
    <label for="butacas">Cant. de Butacas</label>
    <input type="text" name="cantButacas">
    
    <button type="button">Agregar</button>
    </form>
    
        <h1>Agregar Ruta</h1>
    <form action="setRuta">
    
    <label for="origen">Origen</label>
    <select name="origen" class=field> 
        <option value="Buenos Aires">Buenos Aires</option> 
        <option value="Catamarca">Catamarca</option> 
        <option value="Chaco">Chaco</option> 
        <option value="Chubut">Chubut</option> 
        <option value="Corrientes">Corrientes</option> 
        <option value="Cordoba">Córdoba</option> 
        <option value="Distrito Federal">Distrito Federal</option> 
        <option value="Entre Rios">Entre Ríos</option> 
        <option value="Formosa">Formosa</option> 
        <option value="Jujuy">Jujuy</option> 
        <option value="La Pampa">La Pampa</option> 
        <option value="La Rioja">La Rioja</option> 
        <option value="Mendoza">Mendoza</option> 
        <option value="Misiones">Misiones</option> 
        <option value="Neuquen">Neuquen</option> 
        <option value="Rio Negro">Río Negro</option> 
        <option value="Salta">Salta</option> 
        <option value="San Juan">San Juan</option> 
        <option value="San Luis">San Luis</option> 
        <option value="Santa Cruz">Santa Cruz</option> 
        <option value="Santa Fe">Santa Fe</option> 
        <option value="Santiago del Estero">Santiago del Estero</option> 
        <option value="Tierra del Fuego">Tierra del Fuego</option> 
        <option value="Tucuman">Tucumán</option> 
</select>
    
   <label for="origen">Destino</label>
    <select name="origen" class=field> 
        <option value="Buenos Aires">Buenos Aires</option> 
        <option value="Catamarca">Catamarca</option> 
        <option value="Chaco">Chaco</option> 
        <option value="Chubut">Chubut</option> 
        <option value="Corrientes">Corrientes</option> 
        <option value="Cordoba">Córdoba</option> 
        <option value="Distrito Federal">Distrito Federal</option> 
        <option value="Entre Rios">Entre Ríos</option> 
        <option value="Formosa">Formosa</option> 
        <option value="Jujuy">Jujuy</option> 
        <option value="La Pampa">La Pampa</option> 
        <option value="La Rioja">La Rioja</option> 
        <option value="Mendoza">Mendoza</option> 
        <option value="Misiones">Misiones</option> 
        <option value="Neuquen">Neuquen</option> 
        <option value="Rio Negro">Río Negro</option> 
        <option value="Salta">Salta</option> 
        <option value="San Juan">San Juan</option> 
        <option value="San Luis">San Luis</option> 
        <option value="Santa Cruz">Santa Cruz</option> 
        <option value="Santa Fe">Santa Fe</option> 
        <option value="Santiago del Estero">Santiago del Estero</option> 
        <option value="Tierra del Fuego">Tierra del Fuego</option> 
        <option value="Tucuman">Tucumán</option> 
</select>
    
    <label for="Modelo">Avión</label>
    <select name="origen" class=field> 
     <option value="a1">Avión 1</option> 
     <option value="a2">Avión 2</option> 
    </select>
    
    <label for="precio">Precio</label>
    <input type="text" name="precio">
    
       <button type="button">Agregar</button>
       
    </form>
</body>
</html>