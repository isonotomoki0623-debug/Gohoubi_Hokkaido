package com.example.demo.entity;

import lombok.Data;

@Data
public class Product {

	private int id;
	private String name;
	private int price;
	private int stock;
	private int reviewSum;
	private double reviewStar;
	private int productCategoryId;
	private String productCategoryName;
	private int hokkaidoAreaId;
	private String hokkaidoAreaName;
	private int userId;
	private int shippingInterval;

	private String imagePath;

}