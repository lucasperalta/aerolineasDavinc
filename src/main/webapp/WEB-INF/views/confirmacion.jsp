<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>Confirmaci�n de Compra</title>
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
            <h4>�Compra finalizda!</h4>
        </div>
        <div class="contact-section">
            <div class="container">
                <h4>Despachar avi�n</h4>
                <form>
                    <div class=".button-container-right">
                        <div class="col-md-6">
                            <div>
                                <button type="button" class="btn btn-default submit centerbtn"><i class="fa fa-paper-plane" aria-hidden="true"></i> Finalizar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>

</html>