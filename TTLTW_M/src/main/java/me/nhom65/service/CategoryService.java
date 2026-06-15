package me.nhom65.service;

import java.util.List;

import me.nhom65.dao.CategoryDAO;
import me.nhom65.model.Category;

public class CategoryService {

	private CategoryDAO dao;
	
	public CategoryService() {
		this.dao = new CategoryDAO();
	}
	
	public List<Category> getAllCategory(){
		return dao.getAll();
	}

	public boolean addCategory(Category category) {
		int id = dao.addCategory(category);
		return id > 0;
	}
	public boolean updateCategory(Category category) {
		boolean updated = dao.updateCategory(category);
		return updated;
	}

	public boolean deleteCategory(int categoryId) {
		boolean deleted = dao.deleteCategory(categoryId);
		return deleted;
	}
	
	
}
