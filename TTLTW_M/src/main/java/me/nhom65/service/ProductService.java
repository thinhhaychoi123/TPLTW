package me.nhom65.service;

import java.util.List;

import me.nhom65.dao.ProductDAO;
import me.nhom65.dto.ProductViewDTO;
import me.nhom65.model.Product;

public class ProductService {

	private ProductDAO dao;
	
	public ProductService() {
		this.dao = new ProductDAO();
	}
	
	public List<Product> getAllProducts(){
		return dao.getAllProducts();
	}
	
	public Product getProductFromId(int id) {
		return dao.getProductById(id);
	}
	
	public List<ProductViewDTO> getAllProductsFromOrder(int orderId){
		return dao.getProductViewFromOrder(orderId);
	}
	
}
