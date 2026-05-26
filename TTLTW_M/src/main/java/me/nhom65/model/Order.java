package me.nhom65.model;

import java.sql.Timestamp;

public class Order {

	private int orderId;
	private int userId;
	private String fullname;
	private String phone;
	private String address;
	private String paymentMethod;
	private String status;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	
	public Order(int orderId, int userId, String fullname, String phone, String address, String paymentMethod,
			String status, Timestamp createdAt, Timestamp updatedAt) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		this.paymentMethod = paymentMethod;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	public Order() {
		// TODO Auto-generated constructor stub
	}
	public int getOrderId() {
		return orderId;
	}
	public int getUserId() {
		return userId;
	}
	public String getFullname() {
		return fullname;
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
	
	
}
