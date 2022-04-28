package model;

public class Localidad {
	private Integer id;
	private String nombre;
	private Integer idProv;
	
	
public Localidad(Integer id, String nombre, Integer idProv) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.idProv= idProv;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public Integer getIdProv() {
		return idProv;
	}

	public void setIdProv(Integer idProv) {
		this.idProv = idProv;
	}

}
