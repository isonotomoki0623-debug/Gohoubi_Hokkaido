package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.entity.CartItem;

@Service
public class OrderService {

	public void insertOrder(List<CartItem> cart, int userId) {
		for (CartItem cartItem : cart) {

		}
	}
}
