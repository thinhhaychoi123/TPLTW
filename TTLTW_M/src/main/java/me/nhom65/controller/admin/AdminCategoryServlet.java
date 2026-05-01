package me.nhom65.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.Category;
import me.nhom65.model.Product;
import me.nhom65.service.CategoryService;
import me.nhom65.service.ProductService;

@WebServlet("/admin/category-list")
public class AdminCategoryServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private CategoryService categoryService;
	private ProductService productService;
	
	
	public void init() throws ServletException {
		super.init();
		this.categoryService = new CategoryService();
		this.productService = new ProductService();
	}
	
	//Qua bug khong hien ra cac category, do thieu type="java.util.List" cho custom tag
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> trees = loadCategoryFromDAO();
		List<Product> products = productService.getAllProducts();
		request.setAttribute("activeMenu", "category");
		
		request.setAttribute("categoryTree", trees);
		request.setAttribute("products", products);
		request.getServletContext().getRequestDispatcher("/admin/admin_category.jsp").forward(request, response);
	}
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request,response);
//	}

	private List<Category> loadCategoryFromDAO() {
		List<Category> list = categoryService.getAllCategory(); // lấy từ DB
		
		Map<Integer, Category> map = new HashMap<>();
		List<Category> roots = new ArrayList<>();

		// đưa vào map
		for (Category c : list) {
		    map.put(c.getCategoryId(), c);
		}

		// build tree
		for (Category c : list) {
		    if (c.getParentId() == null || c.getParentId().isBlank()) {
		        roots.add(c);
		    } else {
		        Category parent = map.get(Integer.parseInt(c.getParentId()));
		        if (parent != null) {
		            parent.getChildren().add(c);
		        }
		    }
		}
//		list.forEach(c -> System.out.println(c.toString()+"-"+c.getName()+"-"+c.getChildren().size())); Debug
		return roots;
	}
	

}
