package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.example.demo.entity.Product;

@Mapper
public interface ProductMapper {
	/** IDで商品を1件取得する */
	Product findById(int id);

	/** 全商品を取得する */
	List<Product> findAll();

	/** ページネーション */
	List<Product> findPage(
			@Param("offset") int offset,
			@Param("limit") int limit);

	int countAll();
}
