package com.example.demo.entity;

import lombok.Data;

@Data
public class CartItem {
	private int productId;
	private String name;
	private int price;
	private String categoryId;
	private String areaId;
	private int quantity;

	public CartItem() {
	}

	public CartItem(int productId, String name, int price, String categoryId, String areaId, int quantity) {
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.categoryId = categoryId;
		this.areaId = areaId;
		this.quantity = quantity;
	}

}
