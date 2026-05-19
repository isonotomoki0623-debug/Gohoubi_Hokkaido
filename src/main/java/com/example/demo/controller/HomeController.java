package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.entity.Product;
import com.example.demo.mapper.ProductMapper;

@Controller
public class HomeController {

	private ProductMapper productMapper;

	//インターフェースをインスタンス化
	public HomeController(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	@GetMapping("/")
	public String home(Model model) {

		// おすすめ商品を取得
		List<Product> recommendProducts = productMapper.findTop3();

		model.addAttribute("recommendProducts", recommendProducts);

		return "home";
	}
}
