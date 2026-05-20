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
	List<Product> findPage(
			@Param("keyword") String keyword,
			@Param("categoryId") Integer categoryId,
			@Param("offset") int offset,
			@Param("pageSize") int pageSize);

	int countAll(
			@Param("keyword") String keyword,
			@Param("categoryId") Integer categoryId);

	/** おすすめ商品 */
	List<Product> findRecommend3();

	/** 売上ランキング */
	List<Product> findProductsTop3();

	void decrementStock(int productId, int quantity);

}