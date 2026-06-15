package me.nhom65.dto;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OrderViewDTO {

	private int orderId;
	private String fullname;
	private String phone;
	private String address;
	
	private String paymentMethod;
	private String status;
	private double totalPrice;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	private List<ProductViewDTO> productView = new ArrayList<>();

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<ProductViewDTO> getProductView() {
		return productView;
	}

	public void setProductView(List<ProductViewDTO> productView) {
		if(productView != null && !productView.isEmpty()) {
			this.productView.clear();
			this.productView.addAll(productView);
		}
		
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updateAt) {
		this.updatedAt = updateAt;
	}
	
	
	
}
