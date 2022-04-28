<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estatus Usuario</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="css/signin.css">
    
</head>
<body class = "text-center bg-light">
<div class="container">
       			<a href='../index.html'>
			<img src="images/logo.jpg" alt="Logo de Codo a Codo" class="mb-4" width="150" height="150">
			</a>
        <h3 class= "text">Estatus de su usuario:</h3>
        
        
	<%
	String email = request.getParameter("email");
	String contrasenia = request.getParameter("pass");
		
	
	Usuario usuario = new Usuario(email, contrasenia);
	
	UsuarioDAO usuarioDAO = new UsuarioDAO();
	
	Boolean okGuardado = usuarioDAO.guardarUsuario(usuario);
	
	
	   if (okGuardado) {
	        out.println("<h4 class='text-success'>El usuario se agregó correctamente <br> <a href='../view/Login.html'>Hacer un pedido</a></h4>");
	    } else {
	        out.println("<h4 class='text-danger'>Error en agregar usuario, intentente nuevamente <br> <a href='../view/crearUsuario.jsp'>Crear Usuario</a></h4>");
	    }	
	%>





    </div>
</body>
</html>