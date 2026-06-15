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
import me.nhom65.model.Order;
import me.nhom65.model.User;
import me.nhom65.service.CartService;
import me.nhom65.service.OrderService;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private CartService cartService;
	private OrderService orderService;
	
	public void init() throws ServletException {
		super.init();
		this.cartService = new CartService();
		this.orderService = new OrderService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
    	 User user = (User) session.getAttribute("currentUser");
    	 List<CartViewDAO> cartviews = cartService.getCartViewFromUser(user.getUsedId());
    	 double totalPrice = caculateTotalPrice(cartviews);
    	 request.setAttribute("cartviews", cartviews);
    	 request.setAttribute("totalPriceAll", totalPrice);
    	 request.getServletContext().getRequestDispatcher("/checkout.jsp").forward(request, response);
	}
	private double caculateTotalPrice(List<CartViewDAO> cartviews) {
		double totalPrice = 0;
		if(!cartviews.isEmpty()) {
			for(CartViewDAO cvd : cartviews) {
				totalPrice += cvd.getTotalPrice();
			}
		}
		return totalPrice;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("currentUser");
	       
	    boolean issucess = handleCheckout(user,request);
	    response.sendRedirect(request.getContextPath() + "/cart"); 
	}
	private boolean handleCheckout(User user, HttpServletRequest request) {
		
		String fullname = request.getParameter("fullname");
		
		//Address
		String province = request.getParameter("province");
		String district = request.getParameter("district");
		String ward = request.getParameter("ward");
		
		String addressfinal = province+", "+district+", "+ward;
		
		String phone = request.getParameter("phone");
		String note = request.getParameter("note");
		String paymentMethod =
		        request.getParameter("paymentMethod");
//		
		System.out.println(fullname+"-"+addressfinal+"-"+phone+"-"+note+"-"+paymentMethod);
		Order order = new Order();
		order.setUserId(user.getUsedId());
		order.setFullName(fullname);
		order.setAddress(addressfinal);
		order.setPhone(phone);
		order.setPaymentMethod(paymentMethod);
		
//		
//		
//		
//		order.setUserId(user.getUsedId());
//		order.setFullName(fullname);
//		order.setAddress(address);
//		order.setPhone(phone);
//		order.setPaymentMethod(paymentOption);
		
		return orderService.handleCheckout(user, order);
	}

}
