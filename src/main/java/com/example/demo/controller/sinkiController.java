package com.example.demo.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entity.User;
import com.example.demo.form.sinkiForm;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;

@Controller
public class sinkiController {
	private final UserService userService;
	private final UserMapper userMapper;

	public sinkiController(UserService userService, UserMapper userMapper) {
		this.userService = userService;
		this.userMapper = userMapper;
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
			HttpSession session,
			Model model) {
		// バリデーション
		if (bindingResult.hasErrors()) {
			return "sinki/register";
		}

		// メール重複チェック
		User user = userMapper.findByEmail(form.getEmail());

		if (user != null) {

			bindingResult.rejectValue(
					"email",
					"duplicate",
					"このメールアドレスは既に使用されています");
		}

		// エラー時
		if (bindingResult.hasErrors()) {
			return "sinki/register";
		}

		// 登録
		userService.register(form);
		user = userMapper.findByEmail(form.getEmail());
		// 登録後に再取得
		User real = userMapper.findByUserid(user.getId());
		// セッション保存
		session.setAttribute("loginUser", real);

		return "redirect:/";
	}
}