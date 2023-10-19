package com.Amazing.controller;

import java.util.List;
import java.util.Optional;

import org.cloudinary.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Amazing.entity.Invoice;
import com.Amazing.entity.InvoiceDetail;
import com.Amazing.entity.InvoiceDetailId;
import com.Amazing.entity.Product;
import com.Amazing.entity.Type;
import com.Amazing.entity.Users;
import com.Amazing.service.InvoiceDetailService;
import com.Amazing.service.InvoiceService;
import com.Amazing.service.ProductService;
import com.Amazing.service.SessionService;
import com.Amazing.service.TypeService;

import jakarta.websocket.server.PathParam;

@Controller
public class ShopListController {

	@Autowired
	ProductService productService;
	@Autowired
	TypeService typeService;
	@Autowired
	InvoiceService invoiceService;
	@Autowired
	InvoiceDetailService invoiceDetailService;
	@Autowired
	SessionService session;

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

	//fill dữ liệu product lên
	@GetMapping("/shopDetail")
	public String detailProduct(Model model, @RequestParam("id") String id) {
		Product p = productService.findByIdProduct(id);
		model.addAttribute("type", typeService.findTypeByIdProduct(p));
		model.addAttribute("product", p);
		return "user/shopList/shopDetail";
	}

	@GetMapping("/shoppingCart")
	public String shoppingCart() {
		return "user/shopList/shoppingCart";
	}
	
	@GetMapping("/checkout")
	public String checkOut() {
		return "user/shopList/checkout";
	}
	
	@PostMapping("/checkout")
	public String doCheckOut(
			@RequestParam("address") String address,
			@RequestParam("phone") String phone,
			@RequestParam("email") String email,
			@RequestParam("notes") String notes,
			@RequestParam("product") List<JSONObject> listPro,Model model
			) {
		
			Users us = session.get("currentUser");
			if(us != null) {
				Invoice invoice = new Invoice();
				invoice.setInvoiceAddress(address);
				invoice.setInvoiceNote(notes);
				invoice.setUsers(us); 
				Invoice i = invoiceService.saveInvoice(invoice); //tạo invoice trước sau đó mới có thể làm bước tiếp theo
	
				for(JSONObject item : listPro) {
					Type type =  typeService.getTypeById(item.get("type").toString());
					if(type != null && type.getTypeQuantity() > 0) {
						type.setTypeQuantity(type.getTypeQuantity() - (int) item.get("quantities"));
						typeService.updateType(type);
							
						InvoiceDetail invoiceDetail = new InvoiceDetail();
						invoiceDetail.setId(new InvoiceDetailId(i.getInvoiceId(), type.getTypeId()));
						invoiceDetail.setType(type);
						invoiceDetail.setInvoice(invoiceService.findByIdInvoice(invoice.getInvoiceId()));
						invoiceDetail.setInvoiceDtPrice(type.getTypePrice());
						invoiceDetail.setInvoiceDtQuantity((int) item.get("quantities"));
							
						invoiceDetailService.addInvoiceDetail(invoiceDetail);
						return "redirect:/success";
					}				
				}	
					model.addAttribute("checkInvoice", "Hãy kiểm tra chắc chắn bạn không bỏ sót thông tin");
					return "redirect:/checkout";	
			}
			session.set("loginFail", "Hãy đăng nhập để có thể đặt hàng");
			return "redirect:/AmazingLogin";
	}
	
	@GetMapping("/success")
	public String success() {
		return "/user/shopList/success";
	}
}
