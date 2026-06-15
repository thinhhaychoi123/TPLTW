package me.nhom65.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import me.nhom65.dto.CartViewDAO;
import me.nhom65.model.Order;
import me.nhom65.util.DatabaseConnection;

public class OrderDAO {
	public List<Order> getAll() {
		Connection conn = null;
		List<Order> resultList = new ArrayList<Order>();
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM orders";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				int orderid = result.getInt("order_id");
				int userid = result.getInt("user_id");
				String fullname = result.getString("fullname");
				String phone = result.getString("phone");
				String address = result.getString("address");
				double totalPrice = result.getDouble("total_price");
				String paymethod = result.getString("payment_method");
				String status = result.getString("status");
				Timestamp create_at = result.getTimestamp("created_at");
				Timestamp update_at = result.getTimestamp("updated_at");
				Order order = new Order(orderid, userid, fullname, phone, address,totalPrice, paymethod, status, create_at, update_at);
				resultList.add(order);
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultList;
	}
	
	private void forCopy(int test) {
		Connection conn = null;
		List<CartViewDAO> resultList = new ArrayList<CartViewDAO>();
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT ci.cart_item_id, ci.quantity, p.product_id ,p.name, p.price"
					+ " FROM cart_items ci JOIN products p ON ci.product_id = p.product_id JOIN carts c ON ci.cart_id = c.cart_id"
					+ " WHERE c.user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, test);
			ResultSet result = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int insert(Order order) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "INSERT INTO orders"
					+ "(user_id, fullname,phone,address,total_price, payment_method,status) VALUES (?, ?, ?, ?, ?, ?,?)";
			PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, order.getUserId());
			ps.setString(2, order.getFullName());
			ps.setString(3, order.getPhone());
			ps.setString(4, order.getAddress());
			ps.setDouble(5, order.getTotalPrice());
			ps.setString(6, order.getPaymentMethod());
			ps.setString(7, getStatusString(0));
			int affectedRows = ps.executeUpdate();

			if (affectedRows > 0) {
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	private String getStatusString(int status) {
		switch (status) {
		case 0:
			return "PENDING";
		case 1:
			return "SHIPPING";
		case 2:
			return "SUCCESS";
		case 3:
			return "CANCEL";
		default:
			return "UNKNOWN";
		}
	}

	public boolean insertItemToOrder(int orderId, CartViewDAO cart) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, orderId);
			ps.setInt(2, cart.getProductId());
			ps.setInt(3, cart.getQuantity());
			ps.setDouble(4, cart.getTotalPrice());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public Order getOrderFromId(int orderId) {
		Order order = null;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM  orders WHERE order_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, orderId);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				int orderid = result.getInt("order_id");
				int userid = result.getInt("user_id");
				String fullname = result.getString("fullname");
				String phone = result.getString("phone");
				String address = result.getString("address");
				double totalPrice = result.getDouble("total_price");
				String paymethod = result.getString("payment_method");
				String status = result.getString("status");
				Timestamp create_at = result.getTimestamp("created_at");
				Timestamp update_at = result.getTimestamp("updated_at");
				order = new Order(orderid, userid, fullname, phone, address,totalPrice, paymethod, status, create_at, update_at);
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return order;
	}
	
	public List<Order> getOrderFromUserId(int userId) {
		List<Order> orders = new ArrayList<>();
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM orders WHERE user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				int orderid = result.getInt("order_id");
				int userid = result.getInt("user_id");
				String fullname = result.getString("fullname");
				String phone = result.getString("phone");
				String address = result.getString("address");
				double totalPrice = result.getDouble("total_price");
				String paymethod = result.getString("payment_method");
				String status = result.getString("status");
				Timestamp create_at = result.getTimestamp("created_at");
				Timestamp update_at = result.getTimestamp("updated_at");
				orders.add(new Order(orderid, userid, fullname, phone, address,totalPrice, paymethod, status, create_at, update_at));
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return orders;
	}

	public boolean removeOrder(int orderId) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "DELETE FROM orders WHERE order_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, orderId);
			int result = ps.executeUpdate();
			return result > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean removeOrderItem(int orderId) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "DELETE FROM order_items WHERE order_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, orderId);
			int result = ps.executeUpdate();
			return result > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean updateStatus(int orderId, String status) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ps.setInt(2, orderId);
			int result = ps.executeUpdate();
			return result > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
