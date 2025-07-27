package com.bean;

public class MaterialBean {
	private String materialname;
	private String materialtype;
	private String materialquantity;
	private String materialprice;
	private int id;

	public int getId() {
	    return id;
	}
	public void setId(int id) {
	    this.id = id;
	}
	
	public String getMaterialname() {
		return materialname;
	}
	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}
	public String getMaterialtype() {
		return materialtype;
	}
	public void setMaterialtype(String materialtype) {
		this.materialtype = materialtype;
	}
	public String getMaterialquantity() {
		return materialquantity;
	}
	public void setMaterialquantity(String materialquantity) {
		this.materialquantity = materialquantity;
	}
	public String getMaterialprice() {
		return materialprice;
	}
	public void setMaterialprice(String materialprice) {
		this.materialprice = materialprice;
	}
	
}
