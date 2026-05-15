package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.form.sinkiForm;
import com.example.demo.service.UserService;

@Controller
public class sinkiController {
	private final UserService userService;

	public sinkiController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/register")
	public String showForm(Model model) {
		model.addAttribute("form", new sinkiForm());
		return "sinki/register";
	}

	@PostMapping("/register")
	public String submitForm(
			@Validated @ModelAttribute("form") sinkiForm form,
			BindingResult bindingResult,
			Model model) {

		if (bindingResult.hasErrors()) {
			return "sinki/register"; // エラー時はフォームに戻す
		}

		//	@PostMapping("/register")
		//	public String submitForm(@Validated @ModelAttribute sinkiForm form, Model model) {
		//		// まとめて受け取れているか確認
		userService.register(form);

		model.addAttribute("form", form);
		return "redirect:/";
	}
}