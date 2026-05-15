package com.example.demo.entity;

public class User {
	private int id;
	private String name;
	private String password;
	private String email;
	private int job_id;
	private int level;
	private int prefecture_id;
	private String role;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getJob_id() {
		return job_id;
	}

	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getPrefecture_id() {
		return prefecture_id;
	}

	public void setPrefecture_id(int prefecture_id) {
		this.prefecture_id = prefecture_id;
	}

	public String isRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
