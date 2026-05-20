package com.example.demo.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entity.User;
import com.example.demo.mapper.MypageMapper;
import com.example.demo.service.UserService;

@Controller
public class MyPageController {

	@Autowired
	private UserService userService;

	@Autowired
	private MypageMapper mypageMapper;

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
}
