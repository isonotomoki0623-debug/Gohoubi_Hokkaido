package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.Achievement;
import com.example.demo.entity.User;

@Mapper
public interface MypageMapper {

	User findByUserId(int id);

	Integer getTotalAmount(int userId);

	//ユーザーランキング
	Integer getUserRank(int userId);

	Integer getUserCount();

	Achievement newAchievement(int userId);
}
