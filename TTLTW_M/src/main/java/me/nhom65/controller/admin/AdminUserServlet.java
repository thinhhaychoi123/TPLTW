package me.nhom65.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.nhom65.model.User;
import me.nhom65.service.UserService;

@WebServlet("/admin/customer-list")
public class AdminUserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private UserService userService;
	
	
	public void init() throws ServletException {
		super.init();
		this.userService = new UserService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("activeMenu", "customer");
		List<User> users = userService.getAllUsers();
		request.setAttribute("users", users);
		request.getServletContext().getRequestDispatcher("/admin/admin_customer.jsp").forward(request, response);
	}
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request,response);
//	}
	
}