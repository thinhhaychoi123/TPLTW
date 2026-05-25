package me.nhom65.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.Product;
import me.nhom65.service.ProductService;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private ProductService productService;
	
	
	public void init() throws ServletException {
		super.init();
		this.productService = new ProductService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if(request.getParameter("action") != null) {
//			String action = (String) request.getParameter("action");
//			if(action.equals("single")) {
//				request.getServletContext().getRequestDispatcher("/single.jsp").forward(request, response);
//				return;
//			}
//			if(action.equals("shop")) {
//				request.getServletContext().getRequestDispatcher("/shop.jsp").forward(request, response);
//				return;
//			}
//			if(action.equals("contact")) {
//				request.getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
//				return;
//			}
//			if(action.equals("404")) {
//				request.getServletContext().getRequestDispatcher("/404.jsp").forward(request, response);
//				return;
//			}
//			if(action.equals("bestseller")) {
//				request.getServletContext().getRequestDispatcher("/bestseller.jsp").forward(request, response);
//				return;
//			}
//			if(action.equals("checkout")) {
//				request.getServletContext().getRequestDispatcher("/checkout.jsp").forward(request, response);
//				return;
//			}
//			if(action.equals("cart")) {
//				request.getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
//				return;
//			}
//		}
		List<Product> products = productService.getAllProducts();
		request.setAttribute("products", products);
		request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request,response);
//	}
	

	
}
