package com.example.demo.entity;

import lombok.Data;

@Data
public class Reviews {

	private int userId;
	private int productId;
	private double star;
	private String description;
	private String userName;

	private User user;

}
