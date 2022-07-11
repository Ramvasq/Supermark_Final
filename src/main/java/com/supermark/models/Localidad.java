package com.supermark.models;

public class Localidad {
	private Integer id;
	private String provincia;
	private String departamento;
	private String ciudad;
	
	public Localidad(String provincia, String departamento, String ciudad) {
		super();
		this.provincia = provincia;
		this.departamento = departamento;
		this.ciudad = ciudad;
	}

	public Localidad(Integer id) {
		super();
		this.id = id;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getDepartamento() {
		return departamento;
	}
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
	
}
