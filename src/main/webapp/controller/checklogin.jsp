<%@page import="dao.UsuarioDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
</head>

<body>
	<%
		String usuario = request.getParameter("email"); //obtiene el par�metro enviado desde la p�gina login.html, llamado inputEmail
		String contrasenia = request.getParameter("pass");
		
		//out.println(usuario);
		//out.println(contrasenia);

		UsuarioDAO usuarioDAO = new UsuarioDAO(); //para usar una clase tengo que instanciarla
		Boolean usuValido = usuarioDAO.validarUsuarioYPass(usuario, contrasenia);
		
		if(usuValido) {
			response.sendRedirect("../view/pedido.jsp");
		} else {
			response.sendRedirect("../view/loginError.html");
		}
	
	%>

</body>
</html>