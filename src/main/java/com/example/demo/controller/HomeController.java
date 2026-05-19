package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.entity.Product;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.UserMapper;

@Controller
public class HomeController {

	private ProductMapper productMapper;
	private UserMapper userMapper;

	//マッパーインターフェースをインスタンス化
	public HomeController(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	public HomeController(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@GetMapping("/")
	public String home(Model model) {

		// おすすめ商品を取得
		List<Product> recommendProducts = productMapper.findRecommend3();

		model.addAttribute("recommendProducts", recommendProducts);

		//商品の売上ランキングを取得
		List<Product> rankingProducts = productMapper.findProductsTop3();

		model.addAttribute("rankingProducts", rankingProducts);

		//ユーザーの購入金額ランキングを取得
		List<Product> rankingUsers = userMapper.findUsersTop3();

		model.addAttribute("rankingProducts", rankingProducts);

		return "home";
	}
}
