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
				<form>
				    <div>
				        <h1>Adulto1</h1>
				    </div>
					<div class="col-md-3 form-line">
			  			<div class="form-group">
			  				<label for="exampleInputNombre">Nombre</label>
					    	<input type="text" class="form-control" id="">
				  		</div>
                    </div>
                    <div class="col-md-3 form-line">
				  		<div class="form-group">
					    	<label for="exampleInputEmail">DNI</label>
					    	<input type="dni" class="form-control" id="exampleInputDNI">
					  	</div>	
                    </div>
                    <div class="col-md-3 form-line">
					  	<div class="form-group">
					    	<label for="butacas">Nro. Butaca</label>
					    	<select name="dia de la semana" class="form-control">
                            <option>A14</option>
                            <option>A15</option>
                            <option>J16</option>
                            <option>J18</option>
                            <option>J19</option>
                            </select>
			  			</div>
                    </div>
                    <div class="col-md-3 form-line">
                        <div class="form-group">
					    	<label for="exampleInputEmail">Precio</label>
                            <p class="form-control" id="precio" >$5000</p>
					  	</div>	
                    </div>
                    <div class="col-md-12">
					 <div class="button-container">
			  			<button type="button" class="btn btn-default centerbtn submit"><i class="fa fa-paper-plane" aria-hidden="true"></i>Comprar</button>
			        </div>
					 </div>
				</form>
        	</div>
				</div>
		</section>
</body>
</html>