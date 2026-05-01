package me.nhom65.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Category {
	
	
	private int categoryId;
	private String name;
	private String description;
	private String parentId;
	private Timestamp createdAt;
	
	private List<Category> children = new ArrayList<>();

	public Category(int categoryId, String name, String description, String parentId, Timestamp createdAt) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		this.description = description;
		this.parentId = parentId;
		this.createdAt = createdAt;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public String getParentId() {
		return parentId;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public List<Category> getChildren() {
		return children;
	}
	
	

}
