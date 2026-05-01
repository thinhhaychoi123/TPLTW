package me.nhom65.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import me.nhom65.model.Category;
import me.nhom65.util.DatabaseConnection;

public class CategoryDAO {
	public List<Category> getAll() {
		Connection conn = null;
		List<Category> resultList = new ArrayList<Category>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM categories");
			while (result.next()) {
				int categoryid = result.getInt("category_id");
				String name = result.getString("name");
				String description = result.getString("description");
				String parent_id = result.getString("parent_id");
				Timestamp create_at = result.getTimestamp("created_at");
				Category category = new Category(categoryid,name,description,parent_id,create_at);
				resultList.add(category);
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
