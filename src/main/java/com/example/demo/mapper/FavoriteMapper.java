package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.entity.Product;

@Mapper
public interface FavoriteMapper {
	// userIdから商品名をjoin
	List<Product> findFavoritesByUserId(int UserId);

	// お気に入りしているか確認
	int countFavorite(@Param("userId") int userId, @Param("productId") int productId);

	// お気に入りの追加
	void insert(@Param("userId") int userId, @Param("productId") int productId);

	//お気に入りの削除
	void delete(@Param("userId") int userId, @Param("productId") int productId);
}
