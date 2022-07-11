package com.supermark.models;

public class Tipo {
private Integer id;
private String descripion;
private Integer idDescuento;
public Integer getId() {
return id;
}
public void setId(Integer id) {
this.id = id;
}
public Tipo(String descripion, Integer idDescuento) {
super();
this.descripion = descripion;
this.idDescuento = idDescuento;
}
public Tipo(Integer id, String descripion, Integer idDescuento) {
super();
this.id = id;
this.descripion = descripion;
this.idDescuento = idDescuento;
}
public String getDescripion() {
return descripion;
}
public void setDescripion(String descripion) {
this.descripion = descripion;
}
public Integer getIdDescuento() {
return idDescuento;
}
public void setIdDescuento(Integer idDescuento) {
this.idDescuento = idDescuento;
}

}