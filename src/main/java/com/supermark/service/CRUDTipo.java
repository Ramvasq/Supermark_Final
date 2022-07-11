package com.supermark.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.supermark.models.Tipo;

public class CRUDTipo {
	private Conexion conexion;
	private String sql;


	public CRUDTipo() {
	super();
	this.conexion = new Conexion("supermark");
	this.conexion.connect();
	this.sql = "";
	}


	public boolean insertar(Tipo tipo) {
	this.sql = "INSERT INTO tipo "+
	"(descripcion,id_descuento) "+
	"VALUE ('"+
	tipo.getDescripion()+"',"+
	tipo.getIdDescuento()+")";
	boolean resultado = false;
	
	System.out.println(this.sql);
	
	try {
	conexion.getStmt().executeUpdate(this.sql);
	resultado = true;
	
	System.out.println("Tipo registrado");
	} catch (SQLException e){
	e.printStackTrace();
	}finally {
	return resultado;
	}

	}
	public ArrayList<Tipo> consultarTipos(){
	ArrayList<Tipo> tipos = new ArrayList<Tipo>();
	this.sql = "SELECT * FROM tipo";
	try {
	conexion.setRs(conexion.getStmt().executeQuery(sql));

	}
	catch(SQLException e){
	e.printStackTrace();
	}
	finally{
	System.out.println("Tipos Registrados");
	ResultSet rs = conexion.getRs();
	try {
	while(rs.next()) {
	Tipo tipo2 = new Tipo(
	rs.getString("descripcion"),
	rs.getInt("id_descuento")
	);
	tipos.add(tipo2);
	}
	}catch(SQLException e) {
	e.printStackTrace();
	}
	}
	return tipos;
	}


	}
