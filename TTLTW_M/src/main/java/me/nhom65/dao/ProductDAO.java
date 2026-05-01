package me.nhom65.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM products");
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
			stmt.close();
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
