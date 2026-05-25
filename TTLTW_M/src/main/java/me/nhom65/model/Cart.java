package me.nhom65.model;

import java.sql.Timestamp;

public class Cart  {

	private int cartId;
	private int userId;
	private Timestamp createdAt;
	private Timestamp updateAt;
	public Cart(int cartId, int userId, Timestamp createdAt, Timestamp updateAt) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.createdAt = createdAt;
		this.updateAt = updateAt;
	}
	public int getCartId() {
		return cartId;
	}
	public int getUserId() {
		return userId;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public Timestamp getUpdateAt() {
		return updateAt;
	}
	
	
}
