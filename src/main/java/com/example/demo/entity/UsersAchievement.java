package com.example.demo.entity;

import java.util.Date;

import lombok.Data;

@Data
public class UsersAchievement {
    private int userId;
    private int achievementId;
    private Date unlockedAt;

    public UsersAchievement() {
    }

    public UsersAchievement(int userId, int achievementId) {
        this.userId = userId;
        this.achievementId = achievementId;
    }
}
 