package com.supermark.models;

public class Descuento {
	private Integer id;
	private Float porcentaje;
	
	public Descuento(Integer id, Float porcentaje) {
		super();
		this.id = id;
		this.porcentaje = porcentaje;
	}

	public Descuento(Float porcentaje) {
		super();
		this.porcentaje = porcentaje;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Float getPorcentaje() {
		return porcentaje;
	}

	public void setPorcentaje(Float porcentaje) {
		this.porcentaje = porcentaje;
	}
	
	
	
}

