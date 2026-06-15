package me.nhom65.dto;

public class ProductViewDTO {

	
	private int productViewId;
	private String productName;
	private double price;
	private int quantity;
	
	

	public int getProductViewId() {
		return productViewId;
	}
	public String getProductName() {
		return productName;
	}
	public double getPrice() {
		return price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setProductViewId(int productViewId) {
		this.productViewId = productViewId;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}
