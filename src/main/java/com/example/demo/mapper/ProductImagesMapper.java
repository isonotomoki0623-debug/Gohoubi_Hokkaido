package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.ProductImages;

@Mapper
public interface ProductImagesMapper {
	// product_idから商品画像を取得する
	List<ProductImages> findByProductId(int productId);
}
