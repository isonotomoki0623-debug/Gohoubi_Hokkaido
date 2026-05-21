package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

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
			orderMapper.updateUserCoupon(userId, couponId);
		}
		return totalPrice;
	}

	public List<Coupon> getLevelCoupons(Integer nowLevel, Integer upLevel, int userId) {
		List<Coupon> newCoupons = new ArrayList<>();
		for (int level = nowLevel; level <= upLevel; level++) {
			Integer couponId = null;
			if (level == 20) {
				couponId = 1;
			}
			if (level == 40) {
				couponId = 2;
			}
			if (level == 60) {
				couponId = 3;
			}
			if (couponId != null) {
				orderMapper.insertCoupon(userId, couponId);
				newCoupons.add(orderMapper.findCoupon(couponId));
			}
		}
		return newCoupons;
	}

}
