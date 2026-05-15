package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.entity.User;

@Mapper
public interface UserMapper {

	/**　メールアドレスでユーザを検索する*/
	@Select("SELECT * FROM users WHERE email =#{email}")
	User findByEmail(String email);

	@Insert("INSERT INTO users(name, password , email, job_id, level,prefecture_id, role)"
			+ " VALUSE(#{name}, #{password}, #{email}, #{job_id}, #{level}, #{prefecture_id}, #{role})")
	void insert(User user);
}
