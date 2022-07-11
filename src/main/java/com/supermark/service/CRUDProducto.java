package com.supermark.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.supermark.models.Producto;

public class CRUDProducto {
	private Conexion conexion;
	private String sql;
	
	public CRUDProducto() {
		super();
		this.conexion = new Conexion("supermark");
		this.conexion.connect();//Abre la conexion
		this.sql = "";
	}
	
	public boolean insertar(Producto producto) {
		//CRUDTipo crudTipo = new CRUDTipo();
		//crudTipo.insertar(producto.getTipo());
		this.sql = "INSERT INTO producto "+
		"(nombre,marca,fecha_venc,precio,stock,id_tipo) "+
		"VALUE ('"+
		producto.getNombre()+"','"+
		producto.getMarca()+"','"+
		producto.getFecha_venc()+"',"+
		producto.getPrecio()+","+
		producto.getStock()+","+
		producto.getTipo().getId()+")";
		System.out.println(this.sql);
		boolean resultado = false;
		try {
		conexion.getStmt().executeUpdate(this.sql);
		resultado = true;
		System.out.println("Producto registrado");
		} catch (SQLException e){
		e.printStackTrace();
		}finally {
		return resultado;
		}

		}
	
	
	
/*	public Producto getProducto(Integer id) {
		Producto prod = null;
		this.sql = "SELECT * FROM Producto WHERE id ="+id;
		try {
			ResultSet rs = conexion.getStmt().executeQuery(sql);
			while (rs.next()) {
				prod = new Producto(
						rs.getInt("id"),
						rs.getString("nombre"),
						rs.getString("marca"),
						rs.getString("fecha_venc"), 
						rs.getFloat("precio"), 
						rs.getInt("stock"),
						rs.getInt("tipo")
						)
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prod;
	}
*/
	
	public void actualizarStock(Producto producto,int cantidad) {
		this.sql = "UPDATE Producto SET stock="+
				(producto.getStock()+cantidad)+
				" WHERE id="+producto.getId();
		try {
			conexion.getStmt().executeUpdate(sql);
			System.out.println("Stock Actualizado");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getStockActual(Producto producto) {
		int stockActual = 0;
		this.sql = "SELECT stock FROM Producto WHERE id="+producto.getId();
		try {
			conexion.setRs(conexion.getStmt().executeQuery(sql));
			int count = 0;
			while(conexion.getRs().next()) {
				stockActual = conexion.getRs().getInt("stock");
			}
			if(count>0) {
				System.out.println("Stock Actualizado");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stockActual;
	}
}
