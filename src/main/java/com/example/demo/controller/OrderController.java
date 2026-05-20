package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Achievement;
import com.example.demo.entity.CartItem;
import com.example.demo.entity.Coupon;
import com.example.demo.entity.HokkaidoArea;
import com.example.demo.entity.Order;
import com.example.demo.entity.User;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.service.AchievementService;
import com.example.demo.service.CartService;
import com.example.demo.service.StampService;
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
	private StampService stampService;
	private OrderService orderService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private ProductMapper productMapper;

	@GetMapping("/order")
	public String showOrder(HttpSession session, Model model) {
		//サービスを使ってカートを取得
		List<CartItem> cart = cartService.getCart(session);

		if (!userService.isLogined(session)) {
			return "redirect:/login";
		}

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
			productMapper.decrementStock(cartItem.getProductId(), cartItem.getQuantity());
		}

		if (couponId != null) {
			orderMapper.deleteUserCoupon(userId, couponId);
		}
		List<HokkaidoArea> hokkaidoAreas = stampService.insertStamp(cart, userId);
		List<Achievement> achievements = achievementService.checkAchievement(userId, session);
		model.addAttribute("hokkaidoAreas", hokkaidoAreas);

		List<Achievement> achievements = achievementService.checkAchievement(userId, session);
		session.removeAttribute("cart");
		model.addAttribute("achievements", achievements);
		return "order/orderCompleted";
	}
	
	
	@GetMapping("/orders")
	public String showHistory(HttpSession session, Model model) {

	    User user = userService.getLoginUser(session);

	    if (user == null) {
	        return "redirect:/login";
	    }

	    List<Order> orders =
	        orderMapper.findOrdersByUserId(user.getId());

	    model.addAttribute("orders", orders);

	    return "order/orders";
	}
	
	@GetMapping("/order/detail/{id}")
	public String orderDetail(@PathVariable int id, Model model, HttpSession session) {

	    User user = userService.getLoginUser(session);
	    if (user == null) {
	        return "redirect:/login";
	    }

	    Order order = orderMapper.findOrderById(id);

	    // 他人の注文を見れないように制御（重要）
	    if (order == null || order.getUserId() != user.getId()) {
	        return "redirect:/orders";
	    }

	    List<CartItem> items = orderMapper.findOrderItemsByOrderId(id);

	    model.addAttribute("order", order);
	    model.addAttribute("items", items);

	    return "order/orderDetail";
	}


	@PostMapping("/order/calculate-discount")
	@org.springframework.web.bind.annotation.ResponseBody // 画面ではなく「データそのもの」を返すアノテーション
	public int calculateDiscount(
			@RequestParam(value = "couponId", required = false) Integer couponId,
			HttpSession session) {

		User user = userService.getLoginUser(session);
		// カートの合計金額を再計算
		int totalPrice = cartService.getTotalPrice(session);
		Coupon coupon = orderMapper.findCoupon(couponId);

		if (couponId != null && user != null) {
			// 既存の couponService を使って割引後金額を計算
			totalPrice = (int) ((1 - coupon.getRate()) * totalPrice);
			;
		}

		return totalPrice; // 計算後の金額（数字）だけをそのまま返す
	}

}
