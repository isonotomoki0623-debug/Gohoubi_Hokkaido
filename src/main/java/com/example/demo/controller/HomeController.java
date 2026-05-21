package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.entity.Achievement;
import com.example.demo.entity.Product;
import com.example.demo.entity.User;
import com.example.demo.mapper.MypageMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;

@Controller
public class HomeController {

	private final UserService userService;

	private ProductMapper productMapper;
	private UserMapper userMapper;
	private MypageMapper mypageMapper;

	//マッパーインターフェースをインスタンス化
	public HomeController(ProductMapper productMapper,
			UserMapper userMapper, UserService userService, MypageMapper mypageMapper) {

		this.productMapper = productMapper;
		this.userMapper = userMapper;
		this.userService = userService;
		this.mypageMapper = mypageMapper;
	}

	@GetMapping("/")
	public String home(HttpSession session, Model model) {

		User loginUser = userService.getLoginUser(session);
		model.addAttribute("user", loginUser);
		// おすすめ商品を取得		
		if (!userService.isLogined(session)) {
			List<Product> recommendProducts = productMapper.findRecommend3();
			model.addAttribute("recommendProducts", recommendProducts);
		} else {
			List<Product> recommendProducts = productMapper
					.findRecommend(userService.getLoginUser(session).getJob_id());
			model.addAttribute("recommendProducts", recommendProducts);
		}

		//次のレベルまでの金額を表示&user情報を取得
		if (loginUser != null) {
			User user = mypageMapper.findByUserId(loginUser.getId());
			Achievement achievement = mypageMapper.newAchievement(user.getId());
			model.addAttribute("achievement", achievement);
			model.addAttribute("user", user);
			Integer totalAmount = mypageMapper.getTotalAmount(loginUser.getId());
			Integer remainAmount = 10000 - (totalAmount % 10000);

			model.addAttribute("remainAmount", remainAmount);

			//プログレスバー
			Integer progressPercent = 100 - ((remainAmount * 100) / 10000);

			if (progressPercent > 100) {
				progressPercent = 100;
			}
			model.addAttribute("progressPercent", progressPercent);
		}

		//商品の売上ランキングを取得
		List<Product> rankingProducts = productMapper.findProductsTop3();

		model.addAttribute("rankingProducts", rankingProducts);

		//ユーザーの購入金額ランキングを取得
		List<User> rankingUsers = userMapper.findUsersTop3();

		model.addAttribute("rankingUsers", rankingUsers);

		return "home";
	}
}
