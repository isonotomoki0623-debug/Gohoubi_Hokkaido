package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Coupon;
import com.example.demo.mapper.OrderMapper;

@Service
public class CouponService {
	@Autowired
	private OrderMapper orderMapper;

	public int calculateDiscountedPrice(int userId, int totalPrice, Integer couponId) {
		if (couponId != null) {
			Coupon coupon = orderMapper.findCoupon(couponId);
			totalPrice = (int) ((1 - coupon.getRate()) * totalPrice);
			System.out.println(coupon.getRate());
			orderMapper.deleteUserCoupon(userId, couponId);
		}
		return totalPrice;
	}

}
