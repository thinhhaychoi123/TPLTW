package me.nhom65.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import me.nhom65.dto.CartViewDAO;
import me.nhom65.util.DatabaseConnection;

public class CartDAO {
	
	public List<CartViewDAO> getCartViewFromUser(int userId) {
		Connection conn = null;
		List<CartViewDAO> resultList = new ArrayList<CartViewDAO>();
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT ci.cart_item_id, ci.quantity, p.product_id ,p.name, p.price"
					+ " FROM cart_items ci JOIN products p ON ci.product_id = p.product_id JOIN carts c ON ci.cart_id = c.cart_id"
					+ " WHERE c.user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				int categoryid = result.getInt("cart_item_id");
				int productid = result.getInt("product_id");
				String name = result.getString("name");
				double price = result.getDouble("price");
				int quantity = result.getInt("quantity");
				CartViewDAO cartviewdao = new CartViewDAO(categoryid,productid,name,price,quantity);
				resultList.add(cartviewdao);
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
}
