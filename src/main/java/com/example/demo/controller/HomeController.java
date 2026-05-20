package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.entity.Product;
import com.example.demo.entity.User;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;

@Controller
public class HomeController {

	private final UserService userService;

	private ProductMapper productMapper;
	private UserMapper userMapper;

	//マッパーインターフェースをインスタンス化
	public HomeController(ProductMapper productMapper,
			UserMapper userMapper, UserService userService) {

		this.productMapper = productMapper;
		this.userMapper = userMapper;
		this.userService = userService;
	}

	@GetMapping("/")
	public String home(HttpSession session, Model model) {

		// おすすめ商品を取得		
		if (!userService.isLogined(session)) {
			List<Product> recommendProducts = productMapper.findRecommend3();
			model.addAttribute("recommendProducts", recommendProducts);
		} else {
			List<Product> recommendProducts = productMapper
					.findRecommend(userService.getLoginUser(session).getJob_id());
			model.addAttribute("recommendProducts", recommendProducts);
		}

		//商品の売上ランキングを取得
		List<Product> rankingProducts = productMapper.findProductsTop3();

		model.addAttribute("rankingProducts", rankingProducts);

		//ユーザーの購入金額ランキングを取得
		List<User> rankingUsers = userMapper.findUsersTop3();

		model.addAttribute("rankingUsers", rankingUsers);

		model.addAttribute("user", userService.getLoginUser(session));

		return "home";
	}
}
