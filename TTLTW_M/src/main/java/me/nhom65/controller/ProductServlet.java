package me.nhom65.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.Product;
import me.nhom65.service.ProductService;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	
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
		int id = Integer.parseInt(request.getParameter("id"));
	    Product product = productService.getProductFromId(id);
	    request.setAttribute("product", product);
		request.getServletContext().getRequestDispatcher("/single.jsp").forward(request, response);
	}

}
