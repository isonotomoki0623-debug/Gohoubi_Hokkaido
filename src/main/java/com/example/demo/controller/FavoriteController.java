package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest; // ★リファラー用に追記
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Product;
import com.example.demo.entity.User;
import com.example.demo.mapper.FavoriteMapper;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteMapper favoriteMapper;

	// お気に入り一覧画面を表示
	@GetMapping("/favorites")
	public String showFavorite(HttpSession session, Model model) {

		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login";
		}

		List<Product> products = favoriteMapper.findFavoritesByUserId(loginUser.getId());
		model.addAttribute("products", products);

		return "favorite";
	}

	// お気に入り登録・解除のトグル処理
	@PostMapping("/products/favorite/toggle")
	public String toggleFavorite(@RequestParam int productId, HttpSession session, HttpServletRequest request) { // ★引数を追記

		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login";
		}

		int userId = loginUser.getId();

		int count = favoriteMapper.countFavorite(userId, productId);

		if (count == 0) {
			favoriteMapper.insert(userId, productId);
		} else {
			favoriteMapper.delete(userId, productId);
		}

		// ★ 遷移元のURLをチェックしてリダイレクト先を分ける
		String referer = request.getHeader("Referer");
		if (referer != null && referer.contains("/favorites")) {
			return "redirect:/favorites"; // 一覧から押されたら一覧にリロード
		}

		return "redirect:/products/" + productId; // 詳細から押されたら詳細に戻る
	}
}