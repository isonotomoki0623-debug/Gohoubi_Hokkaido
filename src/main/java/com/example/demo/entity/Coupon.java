package com.example.demo.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class Coupon {
	private int id;
	private String name;
	private Date expirationDate;
	private double rate;
}
