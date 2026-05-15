package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.entity.Product;
import com.example.demo.mapper.ProductMapper;

@Controller
public class ProductController {

	private final ProductMapper productMapper;

	public ProductController(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	@GetMapping("/products/{id}")
	public String showDetail(@PathVariable("id") int id, Model model) {
		Product product = productMapper.findById(id);
		model.addAttribute("product", product);
		return "product/detail";
	}

}
