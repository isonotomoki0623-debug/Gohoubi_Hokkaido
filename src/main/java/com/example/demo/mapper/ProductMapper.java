package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.entity.Product;

@Mapper
public interface ProductMapper {

	/** IDで商品を1件取得 */
	Product findById(int id);

	/** ページネーション（検索対応） */
	List<Product> findPage(@Param("keyword") String keyword,
			@Param("offset") int offset,
			@Param("pageSize") int pageSize);

	/** 件数（検索対応） */
	int countAll(@Param("keyword") String keyword);
}