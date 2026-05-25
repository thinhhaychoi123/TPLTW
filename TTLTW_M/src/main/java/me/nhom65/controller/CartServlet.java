package me.nhom65.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import me.nhom65.dto.CartViewDAO;
import me.nhom65.model.User;
import me.nhom65.service.CartService;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private CartService cartService;
	
	
	public void init() throws ServletException {
		super.init();
		this.cartService = new CartService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
    	 User user = (User) session.getAttribute("currentUser");
    	 List<CartViewDAO> cartviews = cartService.getCartViewFromUser(user.getUsedId());
    	 request.setAttribute("cartviews", cartviews);
    	 request.getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
	}

}
