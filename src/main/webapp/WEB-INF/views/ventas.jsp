<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>Buscado Aerolinea</title>
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Teko:400,700" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="<c:url value="/recursos/css/style.css" />" rel="stylesheet">
    <script src="/recursos/js/jquery-3.2.1.js"></script>

    <link rel="stylesheet" href="/recursos/css/bootstrap.min.css">
</head>

<body>
<section id="contact">
    <div class="section-content">
        <h1 class="section-header">Aerolinea <span class="content-header wow fadeIn " data-wow-delay="0.2s"
                                                   data-wow-duration="2s"> Davinci </span></h1>
        <h3>Los mejores precios en una sola APP</h3>
    </div>
    <div class="contact-section">
        <div class="container">
            <form method="POST" action="/reservarVuelo">
                <div class="col-md-12 ">
                    <div class="col-md-6 ">
                        <div class="form-group">
                            <label for="Vuelos">Seleccione un vuelo</label>
                            <select name="vuelos" id="vuelos" class="form-control">
                                <option value="0" selected>Seleccione Vuelo</option>

                                <c:forEach items="${vuelos}" var="vuelo">

                                    <option data-costo="${vuelo.costoVuelo}"
                                            value="${vuelo.idVuelo}">${vuelo.ruta.destinoPartida.pais} ${vuelo.ruta.destinoPartida.provincia}
                                        - ${vuelo.ruta.destinoLlegada.pais} ${vuelo.ruta.destinoLlegada.provincia}</option>

                                </c:forEach>
                            </select>

                        </div>
                    </div>

                    <div class="col-md-6 ">
                        <div class="form-group">
                            <label for="costo">Costo</label>
                            <input type="text" class="form-control" readonly id="costo" name="costo">
                        </div>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col-md-6 button-container">
                        <div>
                            <button type="submit" class="btn btn-default submit centerbtn">
                                <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                Siguiente
                            </button>
                        </div>
                    </div>

            </form>
            <form method="POST" action="/cerrarVuelo">

                    <div class="col-md-6 button-container">
                        <div>
                            <input type="hidden" name="idVuelo" id="idVuelo">
                            <button type="submit" class="btn btn-default submit centerbtn">
                                <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                Cerrar Vuelo
                            </button>
                        </div>
                    </div>

            </form>
        </div>
        </div>
    </div>
</section>

<script>

    $(document).ready(function () {
        $('#vuelos').change(function () {
            var selected = $(this).find('option:selected');
            var costo = selected.data('costo');
            $('#costo').val(costo);
            $('#idVuelo').val(selected.val());

        });
    });

</script>
</body>

</html>