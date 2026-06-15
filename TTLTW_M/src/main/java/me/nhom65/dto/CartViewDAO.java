package me.nhom65.dto;

public class CartViewDAO {

	  private int cartItemId;
	  private int cartId;
	  private int productId;
	  private String productName;
	  private double productPrice;
	  private int quantity;
	  private double totalPrice;
	  
	  
	  public CartViewDAO(int cartItemId,int cartId, int productId, String productName, double productPrice,
			int quantity) {
		super();
		this.cartItemId = cartItemId;
		this.cartId = cartId;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.quantity = quantity;
		this.totalPrice = productPrice * quantity;
	}

	  public int getCartItemId() {
		  return cartItemId;
	  }

	  public void setCartItemId(int cartItemId) {
		  this.cartItemId = cartItemId;
	  }

	  public int getProductId() {
		  return productId;
	  }

	  public void setProductId(int productId) {
		  this.productId = productId;
	  }

	  public String getProductName() {
		  return productName;
	  }

	  public void setProductName(String productName) {
		  this.productName = productName;
	  }


	  public double getProductPrice() {
		  return productPrice;
	  }

	  public void setProductPrice(double productPrice) {
		  this.productPrice = productPrice;
	  }

	  public int getQuantity() {
		  return quantity;
	  }

	  public void setQuantity(int quantity) {
		  this.quantity = quantity;
	  }

	  public double getTotalPrice() {
		  return totalPrice;
	  }
	  public int getCartId() {
			return cartId;
	  }
	
}
