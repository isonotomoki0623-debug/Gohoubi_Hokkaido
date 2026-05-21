package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.HokkaidoArea;
import com.example.demo.entity.Stamp;

@Mapper
public interface StampMapper {

	Stamp findStampByUserId(int userId, int areaId);

	HokkaidoArea findAreaId(int areaId);

	void insertStamp(int userId, int areaId);

	List<Stamp> findStampsByUserId(int userId);

	int countStamp(int userId);

}
