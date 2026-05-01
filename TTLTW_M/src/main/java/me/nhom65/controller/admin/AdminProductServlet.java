package me.nhom65.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.Product;
import me.nhom65.service.ProductService;

@WebServlet("/admin/product-list")
public class AdminProductServlet extends HttpServlet {

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
		request.setAttribute("activeMenu", "product");
		List<Product> products = productService.getAllProducts();
		request.setAttribute("products", products);
		request.getServletContext().getRequestDispatcher("/admin/admin_product.jsp").forward(request, response);
	}
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request,response);
//	}
	

}
