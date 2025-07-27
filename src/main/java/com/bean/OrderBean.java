package com.bean;

public class OrderBean {
    private int id;
    private int vendor;
    private String material;
    private int quantity;
    private String status;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getVendor() {
        return vendor;
    }
    public void setVendor(int vendorId) {
        this.vendor = vendorId;
    }

    public String getMaterial() {
        return material;
    }
    public void setMaterial(String material) {
        this.material = material;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
