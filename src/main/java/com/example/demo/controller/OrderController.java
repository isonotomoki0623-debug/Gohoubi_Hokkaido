package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

	@GetMapping("/order")
	public String showOrder() {
		return "order/order";
	}

	@GetMapping("/Comp")
	public String showComp() {
		return "order/OrderCompleted.html";
	}

}
