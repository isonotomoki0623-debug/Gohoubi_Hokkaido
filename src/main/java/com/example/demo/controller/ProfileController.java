//package com.example.demo.controller;
//
//import jakarta.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import com.example.demo.service.UserService;
//
//@Controller
//public class ProfileController {
//
//	@Autowired
//	private UserService userService;
//
//	@GetMapping("/profile")
//	public String showProfile(Model model, HttpSession session) {
//		model.addAttribute("user", userService.getLoginUser(session));
//		return "profile";
//	}
//}
