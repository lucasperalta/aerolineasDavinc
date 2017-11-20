<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscado Aerolinea</title>
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700" rel="stylesheet">
   	<link href="https://fonts.googleapis.com/css?family=Teko:400,700" rel="stylesheet">
   	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="<c:url value="/recursos/css/style.css" />" rel="stylesheet">

   	<link rel="stylesheet" href="/recursos/css/bootstrap.min.css">

</head>
<body>
    <section id="contact">
			<div class="section-content">
				<h1 class="section-header">Aerolinea <span class="content-header wow fadeIn " data-wow-delay="0.2s" data-wow-duration="2s"> Davinci</span></h1>
				<h3>Los mejores precios en un sola APP</h3>
			</div>
			<div class="contact-section">
			<div class="container">
				<form method="POST" action="/savePasajero">
                    <input type="hidden" name="idVuelo" id="idVuelo" value="${idVuelo}">
				    <div>
				        <h1>Pasajero</h1>
				    </div>
					<div class="col-md-3 form-line">
			  			<div class="form-group">
			  				<label for="nombre">Nombre</label>
					    	<input type="text" class="form-control" id="nombre" name="nombre">
				  		</div>
                    </div>
                    <div class="col-md-3 form-line">
                        <div class="form-group">
                            <label for="apellido">Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" >
                        </div>
                    </div>
                    <div class="col-md-3 form-line">
				  		<div class="form-group">
					    	<label for="dni">DNI</label>
					    	<input type="text" class="form-control" id="dni" name="dni" >
					  	</div>	
                    </div>
                    <div class="col-md-2 form-line">
					  	<div class="form-group">
					    	<label for="butacas">Nro. Butaca</label>
					    	<select name="butaca" id="butaca" class="form-control">
							<c:forEach items="${butacasDisponibles}" var="butaca">
                                <option  value="${butaca}">${butaca}</option>
                            </c:forEach>
                            </select>
			  			</div>
                    </div>
                    <div class="col-md-1 form-line">
                        <div class="form-group">
					    	<label for="precio">Precio</label>
                            <p class="form-control" id="precio" readonly="" name="precio" >${costoVuelo}</p>
					  	</div>	
                    </div>
                    <div class="col-md-12">
					 <div class="button-container">
			  			<button type="submit" class="btn btn-default centerbtn submit"><i class="fa fa-paper-plane" aria-hidden="true"></i>Comprar</button>
			        </div>
					 </div>
				</form>
                <a href="<c:url value='/ventas' />">Volver a ventas</a>

            </div>
				</div>
		</section>
</body>
</html>