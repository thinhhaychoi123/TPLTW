package me.nhom65.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.Category;
import me.nhom65.service.CategoryService;

@WebServlet("/admin/category-list/update")
public class AdminCategoryUpdateServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private CategoryService categoryService;
	
	
	public void init() throws ServletException {
		super.init();
		this.categoryService = new CategoryService();
	}
	

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("categoryId");
		String name = request.getParameter("categoryName");
		String description = request.getParameter("categoryDescription");
		
		Category category = new Category();
		category.setCategoryId(Integer.parseInt(id));
		category.setName(name);
		category.setDescription(description);
		
		categoryService.updateCategory(category);
		
	}

	

}
