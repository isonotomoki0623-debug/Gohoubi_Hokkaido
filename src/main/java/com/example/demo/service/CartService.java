package com.example.demo.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.demo.entity.CartItem;
import com.example.demo.entity.Product;

@Service
public class CartService {
	private static final String CART_KEY = "cart";

	// セッションからカートを取得する
	@SuppressWarnings("unchecked")
	public List<CartItem> getCart(HttpSession session) {
		List<CartItem> cart = (List<CartItem>) session.getAttribute(CART_KEY);
		if (cart == null) {
			cart = new ArrayList<>();
			session.setAttribute(CART_KEY, cart);
		}
		return cart;
	}

	// カートに商品を追加する（同じ商品があれば数量を追加する）
	public void addItem(HttpSession session, Product product, String imagePath) {
		List<CartItem> cart = getCart(session);
		for (CartItem item : cart) {
			if (item.getProductId() == product.getId()) {
				item.incrementQuantity();
				return;
			}
		}
		cart.add(new CartItem(product.getId(), product.getName(), product.getPrice(), product.getProductCategoryId(),
				product.getHokkaidoAreaId(), imagePath));
	}

	// カート内の商品を削除（同じ商品があれば1つ削除し、0の場合はカート内から削除）
	public void subtractItem(HttpSession session, Product product) {
		List<CartItem> cart = getCart(session);
		Iterator<CartItem> iterator = cart.iterator();
		while (iterator.hasNext()) {
			CartItem item = iterator.next();
			if (item.getProductId() == product.getId()) {
				item.decrementQuantity();
				if (item.getQuantity() == 0) {
					iterator.remove();
				}
				break;
			}
		}
	}

	// 商品の一括削除
	public void remove(HttpSession session, int productId) {
		List<CartItem> cart = getCart(session);
		cart.removeIf(item -> item.getProductId() == productId);
	}

	// カート内の合計金額を算出
	public int getTotalPrice(HttpSession session) {
		List<CartItem> cart = getCart(session);
		int totalPrice = 0;
		for (CartItem item : cart) {
			totalPrice += item.getPrice() * item.getQuantity();
		}
		return totalPrice;
	}
}
