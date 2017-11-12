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
            <h1 class="section-header">Aerolinea <span class="content-header wow fadeIn " data-wow-delay="0.2s" data-wow-duration="2s"> Davinci </span></h1>
            <h3>Los mejores precios en una sola APP</h3>
        </div>
        <div class="contact-section">
            <div class="container">
                <form>
                    <div class="col-md-6 ">
                        <div class="form-group">
                            <label for="exampleInputUsername">Origen</label>
                            <input type="text" class="form-control" id="" placeholder=" Ingrese su destino">
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="form-group">
                            <label for="exampleInputEmail">Destino</label>
                            <input type="email" class="form-control" id="exampleInputEmail" placeholder=" INgrese su destino">
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="form-group">
                            <label for="telephone">Pasajeros</label>
                            <input type="tel" class="form-control" id="telephone" placeholder=" Ingrese cantidad de pasajeros">
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col-md-12 button-container">
                            <div>
                                <button type="button" class="btn btn-default submit centerbtn"><i class="fa fa-paper-plane" aria-hidden="true"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>

</html>