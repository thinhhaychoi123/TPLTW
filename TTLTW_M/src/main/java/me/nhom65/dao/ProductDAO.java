package me.nhom65.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import me.nhom65.dto.ProductViewDTO;
import me.nhom65.model.Product;
import me.nhom65.util.DatabaseConnection;

public class ProductDAO {

	public List<Product> getAllProducts(){
		Connection conn = null;
		List<Product> resultList = new ArrayList<Product>();
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM products";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				Product p = new Product();
				p.setProductId(result.getInt("product_id")); 
				p.setName(result.getString("name")); 
				p.setDescription(result.getString("description")); 
				p.setCategoryId(result.getInt("category_id"));
				p.setImageUrl(result.getString("image_url")); 
				p.setPrice(result.getDouble("price")); 
				p.setStatus(result.getString("status")); 
				p.setCreatedAt(result.getTimestamp("created_at"));
				p.setUpdatedAt(result.getTimestamp("updated_at")); 
				resultList.add(p);
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
	public Product getProductById(int id) {
		Connection conn = null;
		Product p = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM products WHERE product_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				p = new Product();
				p.setProductId(result.getInt("product_id")); 
				p.setName(result.getString("name")); 
				p.setDescription(result.getString("description")); 
				p.setCategoryId(result.getInt("category_id"));
				p.setImageUrl(result.getString("image_url")); 
				p.setPrice(result.getDouble("price")); 
				p.setStatus(result.getString("status")); 
				p.setCreatedAt(result.getTimestamp("created_at"));
				p.setUpdatedAt(result.getTimestamp("updated_at")); 
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
		return p;
	}
	public int addProduct(Product product) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "INSERT INTO products"
					+ "(name, description,catergory_id,image_url,price, status) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, product.getName());
			ps.setString(2, product.getDescription());
			ps.setInt(3, product.getCategoryId());
			ps.setString(4, product.getImageUrl());
			ps.setDouble(5, product.getPrice());
			ps.setString(6, product.getStatus());
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
	public List<ProductViewDTO> getProductViewFromOrder(int orderId) {
		Connection conn = null;
		List<ProductViewDTO> resultList = new ArrayList<ProductViewDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT p.product_id, p.name, oi.quantity, p.price AS current_price FROM order_items oi JOIN products p ON oi.product_id = p.product_id WHERE oi.order_id = ?;";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, orderId);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				ProductViewDTO p = new ProductViewDTO();
				p.setProductViewId(result.getInt("product_id"));
				p.setProductName(result.getString("name"));
				p.setQuantity(result.getInt("quantity"));
				p.setPrice(result.getDouble("current_price"));
				resultList.add(p);
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
