package me.nhom65.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.service.OrderService;


@WebServlet("/admin/order-list/delete")
public class AdminOrderDeleteServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private OrderService orderservice;
	
	
	public void init() throws ServletException {
		super.init();
		this.orderservice = new OrderService();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("orderId");
		orderservice.deleteOrder(Integer.parseInt(id));
	}
}
	

