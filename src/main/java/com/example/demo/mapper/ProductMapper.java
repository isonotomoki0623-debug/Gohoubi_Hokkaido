package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.example.demo.entity.Product;

@Mapper
public interface ProductMapper {
    // idから商品を1件取得する
    Product findById (int id);
}
