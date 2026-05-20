package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entity.Achievement;
import com.example.demo.entity.Coupon;
import com.example.demo.entity.User;
import com.example.demo.mapper.AchievementMapper;
import com.example.demo.mapper.MypageMapper;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.service.UserService;

@Controller
public class MyPageController {

	@Autowired
	private UserService userService;
	@Autowired
	private AchievementMapper achievementMapper;
	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private OrderMapper orderMapper;

	@GetMapping("/profile")
	public String showProfile(HttpSession session, Model model) {

		if (!userService.isLogined(session)) {
			return "redirect:/login";
		}

		User loginUser = (User) session.getAttribute("loginUser");

		User user = mypageMapper.findByUserId(loginUser.getId());

		model.addAttribute("user", user);

		Integer totalAmount = mypageMapper.getTotalAmount(loginUser.getId());

		model.addAttribute("totalAmount", totalAmount);

		Integer userRank = mypageMapper.getUserRank(loginUser.getId());

		Integer userCount = mypageMapper.getUserCount();

		model.addAttribute("userRank", userRank);
		model.addAttribute("userCount", userCount);

		List<Coupon> hasCoupons = orderMapper.hasCoupons(loginUser.getId());

		//次のレベルまでの金額を表示
		Integer remainAmount = 10000 - (totalAmount % 10000);

		model.addAttribute("hasCoupons", hasCoupons);
		model.addAttribute("remainAmount", remainAmount);

		//プログレスバー
		Integer progressPercent = 100 - ((remainAmount * 100) / 10000);

		if (progressPercent > 100) {
			progressPercent = 100;
		}
		model.addAttribute("progressPercent", progressPercent);

		model.addAttribute("user", userService.getLoginUser(session));

		return "profile";
	}

	@GetMapping("/edit")
	public String showEditForm(HttpSession session, Model model) {

		if (!userService.isLogined(session)) {
			return "redirect:/login";
		}

		model.addAttribute("user", userService.getLoginUser(session));
		return "/edit";
	}

	@PostMapping("/update")
	public String updateUser(@ModelAttribute User user, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login";
		}
		user.setId(loginUser.getId());

		userService.updateUser(user, session);

		return "redirect:/profile";
	}

	@GetMapping("/achievements")
	public String showAchievements(HttpSession session, Model model) {

		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login";
		}

		List<Achievement> achievements = achievementMapper.selectAchievement(loginUser.getId());

		model.addAttribute("achievements", achievements);
		model.addAttribute("user", userService.getLoginUser(session));

		return "achievement";
	}
}
