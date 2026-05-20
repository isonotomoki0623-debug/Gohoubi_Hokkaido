package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Achievement;
import com.example.demo.entity.CartItem;
import com.example.demo.entity.Coupon;
import com.example.demo.entity.Order;
import com.example.demo.entity.User;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.service.AchievementService;
import com.example.demo.service.CartService;
import com.example.demo.service.CouponService;
import com.example.demo.service.OrderService;
import com.example.demo.service.UserService;

@Controller
public class OrderController {

	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;
	@Autowired
	private AchievementService achievementService;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CouponService couponService;

	@GetMapping("/order")
	public String showOrder(HttpSession session, Model model) {
		//サービスを使ってカートを取得
		List<CartItem> cart = cartService.getCart(session);

		//合計金額の計算
		int totalPrice = cart.stream()
				.mapToInt(item -> item.getPrice() * item.getQuantity())
				.sum();
		User user = userService.getLoginUser(session);
		List<Coupon> hasCoupons = orderMapper.hasCoupons(user.getId());

		//テンプレートにデータを渡す
		model.addAttribute("coupon", new Coupon());
		model.addAttribute("myCoupons", hasCoupons);
		model.addAttribute("cart", cart);
		model.addAttribute("totalPrice", totalPrice);

		return "order/order";
	}

	@PostMapping("/order")
	public String showComp(Order order, HttpSession session, Model model,
			@RequestParam(value = "couponId", required = false) Integer couponId) {
		List<CartItem> cart = cartService.getCart(session);
		User user = userService.getLoginUser(session);
		int userId = user.getId();
		int totalPrice = cartService.getTotalPrice(session);

		//クーポン適用後の金額を計算
		totalPrice = couponService.calculateDiscountedPrice(userId, totalPrice, couponId);
		order.setUserId(userId);
		order.setTotalAmount(totalPrice);
		order.setCouponId(couponId);

		//orderテーブルに新規追加
		orderMapper.InsertOrder(order);
		int orderId = order.getId();
		//order_itemsテーブルに新規追加
		for (CartItem cartItem : cart) {
			orderMapper.InsertOrderItems(cartItem, orderId);
		}
		List<Achievement> achievements = achievementService.checkAchievement(userId, session);
		session.removeAttribute("cart");
		model.addAttribute("achievements", achievements);
		return "order/orderCompleted";
	}

}
