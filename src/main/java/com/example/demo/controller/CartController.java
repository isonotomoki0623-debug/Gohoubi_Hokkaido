package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.CartItem;
import com.example.demo.entity.Product;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.service.CartService;
import com.example.demo.service.UserService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private UserService userService;

	/** カート一覧を表示する */
	@GetMapping("cart")
	public String showCart(HttpSession session, Model model) {

		if (!userService.isLogined(session)) {
			return "redirect:/login";
		}

		List<CartItem> cart = cartService.getCart(session);
		int total = cart.stream()
				.mapToInt(item -> item.getPrice() * item.getQuantity())
				.sum();

		List<Product> products = new ArrayList<>();
		for (CartItem c : cart) {
			products.add(productMapper.findById(c.getProductId()));
		}
		model.addAttribute("products", products);
		model.addAttribute("cart", cart);
		model.addAttribute("total", total);
		model.addAttribute("user", userService.getLoginUser(session));
		return "cart/cart";
	}

	@PostMapping("cart/add")
	@ResponseBody
	public String addToCart(@RequestParam("productId") int productId, @RequestParam("imagePath") String imagePath,
			HttpSession session,
			HttpServletRequest request) {
		Product product = productMapper.findById(productId);
		if (product != null) {
			cartService.addItem(session, product, imagePath);
		}
		//		return "redirect:" + request.getHeader("Referer");
		return "ok";
	}

	@PostMapping("cart/subtract")
	@ResponseBody
	public String subtractCart(@RequestParam("productId") int productId, HttpSession session,
			HttpServletRequest request) {
		Product product = productMapper.findById(productId);
		if (product != null) {
			cartService.subtractItem(session, product);
		}
		//		return "redirect:" + request.getHeader("Referer");
		return "ok";
	}

	@PostMapping("cart/remove")
	public String removeCart(@RequestParam("productId") int productId, HttpSession session,
			HttpServletRequest request) {
		cartService.remove(session, productId);
		return "redirect:" + request.getHeader("Referer");
	}
}
