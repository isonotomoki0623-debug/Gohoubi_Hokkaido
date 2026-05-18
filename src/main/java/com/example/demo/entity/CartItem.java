package com.example.demo.entity;

import lombok.Data;

@Data
public class CartItem {
	private int productId;
	private String name;
	private int price;
	private int categoryId;
	private int areaId;
	private int quantity;
	private String imagePath;

	public CartItem() {
	}

	public CartItem(int productId, String name, int price, int categoryId, int areaId, String imagePath) {
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.categoryId = categoryId;
		this.areaId = areaId;
		this.imagePath = imagePath;
		this.quantity = 1;
	}

	public void incrementQuantity() {
		this.quantity++;
	}

	public int getSubtotal() {
		return price * quantity;
	}

}
