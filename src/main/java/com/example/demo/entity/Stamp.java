package com.example.demo.entity;

import java.sql.Date;

import lombok.Data;

//@Data
//public class Stamp {
//
//	private boolean isAcquired;
//	private int userId;
//	private int areaId;
//	private Date unlockedDate;
//}
@Data
public class Stamp {

    private int userId;       // 使わなくてもOK（残してもいい）
    private int areaId;

    private String name;
    private String imagePath;

    private boolean isAcquired;

    private Date unlockedAt;
}