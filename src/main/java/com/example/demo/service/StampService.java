package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.CartItem;
import com.example.demo.entity.HokkaidoArea;
import com.example.demo.entity.Stamp;
import com.example.demo.mapper.StampMapper;

@Service
public class StampService {
	@Autowired
	private StampMapper stampMapper;

	public List<HokkaidoArea> insertStamp(List<CartItem> cart, int userId) {
		List<HokkaidoArea> hokkaidoareas = new ArrayList<>();

		for (CartItem oneCart : cart) {
			Stamp stamp = stampMapper.findStampByUserId(userId, oneCart.getAreaId());
			if (stamp == null) {
				stampMapper.insertStamp(userId, oneCart.getAreaId());
				hokkaidoareas.add(stampMapper.findAreaId(oneCart.getAreaId()));
			}
		}
		return hokkaidoareas;
	}
}
