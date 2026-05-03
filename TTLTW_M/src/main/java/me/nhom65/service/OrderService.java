package me.nhom65.service;

import java.util.List;

import me.nhom65.dao.OrderDAO;
import me.nhom65.model.Order;

public class OrderService {
	private OrderDAO dao;
	
	public OrderService() {
		this.dao = new OrderDAO();
	}
	
	public List<Order> getAllOrder(){
		return dao.getAll();
	}

	
}
