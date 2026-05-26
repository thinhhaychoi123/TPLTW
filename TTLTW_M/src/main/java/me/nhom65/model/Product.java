package me.nhom65.model;

import java.sql.Timestamp;

public class Product {
	private int productId; 
	private String name; 
	private String description; 
	private int categoryId; 
	private String imageUrl; 
	private double price; 
	private String status; 
	private Timestamp createdAt; 
	private Timestamp updatedAt;
	public Product(int productId, String name, String description, int categoryId, String imageUrl, double price, String status, Timestamp createdAt, Timestamp updatedAt) {
		super();
		this.productId = productId;
		this.name = name;
		this.description = description;
		this.categoryId = categoryId;
		this.imageUrl = imageUrl;
		this.price = price;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	public Product() {
		// TODO Auto-generated constructor stub
	}
	public int getProductId() {
		return productId;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public double getPrice() {
		return price;
	}
	public String getStatus() {
		return status;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
