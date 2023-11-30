<%@ page import="org.iesvdm.jsp_servlet_jdbc.model.Socio"%>
<%@ page import="java.util.Optional" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="estilos.css" />
</head>
<body class="bg-light">
<%
  Socio socio = (Socio) request.getAttribute("socio");
%>
<div class="container bg-white">
  <div class="row border-bottom">
<%
  String action;
  if(socio != null){
    action = "EditarSociosServlet";
%>
      <div class="col-12 h2">Edite los datos del socio <%=socio.getSocioID()%></div>
<%
  } else {
    action = "GrabarSociosServlet";
%>
    <div class="col-12 h2">Introduzca los datos del nuevo socio</div>
<% } %>
  </div>
</div>

<div class="container bg-light">
  <form method="post" action="<%=action%>">
    <div class="row body mt-2">
      <div class="col-md-6 align-self-center">Nombre</div>
      <div class="col-md-6 align-self-center"><input type="text" name="nombre" value="<%= socio != null ? socio.getNombre() : "" %>" /></div>
    </div>
    <div class="row body mt-2">
      <div class="col-md-6 align-self-center">Estatura</div>
      <div class="col-md-6 align-self-center"><input type="text" name="estatura" value="<%= socio != null ? socio.getEstatura() : "" %>" /></div>
    </div>
    <div class="row body mt-2">
      <div class="col-md-6 align-self-center">Edad</div>
      <div class="col-md-6 align-self-center"><input type="text" name="edad" value="<%= socio != null ? socio.getEdad() : "" %>" /></div>
    </div>
    <div class="row body mt-2">
      <div class="col-md-6 align-self-center">Localidad</div>
      <div class="col-md-6 align-self-center"><input type="text" name="localidad" value="<%= socio != null ? socio.getLocalidad() : "" %>" /></div>
    </div>
    <div class="row mt-2">
      <div class="col-md-6">
        &nbsp;
      </div>
      <div class="col-md-6 align-self-center">
        <input class="btn btn-primary" type="submit" value="Aceptar">
      </div>
    </div>
    <%
      if(socio != null){
    %>
    <input type="hidden" name="socioID" value="<%=socio.getSocioID()%>">
    <% } %>
  </form>
  <%
    //                                                 v---- RECOGER MENSAJE DE ERROR DEL ÁMBITO request
    String error = (String) request.getAttribute("error");
//            v---- SI ESTÁ PRESENTE INFORMAR DEL ERROR
    if (error != null) {
  %>
  <div class="row mt-2">
    <div class="col-6">
        <div class="alert alert-danger alert-dismissible fade show">
          <strong>Error!</strong> <%=error%>
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      </div>
  </div>
  <%
    }
  %>
</div>
<script src="js/bootstrap.bundle.js" ></script>
</body>
</html>