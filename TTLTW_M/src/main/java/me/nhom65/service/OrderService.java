package me.nhom65.service;

import java.util.ArrayList;
import java.util.List;

import me.nhom65.dao.OrderDAO;
import me.nhom65.dto.CartViewDAO;
import me.nhom65.dto.OrderViewDTO;
import me.nhom65.dto.ProductViewDTO;
import me.nhom65.model.Order;
import me.nhom65.model.User;

public class OrderService {
	private CartService cartService;
	private ProductService productService;
	private OrderDAO orderDAO;
	
	public OrderService() {
		this.orderDAO = new OrderDAO();
		this.cartService = new CartService();
		this.productService = new ProductService();
	}
	
	public List<Order> getAllOrder(){
		return orderDAO.getAll();
	}

//	public void addOrderFromCart(int userId) {
//		
//	}
	public Order getOrderFromId(int orderId) {
		return orderDAO.getOrderFromId(orderId);
	}
	public boolean handleCheckout(User user, Order order) {
		if (!cartService.isCartExist(user.getUsedId())) {
			return false;
		}
		List<CartViewDAO> carts = cartService.getCartViewFromUser(user.getUsedId());
		double totalBookPrice = carts.stream().mapToDouble(CartViewDAO::getTotalPrice).sum();
		order.setTotalPrice(totalBookPrice);
		int orderId = orderDAO.insert(order);
		if (orderId > 0) {
			for (CartViewDAO cart : carts) {
				orderDAO.insertItemToOrder(orderId, cart);
			}
			cartService.removeAllItemInCart(user.getUsedId());
			return true;
		}

		return false;
	}
	
	public OrderViewDTO getViewFromOrderId(int id){
		Order order = getOrderFromId(id);
		OrderViewDTO ovdto = new OrderViewDTO();
		ovdto.setAddress(order.getAddress());
		ovdto.setFullname(order.getFullName());
		ovdto.setOrderId(order.getOrderId());
		ovdto.setPaymentMethod(order.getPaymentMethod());
		ovdto.setPhone(order.getPhone());
		ovdto.setStatus(order.getStatus());
		ovdto.setTotalPrice(order.getTotalPrice());
		ovdto.setCreatedAt(order.getCreatedAt());
		ovdto.setUpdatedAt(order.getUpdatedAt());
		List<ProductViewDTO> items = productService.getAllProductsFromOrder(order.getOrderId());
		ovdto.setProductView(items);
		return ovdto;	
	}

	public boolean deleteOrder(int id) {
		boolean sucess = orderDAO.removeOrder(id);
		if(sucess) {
			orderDAO.removeOrderItem(id);
			return true;
		}
		return false;
	}

	public List<OrderViewDTO> getViewsFromUserId(int usedId) {
		List<OrderViewDTO> views = new ArrayList<>();
		List<Order> getAll = orderDAO.getOrderFromUserId(usedId);
		if(!getAll.isEmpty()) {
			for(Order order : getAll) {
				OrderViewDTO ovdto = new OrderViewDTO();
				ovdto.setAddress(order.getAddress());
				ovdto.setFullname(order.getFullName());
				ovdto.setOrderId(order.getOrderId());
				ovdto.setPaymentMethod(order.getPaymentMethod());
				ovdto.setPhone(order.getPhone());
				ovdto.setStatus(order.getStatus());
				ovdto.setTotalPrice(order.getTotalPrice());
				ovdto.setCreatedAt(order.getCreatedAt());
				ovdto.setUpdatedAt(order.getUpdatedAt());
				List<ProductViewDTO> items = productService.getAllProductsFromOrder(order.getOrderId());
				ovdto.setProductView(items);
				views.add(ovdto);
			}
		}
		return views;
	}

	public void updateStatus(int orderId, String status) {
		orderDAO.updateStatus(orderId,status);
	}
	
	
}
