package me.nhom65.model;

import java.sql.Timestamp;

public class CartItem {

	
	private int cartItemId;
	private int cartId;
	private int productId;
	private int quantity;
	
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	public CartItem(int cartItemId, int cartId, int productId, int quantity, Timestamp createdAt, Timestamp updatedAt) {
		super();
		this.cartItemId = cartItemId;
		this.cartId = cartId;
		this.productId = productId;
		this.quantity = quantity;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	public int getCartItemId() {
		return cartItemId;
	}
	public int getCartId() {
		return cartId;
	}
	public int getProductId() {
		return productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	
	
	
}
