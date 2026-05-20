package com.example.demo.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private int id;
	private int userId;
	private Date buyAt;
	private int totalAmount;
	private boolean status;
	private int couponId;
	
    private String couponName;
 // getter / setter も追加
    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
    }
	private Integer couponId;
}
