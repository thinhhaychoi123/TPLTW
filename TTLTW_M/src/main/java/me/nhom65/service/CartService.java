package me.nhom65.service;

import java.util.List;

import me.nhom65.dao.CartDAO;
import me.nhom65.dto.CartViewDAO;

public class CartService {

	private CartDAO cartDAO;
	
	public CartService() {
		this.cartDAO = new CartDAO();
	}
	
	public List<CartViewDAO> getCartViewFromUser(int userId) {
		return cartDAO.getCartViewFromUser(userId);
	}
}
