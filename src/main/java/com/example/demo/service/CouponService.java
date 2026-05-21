package com.example.demo.service;

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

	public List<Coupon> getLevelCoupons(List<Coupon> coupons, Integer nowLevel, Integer upLevel, int userId) {
		for (int level = nowLevel + 1; level <= upLevel; level++) {
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
				coupons.add(orderMapper.findCoupon(couponId));
			}
		}
		return coupons;
	}

	public List<Coupon> getStampCoupons(List<Coupon> coupons, int myStampCount, int newStampCount, int userId) {
		for (int count = myStampCount + 1; count <= myStampCount + newStampCount; count++) {
			Integer couponId = null;
			if (count == 3) {
				couponId = 4;
			}
			if (count == 6) {
				couponId = 5;
			}
			if (count == 9) {
				couponId = 6;
			}
			if (couponId != null) {
				orderMapper.insertCoupon(userId, couponId);
				coupons.add(orderMapper.findCoupon(couponId));
			}
		}
		return coupons;
	}

	public List<Coupon> getAchievementCoupons(List<Coupon> coupons, int myAchievementCount, int newAchievementCount,
			int userId) {
		for (int count = myAchievementCount; count <= myAchievementCount + newAchievementCount; count++) {
			Integer couponId = null;
			if (count == 5) {
				couponId = 7;
			}
			if (count == 10) {
				couponId = 8;
			}
			if (count == 15) {
				couponId = 9;
			}
			if (couponId != null) {
				orderMapper.insertCoupon(userId, couponId);
				coupons.add(orderMapper.findCoupon(couponId));
			}
		}
		return coupons;
	}

}
