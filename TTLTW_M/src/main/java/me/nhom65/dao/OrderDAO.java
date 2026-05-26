package me.nhom65.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				String paymethod = result.getString("payment_method");
				String status = result.getString("status");
				Timestamp create_at = result.getTimestamp("created_at");
				Timestamp update_at = result.getTimestamp("updated_at");
				Order order = new Order(orderid, userid, fullname, phone, address, paymethod, status, create_at, update_at);
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
}
