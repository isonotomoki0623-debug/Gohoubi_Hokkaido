package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.entity.Reviews;

@Mapper
public interface ReviewsMapper {
	// product_idからレビューを取得する
	List<Reviews> findById(int id);

	// ユーザの入力したレビューをデータベースに追加
	void insert(Reviews reviews);

	List<Reviews> isReview(@Param("userId") int userId, @Param("productId") int productId);

	void update(Reviews reviews);
}
