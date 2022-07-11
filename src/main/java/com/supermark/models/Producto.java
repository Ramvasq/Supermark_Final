package com.supermark.models;

import java.sql.Date;

public class Producto {
	private Integer id;
	private String nombre;
	private String marca;
	private String fecha_venc;
	private Float precio;
	private Integer stock;
	private Tipo tipo;
	
	/*public Producto(Integer id) {
		super();
		this.id = id;
	} */
	
	
	public Producto(Integer id, String nombre, String marca, String fecha_venc, Float precio, Integer stock, Tipo tipo) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.marca = marca;
		this.fecha_venc = fecha_venc;
		this.precio = precio;
		this.stock = stock;
		this.tipo = tipo;
	}



	public Producto(String nombre, String marca, String fecha_venc, Float precio, Integer stock, Tipo tipo) {
		super();
		this.nombre = nombre;
		this.marca = marca;
		this.fecha_venc = fecha_venc;
		this.precio = precio;
		this.stock = stock;
		this.tipo = tipo;
	}



	public Producto(Integer id,Float precio) {
		super();
		this.id = id;
		this.precio = precio;
	}
	
	public Producto(Integer id,String nombre,Float precio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.precio = precio;
	}
	
	public Producto(Integer id,Integer stock) {
		super();
		this.id = id;
		this.stock = stock;
	}
	
	public Producto(Integer id, String nombre, String marca, String fecha_venc, Float precio, Integer stock) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.marca = marca;
		this.fecha_venc = fecha_venc;
		this.precio = precio;
		this.stock = stock;
	}
	
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
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
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public Tipo getTipo() {
		return tipo;
	}



	public void setTipo(Tipo tipo) {
		this.tipo = tipo;
	}



	public String getFecha_venc() {
		return fecha_venc;
	}
	public void setFecha_venc(String fecha_venc) {
		this.fecha_venc = fecha_venc;
	}
	public Float getPrecio() {
		return precio;
	}
	public void setPrecio(Float precio) {
		this.precio = precio;
	}

	@Override
	public String toString() {
		return "Producto [id=" + id + ", nombre=" + nombre + ", marca=" + marca + ", fecha_venc=" + fecha_venc + ", precio="
				+ precio + ", stock=" + stock + "]";
	}
}
