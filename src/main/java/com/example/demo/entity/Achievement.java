package com.example.demo.entity;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Achievement {
	private int id;
	private String name;
	private String imagePath;
	private String description;
	private String methodName;
	private Integer userId;
	private LocalDate unlockedAt;

	public Achievement() {

	}

	public Achievement(String name, String imagePath, String description) {
		this.name = name;
		this.imagePath = imagePath;
		this.description = description;
	}
}
