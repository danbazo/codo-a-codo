<%@page import="dao.PedidoDAO"%>
<%@page import="java.math.BigInteger"%>
<%@page import="model.Pedido"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>>Estatus Pedido</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="css/signin.css">
    
</head>
<body class = "text-center bg-light">
<div class="container">
        			<a href='../index.html'>
			<img src="images/logo.jpg" alt="Logo de Codo a Codo" class="mb-4" width="150" height="150">
			</a>
        <h3 class= "text">Estatus de su pedido:</h3>
        
      
        <%
	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String usuario = request.getParameter("usuario");
	String email = request.getParameter("email");
	String direccion = request.getParameter("direccion");
	Integer localidad = Integer.valueOf(request.getParameter("localidad"));
	Integer provincia = Integer.valueOf(request.getParameter("provincia"));
	String codPostal = request.getParameter("codPostal");
	String formaPago = request.getParameter("formaPago");
	String titular = request.getParameter("titular");
	Long nroTarjeta = Long.valueOf(request.getParameter("nroTarjeta"));
	String fechaVto = request.getParameter("fechaVto");
	Integer codigoSeg = Integer.valueOf(request.getParameter("codigoSeg"));
	
	//TODO: cambiar en jsp el select x id localidad y provincia
	Pedido pedido = new Pedido(nombre,apellido,usuario,email,direccion,localidad,provincia,codPostal,formaPago,titular,nroTarjeta,fechaVto,codigoSeg);
	
	PedidoDAO pedidoDAO = new PedidoDAO();
	Boolean guardoOK = pedidoDAO.guardarPedido(pedido);
	
	if(guardoOK) {
		out.println("<h4 class='text-success'>El pedido se guardó exitosamente</h4>");
	}else {
		out.println("<h4 class='text-danger'>Error en guardar pedido, intente nuevamente</h4>");
	}


%>	



<a href="../view/pedido.jsp">Hacer un pedido</a>
<br>
<a href="../view/listadoPedidos.jsp">Listado de pedidos</a>
    </div>



    
</body>
</html>