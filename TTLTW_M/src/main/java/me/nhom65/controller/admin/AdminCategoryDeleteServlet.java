package me.nhom65.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.service.CategoryService;

@WebServlet("/admin/category-list/delete")
public class AdminCategoryDeleteServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private CategoryService categoryService;
	
	
	public void init() throws ServletException {
		super.init();
		this.categoryService = new CategoryService();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("categoryId");
		categoryService.deleteCategory(Integer.parseInt(id));
	}

	

}
