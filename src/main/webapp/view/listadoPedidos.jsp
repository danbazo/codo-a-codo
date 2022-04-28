<%@page import="model.Provincia"%>
<%@page import="dao.ProvinciaDAO"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="dao.LocalidadDAO"%>
<%@page import="model.Localidad"%>

<%@page import="model.Pedido"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!doctype html>
<html lang="en">

<head>
    <title>Listado de Pedidos</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.0.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body class="text-center bg-light">
    <div class="container">
        <div class="py-4">
            			<a href='../index.html'>
			<img src="images/logo.jpg" alt="Logo de Codo a Codo" class="mb-4" width="150" height="150">
			</a>
            <h4>Pedidos</h4>
            <p class="lead">Listado de Pedidos Pendientes</p>
        </div>
        
        <table class="table table-striped table-sm  table-hover">
            <thead class="table-dark">
                <tr>
                    <th>#ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>E-mail</th>
                    <th>Dirección</th>
                    <th>Localidad</th>
                    <th>Provincia</th>
                    <th>Código Postal</th>
                    <th>Modificar</th>
                </tr>
                </thead>
                <tbody>
                    <% 
                    PedidoDAO pedidoDAO = new PedidoDAO();
                    List<Pedido> listPedidos = pedidoDAO.listarPedidos();
                    
                    LocalidadDAO localidadDAO = new LocalidadDAO();
                    ProvinciaDAO provinciaDAO = new ProvinciaDAO();
                    for(int i=0; i < listPedidos.size(); i++) {
                    	Integer idLocalidad = listPedidos.get(i).getLocalidad();
                    	Localidad localidad = localidadDAO.buscarXID(idLocalidad);
                    	Integer idProvincia = listPedidos.get(i).getProvincia();
                    	Provincia provincia = provinciaDAO.buscarXID(idProvincia);
                    	out.println("<tr>");
                    	out.println("<td>" + listPedidos.get(i).getIdPedido() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getNombre() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getApellido() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getUsuario() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getMail() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getLugarEntrega() + "</td>");
                    	out.println("<td>" + localidad.getNombre() + "</td>");
                    	out.println("<td>" + provincia.getNombre() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getCodPostal() + "</td>");
                    	out.println("<td><a href='modificarPedido.jsp?id="+listPedidos.get(i).getIdPedido()+"'>Modificar</a></td>");
                    	out.println("</tr>");
                    }
                    
                    %>

                </tbody>
                
        </table>
        

    </div>
	  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2022 Codo a Codo</p>
  </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>

</html>