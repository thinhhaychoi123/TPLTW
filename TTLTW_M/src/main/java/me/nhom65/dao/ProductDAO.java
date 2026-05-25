package me.nhom65.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
				p.setQuantity(result.getInt("quantity")); 
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
				p.setQuantity(result.getInt("quantity")); 
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
}
