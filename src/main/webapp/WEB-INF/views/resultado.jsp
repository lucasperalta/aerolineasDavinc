<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>Resultado de Vuelos</title>
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
                <div class="table-responsive">
                    <table class="table">
    <thead>
      <tr>
        <th>Vuelos</th>
        <th>Modelo</th>
        <th>Matr�cula</th>
        <th>Butacas Disponibles</th>
        <th>Costo de Pasajes</th>
        <th class="t-center">Marcar</th>
        
      </tr>
    </thead>
    <tbody>
      <tr class="danger">
        <td>Default</td>
        <td>Defaultson</td>
        <td>def@somemail.com</td>
        <td>33</td>
        <td>230</td>
        <td class="t-center"><input type="checkbox" name="vehicle" value="Bike"> </td>
      </tr>      
      <tr>
        <td>Success</td>
        <td>Doe</td>
        <td>john@example.com</td>
          <td>33</td>
        <td>230</td>
        <td class="t-center"><input type="checkbox" name="vehicle" value="Bike"> </td>
      </tr>
      <tr class="danger">
        <td>Danger</td>
        <td>Moe</td>
        <td>mary@example.com</td>
          <td>33</td>
        <td>230</td>
        <td class="t-center"><input type="checkbox" name="vehicle" value="Bike"> </td>
      </tr>
      <tr>
        <td>Info</td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>33</td>
        <td>230</td>
        <td class="t-center"><input type="checkbox" name="vehicle" value="Bike"> </td>
      </tr>
      <tr class="danger">
        <td>Warning</td>
        <td>Refs</td>
        <td>bo@example.com</td>
          <td>33</td>
        <td>230</td>
        <td class="t-center"><input type="checkbox" name="vehicle" value="Bike"> </td>
      </tr>
      <tr>
        <td>Active</td>
        <td>Activeson</td>
        <td>act@example.com</td>
          <td>33</td>
        <td>230</td>
        <td class="t-center"><input type="checkbox" name="vehicle" value="Bike"> </td>
      </tr>
    </tbody>
  </table>
                </div>
                <form>
                 
                    <div class="col-md-12">
                        <div class="button-container">
                            <button type="button" class="btn btn-default submit centerbtn"><i class="fa fa-paper-plane" aria-hidden="true"></i> Atr�s</button>
                            <button type="button" class="btn btn-default submit centerbtn"><i class="fa fa-paper-plane" aria-hidden="true"></i> Comprar</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </section>
</body>

</html>