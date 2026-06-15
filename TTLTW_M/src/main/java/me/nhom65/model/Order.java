package me.nhom65.model;

import java.sql.Timestamp;

public class Order {

	private int orderId;
	private int userId;
	private String fullName;
	private String phone;
	private String address;
	private double totalPrice;
	private String paymentMethod;
	private String status;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	
	public Order(int orderId, int userId, String fullname, String phone, String address, double totalPrice, String paymentMethod,
			String status, Timestamp createdAt, Timestamp updatedAt) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.fullName = fullname;
		this.phone = phone;
		this.address = address;
		this.totalPrice = totalPrice;
		this.paymentMethod = paymentMethod;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	public Order() {
		
	}
	public int getOrderId() {
		return orderId;
	}
	public int getUserId() {
		return userId;
	}
	public String getFullName() {
		return fullName;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddress() {
		return address;
	}
	public String getPaymentMethod() {
		return paymentMethod;
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
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
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
