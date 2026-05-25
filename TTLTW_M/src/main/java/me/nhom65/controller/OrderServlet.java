package me.nhom65.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.service.OrderService;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private OrderService orderService;
	
	
	public void init() throws ServletException {
		super.init();
		this.orderService = new OrderService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

