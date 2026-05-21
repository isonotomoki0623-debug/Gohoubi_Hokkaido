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

import com.example.demo.entity.Product;
import com.example.demo.entity.ProductImages;
import com.example.demo.entity.Reviews;
import com.example.demo.entity.User;
import com.example.demo.mapper.FavoriteMapper;
import com.example.demo.mapper.ProductImagesMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.ReviewsMapper;
import com.example.demo.service.CartService;
import com.example.demo.service.UserService;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private ProductImagesMapper productImagesMapper;
	@Autowired
	private ReviewsMapper reviewsMapper;
	@Autowired
	private FavoriteMapper favoriteMapper;
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;

	// 商品詳細
	@GetMapping("/products/{id}")
	public String showDetail(@PathVariable("id") int id, HttpSession session, Model model) {

		Product product = productMapper.findById(id);
		model.addAttribute("product", product);

		List<ProductImages> productImages = productImagesMapper.findByProductId(id);
		model.addAttribute("productImages", productImages);

		List<Reviews> reviews = reviewsMapper.findById(id);
		model.addAttribute("reviews", reviews);

		product.setReviewSum(reviews.size());

		double averageStar = reviews.stream()
				.mapToDouble(Reviews::getStar)
				.average()
				.orElse(0.0);

		int cartCount = cartService.cartItemCount(session);

		User loginUser = userService.getLoginUser(session);
		boolean isFavorite = false;

		Reviews myReview = null;

		if (loginUser != null) {
			int count = favoriteMapper.countFavorite(loginUser.getId(), id);
			isFavorite = (count > 0);

			List<Reviews> myReviewsList = reviewsMapper.isReview(loginUser.getId(), id);
			if (!myReviewsList.isEmpty()) {
				myReview = myReviewsList.get(0);
			}
		}

		model.addAttribute("averageStar", averageStar);
		model.addAttribute("cartCount", cartCount);
		model.addAttribute("isFavorite", isFavorite);
		model.addAttribute("myReview", myReview);
		model.addAttribute("user", loginUser);

		return "product/detail";
	}

	/** レビュー **/
	@PostMapping("/products/reviews")
	public String createReviews(@RequestParam int productId, @RequestParam double star,
			@RequestParam String description, HttpSession session) {

		if (!userService.isLogined(session)) {
			return "redirect:/login";
		}

		User loginUser = (User) session.getAttribute("loginUser");

		Reviews review = new Reviews();

		// ログインユーザーから取得
		review.setUserId(loginUser.getId());

		review.setProductId(productId);
		review.setStar(star);
		review.setDescription(description);

		List<Reviews> reviewsList = reviewsMapper.isReview(loginUser.getId(), productId);

		if (reviewsList.size() == 0) {
			reviewsMapper.insert(review);
		} else {
			reviewsMapper.update(review);
		}

		return "redirect:/products/" + productId;
	}

	/** 商品一覧 **/
	@GetMapping("/products")
	public String showList(
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false) Integer categoryId,
			HttpSession session,
			Model model) {

		int pageSize = 16;
		int offset = (page - 1) * pageSize;

		List<Product> products;
		int totalCount;

		products = productMapper.findPage(keyword, categoryId, offset, pageSize);
		totalCount = productMapper.countAll(keyword, categoryId);

		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		int cartCount = cartService.cartItemCount(session);

		model.addAttribute("cartCount", cartCount);
		model.addAttribute("products", products);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("keyword", keyword);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("user", userService.getLoginUser(session));

		return "product/list";
	}

}
