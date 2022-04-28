package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Pedido;

public class PedidoDAO {
	
	public Boolean guardarPedido(Pedido pedido) {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			
			String sql = "INSERT INTO pedidos "
					+ "(nombre, apellido, usuario, mail, lugarentrega, localidad, provincia, codpostal, formadepago, tarjtitular, tarjnumero, tarjvto, tarjclave) "
					+ "VALUES ("
					+ "'" + pedido.getNombre() + "',"
					+ "'" + pedido.getApellido() + "',"
					+ "'" + pedido.getUsuario() + "',"
					+ "'" + pedido.getMail() + "',"
					+ "'" + pedido.getLugarEntrega() + "',"
					+ "" + pedido.getLocalidad() + ","
					+ "" + pedido.getProvincia() + ","
					+ "'" + pedido.getCodPostal() + "',"
					+ "'" + pedido.getFormaDePago() + "',"
					+ "'" + pedido.getTarjTitular() + "',"
					+ "" + pedido.getTarjNumero() + ","
					+ "'" + pedido.getTarjVto() + "',"
					+ "" + pedido.getTarjClave() 
					+ ")";
			
			System.out.println(sql);
			
			st.executeUpdate(sql);
			
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
	}

	
	public List<Pedido> listarPedidos() {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM pedidos");
			
			List<Pedido> listPedidos = new ArrayList<Pedido>();
			while (rs.next()) {
				Pedido pedido = new Pedido(
						rs.getInt("idpedido"),
						rs.getString("nombre"),
						rs.getString("apellido"),
						rs.getString("usuario"),
						rs.getString("mail"),
						rs.getString("lugarentrega"),
						rs.getInt("localidad"),
						rs.getInt("provincia"),
						rs.getString("codpostal"),
						rs.getString("formadepago"),
						rs.getString("tarjtitular"),
						rs.getLong("tarjnumero"),
						rs.getString("tarjvto"),
						rs.getInt("tarjclave")
						);
				
				listPedidos.add(pedido);
			}
			
			return listPedidos;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Pedido buscarPedido(Integer id) {
		
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM pedidos WHERE idpedido="+id);
			Pedido pedido = null;
			if(rs.next()){
				pedido = new Pedido(
						rs.getInt("idpedido"),
						rs.getString("nombre"),
						rs.getString("apellido"),
						rs.getString("usuario"),
						rs.getString("mail"),
						rs.getString("lugarentrega"),
						rs.getInt("localidad"),
						rs.getInt("provincia"),
						rs.getString("codpostal"),
						rs.getString("formadepago"),
						rs.getString("tarjtitular"),
						rs.getLong("tarjnumero"),
						rs.getString("tarjvto"),
						rs.getInt("tarjclave")
						);
				
			}
			
			
			return pedido;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Error creando objeto pedido");
			
		}
	return null;
	}
	
	public Boolean modificarPedido(Pedido pedido) {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			
			String sql = "UPDATE pedidos SET nombre ='" + pedido.getNombre() 
					+ "', apellido = '" + pedido.getApellido() 
					+"', usuario = '" +pedido.getUsuario()
					+ "', mail = '" +pedido.getMail()
					+ "', lugarentrega = ' " + pedido.getLugarEntrega()
					+ "', localidad = '" +pedido.getLocalidad()
					+ "', provincia = '" +pedido.getProvincia()
					+ "', codPostal = '" +pedido.getCodPostal()
					+ "', formadepago = '" +pedido.getFormaDePago()
					+ "', tarjtitular = '" +pedido.getTarjTitular()
					+ "', tarjnumero = '" +pedido.getTarjNumero()
					+ "', tarjvto = '" +pedido.getTarjVto()
					+ "', tarjclave = '" +pedido.getTarjClave()
					
					+ "' WHERE pedidos.idpedido ='" +pedido.getIdPedido() + "'";
			
			System.out.println(sql);
			
			st.executeUpdate(sql);
			
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;

	}
}
