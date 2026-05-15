package com.example.demo.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entity.User;
import com.example.demo.form.LoginForm;
import com.example.demo.mapper.UserMapper;

@Controller
public class AuthController {

	private final UserMapper userMapper;
	private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	public AuthController(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	//ログイン画面を表示
	@GetMapping("/login")
	public String showLoginForm(Model model) {
		//		System.out.println(passwordEncoder.encode("Takeru123"));
		//		System.out.println(passwordEncoder.encode("Yuki123"));
		//		System.out.println(passwordEncoder.encode("Yurika123"));
		//		System.out.println(passwordEncoder.encode("Tomoki123"));
		//		System.out.println(passwordEncoder.encode("Shun123"));
		model.addAttribute("form", new LoginForm());
		return "auth/login";
	}

	//ログイン処理を行う
	@PostMapping("/login")
	public String login(
			@Validated @ModelAttribute("form") LoginForm form,
			BindingResult bindingResult,
			HttpSession session,
			Model model) {

		if (bindingResult.hasErrors()) {
			return "auth/login";
		}

		//DBからユーザを検索する
		User user = userMapper.findByEmail(form.getEmail());

		if (user == null || !passwordEncoder.matches(form.getPassword(), user.getPassword())) {
			model.addAttribute("loginError", "メールアドレスまたはパスワードが違います");
			return "auth/login";
		}

		//ログイン成功：セッションにユーザ情報を保存する
		session.setAttribute("loginUser", user);
		return "redirect:/";
	}

	//ログアウト処理を行う
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect;/login";
	}

}
