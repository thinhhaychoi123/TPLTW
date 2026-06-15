package me.nhom65.controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import me.nhom65.dto.CartViewDAO;
import me.nhom65.model.Product;
import me.nhom65.model.User;
import me.nhom65.service.CartService;
import me.nhom65.service.ProductService;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259630436033547445L;
	private ProductService productService;
	private CartService cartService;
	
	
	public void init() throws ServletException {
		super.init();
		this.productService = new ProductService();
		this.cartService = new CartService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
    	 User user = (User) session.getAttribute("currentUser");
    	 List<CartViewDAO> cartviews = cartService.getCartViewFromUser(user.getUsedId());
    	 double totalPrice = caculateTotalPrice(cartviews);
    	 request.setAttribute("cartviews", cartviews);
    	 request.setAttribute("totalPrice", totalPrice);
    	 request.getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
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
		loadCartAction(request,response);
	}

	private void loadCartAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	      String action = request.getParameter("action");
	      if (action == null) {
	        doGet(request,response);
	        return;
	      }
	      switch (action) {
          case "add":
              addToCart(request,response);
              break;
          case "delete":
              deleteFromCart(request, response);
              break;
          case "update":
              updateQuantity(request, response);
              break;
          default: 
        	  break;   
	      }
	      
	}

	private void updateQuantity(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		System.out.println(request.getParameter("pid") != null);
		 int bid = Integer.parseInt(request.getParameter("pid"));
		 int quantity = Integer.parseInt(request.getParameter("quantity"));
	     HttpSession session = request.getSession();
	     User user = (User) session.getAttribute("currentUser");
	     Product b = productService.getProductFromId(bid);
	     CartMessageResult result = null;
	     if(b == null) {
	    	 result = new CartMessageResult("Lỗi không có sách, hãy tải lại trang ngay!", 2);
	     } else {
	    	 boolean check = cartService.updateCart(user.getUsedId(), bid, quantity);
	    	 if(check) {
	    		 result = new CartMessageResult("Đã xóa khỏi giỏ hàng thành công!", 1);
	    	 } else {
	    		 result = new CartMessageResult("Lỗi khi cố xóa khỏi giỏ hàng",0);
	    	 }
	     }
	     response.setContentType("application/json");
	     response.getWriter().print(new Gson().toJson(result));
	}

	private void deleteFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int bid = Integer.parseInt(request.getParameter("pid"));
	     HttpSession session = request.getSession();
	     User user = (User) session.getAttribute("currentUser");
	     Product b = productService.getProductFromId(bid);
	     CartMessageResult result = null;;
	     if(b == null) {
	    	 result = new CartMessageResult("Lỗi không có sách, hãy tải lại trang ngay!", 2);
	     } else {
	    	 boolean check = cartService.removeItemInCart(user.getUsedId(), bid);
	    	 if(check) {
	    		 result = new CartMessageResult("Đã xóa khỏi giỏ hàng thành công!", 0);
	    	 } else {
	    		 result = new CartMessageResult("Lỗi khi cố xóa khỏi giỏ hàng",1);
	    	 }
	     }
	     response.setContentType("application/json");
	     response.getWriter().print(new Gson().toJson(result));
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 int bid = Integer.parseInt(request.getParameter("pid"));
		 int quantity = Integer.parseInt(request.getParameter("quantity"));
	     HttpSession session = request.getSession();
	     User user = (User) session.getAttribute("currentUser");
	     int userId = user.getUsedId();
	     Product b = productService.getProductFromId(bid);
	     CartMessageResult result = null;
	     if(b == null) {
	    	 result = new CartMessageResult("Lỗi không có sách, reload trang lại ngay",2);
	     } else {
	    	 if(cartService.hasInCart(userId,bid)) {
	    		 int currentq = cartService.getCurrentQuantity(userId, bid);
	    		 cartService.updateCart(userId, bid, currentq+quantity);
	    		 result = new CartMessageResult("Đã cập nhật thêm sách, hãy xem tại giỏ hàng",1);
	    	 } else {
	    		 cartService.addItemToCart(userId, bid, quantity);
	    		 result = new CartMessageResult("Đã thêm sách vào giỏ hàng của bạn",0);
	    	 }
	     }
	     response.setContentType("application/json");
	     response.getWriter().print(new Gson().toJson(result));
	}
	
	public static class CartMessageResult{
		private String message;
		private int type;

		public CartMessageResult(String message, int type) {
			this.message = message;
			this.type = type;
		}

		public String getMessage() {
			return message;
		}

		public int getType() {
			return type;
		}
		
		
	}

}
