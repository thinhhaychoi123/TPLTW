package me.nhom65.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.Order;
import me.nhom65.service.OrderService;

@WebServlet("/admin/order-list")
public class AdminOrderServlet extends HttpServlet {
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
		request.setAttribute("activeMenu", "order");
		List<Order> list = orderservice.getAllOrder();
		request.setAttribute("orders", list);
		request.getServletContext().getRequestDispatcher("/admin/admin_order.jsp").forward(request, response);
	}
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request,response);
//	}
	
}
