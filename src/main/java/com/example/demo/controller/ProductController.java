package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Product;
import com.example.demo.entity.ProductImages;
import com.example.demo.mapper.ProductImagesMapper;
import com.example.demo.mapper.ProductMapper;

@Controller
public class ProductController {

	private final ProductMapper productMapper;
	private final ProductImagesMapper productImagesMapper;

	public ProductController(ProductMapper productMapper, ProductImagesMapper productImagesMapper) {
		this.productMapper = productMapper;
		this.productImagesMapper = productImagesMapper;
	}

	//商品詳細
	@GetMapping("/products/{id}")
	public String showDetail(@PathVariable("id") int id, Model model) {

		Product product = productMapper.findById(id);
		model.addAttribute("product", product);

		List<ProductImages> productImages = productImagesMapper.findByProductId(id);
		model.addAttribute("productImages", productImages);
		return "product/detail";
	}

	//商品一覧
	@GetMapping("/products")
	public String showList(
			@RequestParam(defaultValue = "1") int page,
			Model model) {

		int pageSize = 8;

		int offset = (page - 1) * pageSize;

		List<Product> products = productMapper.findPage(offset, pageSize);

		int totalCount = productMapper.countAll();

		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		model.addAttribute("products", products);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "product/list";
	}

}
