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

	
	public int findCartIdByUser(int userId) {
		return cartDAO.findCartId(userId);
	}

	public boolean hasInCart(int userId, int bid) {
		int cartID = findCartIdByUser(userId);
		if(cartID > 0) {
		return cartDAO.hasInCart(userId, bid);
		}
		return false;
	}

	public boolean updateCart(int userId, int bid, int quantity) {
		int cartID = findCartIdByUser(userId);
		if(cartID > 0) {
			return cartDAO.update(cartID, bid, quantity);
		}
		return false;
	}

	public int getCurrentQuantity(int userId, int bid) {
		int cartID = findCartIdByUser(userId);
		if(cartID > 0) {
			return cartDAO.getCurrentQuantity(cartID, bid);
		}
		return -1;
	}
	public boolean isCartExist(int userId) {
		return cartDAO.isCartExist(userId);
	}
	public boolean addNewCart(int userId) {
		return cartDAO.addNewCart(userId);
	}
	public boolean addItemToCart(int userId, int bid, int quantity) {
		if(!isCartExist(userId)) {
			addNewCart(userId);
		}
		int cartID = findCartIdByUser(userId);
		if(cartID > 0) {
			return cartDAO.insert(cartID, bid, quantity);
		}
		
		return false;
	}
}
