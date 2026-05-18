package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.CartItem;
import com.example.demo.entity.Product;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductMapper productMapper;
	
	/** カート一覧を表示する */
    @GetMapping("cart")
    public String showCart(HttpSession session, Model model) {
        List<CartItem> cart = cartService.getCart(session);
        int total = cart.stream()
                .mapToInt(item -> item.getPrice() * item.getQuantity())
                .sum();
        model.addAttribute("cart", cart);
        model.addAttribute("total", total);
        return "cart/cart";
    }

	@PostMapping("cart/add")
	public String addToCart(@RequestParam("productId") int productId,
			HttpSession session,
			HttpServletRequest request) {
		Product product = productMapper.findById(productId);
		if (product != null) {
			cartService.addItem(session, product);
		}
		return "redirect:" + request.getHeader("Referer");
	}
}
