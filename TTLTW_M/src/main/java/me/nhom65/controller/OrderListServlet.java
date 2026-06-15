package me.nhom65.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import me.nhom65.dto.OrderViewDTO;
import me.nhom65.model.User;
import me.nhom65.service.OrderService;

@WebServlet("/orderlist")
public class OrderListServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2263433387991613276L;
	private OrderService orderservice;
	
	public void init() throws ServletException {
		super.init();
		orderservice = new OrderService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
    	 User user = (User) session.getAttribute("currentUser");
    	 List<OrderViewDTO> oiv = orderservice.getViewsFromUserId(user.getUsedId());
    	 request.setAttribute("orderitems", oiv);
		 request.getServletContext().getRequestDispatcher("/orderlist.jsp").forward(request, response);
	}

}

