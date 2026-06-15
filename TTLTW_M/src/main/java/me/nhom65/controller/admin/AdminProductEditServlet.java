package me.nhom65.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.Category;
import me.nhom65.model.Product;
import me.nhom65.service.CategoryService;
import me.nhom65.service.ProductService;

@WebServlet("/admin/product-list/edit")
public class AdminProductEditServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private ProductService productService;
	private CategoryService categoryService;
	
	
	public void init() throws ServletException {
		super.init();
		this.productService = new ProductService();
		this.categoryService = new CategoryService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getParameter("id") != null) {
		String id = (String) request.getParameter("id");
		request.setAttribute("activeMenu", "product");
		Product product = productService.getProductFromId(Integer.parseInt(id));
		
		request.setAttribute("product", product);
		List<Category> listc = categoryService.getAllCategory();
		request.setAttribute("categorys", listc);
		request.getServletContext().getRequestDispatcher("/admin/admin_product_edit.jsp").forward(request, response);
		} else {
			
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
