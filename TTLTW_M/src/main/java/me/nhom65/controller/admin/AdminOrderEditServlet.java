package me.nhom65.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.dto.OrderViewDTO;
import me.nhom65.model.Category;
import me.nhom65.service.OrderService;

@WebServlet("/admin/order-list/edit")
public class AdminOrderEditServlet extends HttpServlet {
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
			if(request.getParameter("id") != null) {
			String id = (String) request.getParameter("id");
			request.setAttribute("activeMenu", "product");
			OrderViewDTO order = orderservice.getViewFromOrderId(Integer.parseInt(id));
			request.setAttribute("order", order);
			request.getServletContext().getRequestDispatcher("/admin/admin_order_edit.jsp").forward(request, response);
			} else {
				
			}
	}
	//Update
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("orderId");
		String status = request.getParameter("status");
		if(id != null && status != null) {
			orderservice.updateStatus(Integer.parseInt(id),status);
			response.sendRedirect(request.getContextPath() + "/admin/order-list");
		}	
	}
	
}
