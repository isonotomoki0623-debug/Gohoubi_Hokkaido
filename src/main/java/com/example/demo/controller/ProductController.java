package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.entity.Product;
import com.example.demo.entity.ProductImages;
import com.example.demo.entity.Reviews;
import com.example.demo.mapper.ProductImagesMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.ReviewsMapper;

@Controller
public class ProductController {

	private final ProductMapper productMapper;
	private final ProductImagesMapper productImagesMapper;
	private final ReviewsMapper reviewsMapper;

	public ProductController(ProductMapper productMapper, ProductImagesMapper productImagesMapper,
			ReviewsMapper reviewsMapper) {
		this.productMapper = productMapper;
		this.productImagesMapper = productImagesMapper;
		this.reviewsMapper = reviewsMapper;
	}

	@GetMapping("/products/{id}")
	public String showDetail(@PathVariable("id") int id, Model model) {

		Product product = productMapper.findById(id);
		model.addAttribute("product", product);

		List<ProductImages> productImages = productImagesMapper.findByProductId(id);
		model.addAttribute("productImages", productImages);

		List<Reviews> reviews = reviewsMapper.findById(id);
		model.addAttribute("reviews", reviews);

		double averageStar = reviews.stream()
				.mapToDouble(Reviews::getStar)
				.average()
				.orElse(0.0);
		model.addAttribute("averageStar", averageStar);

		return "product/detail";
	}

}
