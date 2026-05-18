package com.example.demo.entity;

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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getReviewSum() {
		return reviewSum;
	}

	public void setReviewSum(int reviewSum) {
		this.reviewSum = reviewSum;
	}

	public double getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(double reviewStar) {
		this.reviewStar = reviewStar;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	public int getHokkaidoAreaId() {
		return hokkaidoAreaId;
	}

	public void setHokkaidoAreaId(int hokkaidoAreaId) {
		this.hokkaidoAreaId = hokkaidoAreaId;
	}

	public String getHokkaidoAreaName() {
		return hokkaidoAreaName;
	}

	public void setHokkaidoAreaName(String hokkaidoAreaName) {
		this.hokkaidoAreaName = hokkaidoAreaName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getShippingInterval() {
		return shippingInterval;
	}

	public void setShippingInterval(int shippingInterval) {
		this.shippingInterval = shippingInterval;
	}
}