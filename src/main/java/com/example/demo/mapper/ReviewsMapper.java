package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.Reviews;

@Mapper
public interface ReviewsMapper {
	// product_idからレビューを取得する
	List<Reviews> findById(int id);
}
