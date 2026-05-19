package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.CartItem;
import com.example.demo.entity.Coupon;
import com.example.demo.entity.Order;

@Mapper
public interface OrderMapper {
	void InsertOrder(Order order);

	void InsertOrderItems(CartItem cart, int orderId);

	List<Coupon> hasCoupons(int userId);
}
