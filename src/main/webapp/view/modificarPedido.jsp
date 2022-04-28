<%@page import="model.Pedido"%>
<%@page import="dao.ProvinciaDAO"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="dao.LocalidadDAO"%>
<%@page import="model.Provincia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Localidad"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
	<title>Modificar Pedido</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS v5.0.2 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body class="bg-light text-center">
	<div class="container">
		<div class="py-4">
			<a href='../index.html'>
			<img src="images/logo.jpg" alt="Logo de Codo a Codo" class="mb-4" width="150" height="150">
			</a>
			<h3>Formulario de Modificación de Pedido</h3>
			<p class="lead">Modifique los datos del pedido</p>
		</div>

		<div class="col-md-12">
			<form action="../controller/cambiarPedido.jsp">
			
			
			
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="nombre">Nombre</label>
						
					
						<%
						Integer idPedido = Integer.valueOf(request.getParameter("id"));
						PedidoDAO pedidoDAO = new PedidoDAO();
						Pedido pedido = pedidoDAO.buscarPedido(idPedido);
						out.println("<input type='hidden' id='idPedido' name='idPedido' value='" +idPedido+ "'>");
						out.println("<input type='text' name='nombre' id='nombre' required class='form-control' value="+ pedido.getNombre()+ ">"); %>
						
					
					
					</div>
					<div class="col-md-6 mb-3">
						<label for="apellido">Apellido</label>
						<% out.println("<input type='text' name='apellido' id='apellido' required class='form-control' value=" + pedido.getApellido() + ">"); %>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="usuario">Nombre de Usuario</label>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">@</span>
							<% out.println("<input type='text' name='usuario' id='usuario' required class='form-control' value=" + pedido.getUsuario()+ " aria-label='Username' aria-describedby='basic-addon1'>"); %>
						</div>						
					</div>
					<div class="col-md-6 mb-3">
						<label for="email">Email <span class="text-muted">(Opcional)</span></label>
						
						<% out.println("<input type='email' name='email' id='email' class='form-control' value=" + pedido.getMail() + ">"); %>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 mb-3">
						<label for="direccion">Dirección de entrega</label>
						
						<% out.println("<input type='text' name='direccion' id='direccion' required class='form-control' value='" + pedido.getLugarEntrega() + "'>"); %>
					</div>
				</div>

				<div class="row">
				
				<div class="col-md-4 mb-3">
						<div class="mb-3">
						  <label for="provincia">Provincia</label>
						  <select class="form-select" name="provincia" id="provincia" onchange="cambiarLocalidad()" required>
						  
						  		
							<% 
							ProvinciaDAO provinciaDAO = new ProvinciaDAO();
							List<Provincia> listProvincias = provinciaDAO.listarProvincias();
							
							for(int i=0; i < listProvincias.size(); i++ ) {
								 if(listProvincias.get(i).getId()==pedido.getProvincia()){
								out.println("<option selected value='" + listProvincias.get(i).getId() + "' >" + listProvincias.get(i).getNombre() + "</option>");
							}else{
								out.println("<option value='" + listProvincias.get(i).getId() + "'>" + listProvincias.get(i).getNombre() + "</option>");
								
							}
								
							}
							%>
						  </select>
						</div>
					</div>
					<% 
								LocalidadDAO localidadDAO = new LocalidadDAO();
								List<Localidad> listLocalidades = localidadDAO.listarLocalidades();
								
								for(int i=0; i < listLocalidades.size(); i++) {
									out.println("<input type='hidden' id='" + listLocalidades.get(i).getId() + "' value='" + listLocalidades.get(i).getNombre() + "' name='"+listLocalidades.get(i).getIdProv()+"'>");
								}	
								%>
					<div class="col-md-4 mb-3">
						<div class="mb-3">
							<label for="localidad">Localidad</label>
							<select class="form-select" name="localidad" id="localidad" required>
							
								<%Localidad localidad = localidadDAO.buscarXID(pedido.getLocalidad());
									
								
								out.println("<option value='" +localidad.getId() + "'>" + localidad.getNombre() + "</option>"); %>
								
							</select>
						</div>
					</div>

					

					<div class="col-md-4 mb-3">
						<label for="codPostal">Código Postal</label>
						
						<% out.println("<input type='text' name='codPostal' id='codPostal' required class='form-control' value=" + pedido.getCodPostal() + ">"); %>
					</div>
				</div>

				<hr class="mb-6">

				<h4 class="mb-3">Formas de Pago</h4>

				<div class="row">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="radio" name="formaPago" id="formaPago" value="tarjeta" checked> Tarjeta de Crédito
						</label>
						<br>
						<label class="form-check-label">
							<input class="form-check-input" type="radio" name="formaPago" id="formaPago" value="mercado"> Mercado Pago
						</label>
					
					</div>

				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="titular">Nombre del Titular</label>
						
						<% out.println("<input type='text' name='titular' id='titular' required class='form-control' value='" + pedido.getTarjTitular() + "'>"); %>
						<small class="text-muted">Ingrese el nombre como aparece en la tarjeta</small>
					</div>
					<div class="col-md-6 mb-3">
						<label for="nroTarjeta">Número de la Tarjeta</label>

						<% out.println("<input type='text' name='nroTarjeta' id='nroTarjeta' required class='form-control' maxlength='16 'value=" + pedido.getTarjNumero() + ">"); %>
						<small class="text-muted">Ingrese los 16 dígitos de la tarjeta</small>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-3"></div>
					<div class="col-md-3 mb-3">
						<label for="fechaVto">Fecha de Vencimiento</label>

						<% out.println("<input type='text' name='fechaVto' id='fechaVto' required class='form-control' required maxlength='4' value=" + pedido.getTarjVto() + ">"); %>
						<small class="text-muted">Ingrese los 4 dígitos sin espacios</small>
					</div>
					<div class="col-md-3 mb-3">
						<label for="codigoSeg">Código de Seguridad</label>
						
						<% out.println("<input type='text' name='codigoSeg' id='codigoSeg' required class='form-control' required maxlength='3' value=" + pedido.getTarjClave() + ">"); %>
						<small class="text-muted">Ingrese los 3 dígitos</small>
					</div>
				</div>


				<div class="row">
					<button type="submit" class="btn btn-primary">Ingresar solicitud</button>
				</div>

			</form>


		</div>
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
	<script src="js/cambiarLocalidad.js"></script>
		
</body>

</html>