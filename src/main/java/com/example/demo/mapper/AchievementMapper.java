package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.Achievement;
import com.example.demo.entity.UsersAchievement;

@Mapper
public interface AchievementMapper {
	List<Achievement> selectUnownedAchievement(int userId);

	List<Achievement> selectAchievement(int userId);

	void insertUsersAchievements(UsersAchievement usersAchievement);

	int countUserPurchases(int userId);

	int countUserPurchasesByCategory(int userId, String categoryName);

	int countUserPurcahsesCategory(int userId);

	int countUserPurchasesByCategoryByArea(int userId, String areaName);

	int countUserPurchasesByArea(int userId);

	int countUserPurchasesAmount(int userId);

	int countMyAchievement(int userId);
}
