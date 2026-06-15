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
			String sql = "SELECT ci.cart_item_id, c.cart_id, ci.quantity, p.product_id ,p.name, p.price"
					+ " FROM cart_items ci JOIN products p ON ci.product_id = p.product_id JOIN carts c ON ci.cart_id = c.cart_id"
					+ " WHERE c.user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				int categoryid = result.getInt("cart_item_id");
				int cartid = result.getInt("cart_id");
				int productid = result.getInt("product_id");
				String name = result.getString("name");
				double price = result.getDouble("price");
				int quantity = result.getInt("quantity");
				CartViewDAO cartviewdao = new CartViewDAO(categoryid,cartid,productid,name,price,quantity);
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

	public boolean hasInCart(int cartId, int bid) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT 1 FROM cart_items WHERE cart_id = ? AND product_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setInt(2, bid);
			ResultSet result = ps.executeQuery();
			return result.next();
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

	public boolean update(int cartId, int bid, int quantity) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND product_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, quantity);
			ps.setInt(2, cartId);
			ps.setInt(3, bid);
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

	public int getCurrentQuantity(int cartId, int bid) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT quantity FROM cart_items WHERE cart_id = ? AND product_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setInt(2, bid);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
			    return result.getInt("quantity");
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

	public boolean insert(int cartId, int bid, int quantity) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "INSERT INTO cart_items(cart_id, product_id, quantity) VALUE (?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setInt(2, bid);
			ps.setInt(3, quantity);
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
	
	

	public boolean isCartExist(int userId) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT cart_id FROM carts WHERE user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();
			
			return result.next();
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
	public boolean addNewCart(int userId) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "INSERT INTO carts(user_id) VALUES (?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
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

	public int findCartId(int userId) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT cart_id FROM carts WHERE user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
		            return result.getInt("cart_id");
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

	public boolean delete(int cartId, int bid) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "DELETE FROM cart_items WHERE cart_id = ? AND product_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setInt(2,  bid);
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
	public boolean deleteAll(int cartId) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "DELETE FROM cart_items WHERE cart_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cartId);
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
