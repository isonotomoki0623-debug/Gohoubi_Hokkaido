package com.example.demo.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class Stamp {

	private int userId;
	private int areaId;
	private Date unlockedDate;
}
