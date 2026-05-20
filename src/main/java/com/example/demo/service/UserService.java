package com.example.demo.service;

import jakarta.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.entity.User;
import com.example.demo.entity.UserLevel;
import com.example.demo.form.sinkiForm;
import com.example.demo.mapper.UserMapper;

@Service
public class UserService {
	private final UserMapper userMapper;
	private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	public UserService(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public void register(sinkiForm form) {
		User user = new User();

		user.setName(form.getName());
		user.setEmail(form.getEmail());

		user.setPassword(passwordEncoder.encode(form.getPassword()));

		user.setJob_id(form.getJob_id());
		user.setPrefecture_id(form.getPrefectures_id());
		user.setRole("User");
		user.setLevel(1);

		userMapper.insert(user);
	}

	public boolean isLogined(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
			return false;
		}
		return true;
	}

	public User getLoginUser(HttpSession session) {
		return (User) session.getAttribute("loginUser");
	}

	//	public void register(sinkiForm form) {
	//		User user = new User();
	//        user.setName(form.getName());
	//        user.setEmail(form.getEmail());
	//        user.setPassword(passwordEncoder.encode(form.getPassword()));
	//        userMapper.insert(user);
	//		System.out.println(form.getName());
	//		System.out.println(form.getEmail());
	//		System.out.println(form.getPassword());
	//		System.out.println(form.getCategory());
	//		System.out.println(form.getPrefectures());

	// 登録情報のアップデート
	public void updateUser(User user, HttpSession session) {
		userMapper.update(user);
		session.setAttribute("loginUser", user);
	}

	public UserLevel calcLevel(User user, Integer totalamount) {
		UserLevel userLevel = new UserLevel();
		userLevel.setNowLevel(user.getLevel());
		userLevel.setUpLevel(totalamount / 10000);
		userLevel.setRemainAmount(10000 - (totalamount % 10000));
		return userLevel;
	}
}