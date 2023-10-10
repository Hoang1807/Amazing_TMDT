package com.Amazing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.Amazing.entity.Product;
import com.Amazing.entity.Type;
import com.Amazing.service.ProductService;
import com.Amazing.service.TypeService;

@Controller
public class ShopListController {
	
	@Autowired
	ProductService productService;
	@Autowired
	TypeService typeService;
//	private List<Integer> listMinPrice;
	

	@ModelAttribute("listProduct")
	public List<Product> getAllProduct(){
		return productService.getAllProduct();
	}
	
	public List<Integer> getMinPrice() {
		return productService.findMinPricesGroupedByProductId();
	}
	
	@GetMapping("/user/shoplist")
	public String index(Model model) {
		return "user/shopList/shopList";
	}
	
}
