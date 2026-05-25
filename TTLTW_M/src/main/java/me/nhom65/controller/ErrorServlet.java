package me.nhom65.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/error")
public class ErrorServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	
	
	public void init() throws ServletException {
		super.init();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/404.jsp").forward(request, response);
	}

}

