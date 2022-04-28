package dao;

import javax.swing.JOptionPane;

public class ejercicioJava {

	public static void main(String[] args) {
	String nombre = JOptionPane.showInputDialog("Ingrese su nombre");
	String apellido = JOptionPane.showInputDialog("Ingrese su apellido");
	String edad = JOptionPane.showInputDialog("Ingrese su edad");
	String hobbie = JOptionPane.showInputDialog("Ingrese su hobbie");
	String editCod = JOptionPane.showInputDialog("Ingrese su editor de codigo preferido");
	String sisOper = JOptionPane.showInputDialog("Ingrese que sistema operativo utiliza");
	System.out.println("Nombre: " + nombre);
	System.out.println("Apellido: " + apellido);
	System.out.println("Edad: " + edad);
	System.out.println("Hobbie: " + hobbie);
	System.out.println("Editor de código preferido: " + editCod);
	System.out.println("Sistema operativo utilizado: " + sisOper);
	
	
}
	
}
