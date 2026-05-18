package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.entity.CartItem;
import com.example.demo.service.CartService;

@Controller
public class OrderController {

	@Autowired
	private CartService cartService;

	@GetMapping("/order")
	public String showOrder(HttpSession session, Model model) {
		//サービスを使ってカートを取得
		List<CartItem> cart = cartService.getCart(session);

		//合計金額の計算
		int totalPrice = cart.stream()
				.mapToInt(item -> item.getPrice() * item.getQuantity())
				.sum();

		//テンプレートにデータを渡す
		model.addAttribute("cart", cart);
		model.addAttribute("totalPrice", totalPrice);

		return "order/order";
	}

	@GetMapping("/Comp")
	public String showComp() {
		return "order/OrderCompleted.html";
	}

}
