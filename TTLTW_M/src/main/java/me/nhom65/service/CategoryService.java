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
	
	
}
