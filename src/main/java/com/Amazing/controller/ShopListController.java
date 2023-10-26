package com.Amazing.controller;

import java.util.List;
import java.util.Optional;

import org.cloudinary.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import org.springframework.data.domain.Sort.Direction;

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
	public String index() {
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
	
	@ModelAttribute("page")
	public Page<Product> getProductOnPage(){
		Pageable pageable = PageRequest.of(0, 3);
		return productService.findAllProducts(pageable);
	}
	
//	@GetMapping("/user/shoplist")
//	public String index(@RequestParam("page") Optional<Integer> page, Model model) {
//		Pageable pageable = PageRequest.of(page.orElse(0), 3);
//        Page<Product> products = productService.findAllProducts(pageable);
//        session.set("pageProduct", page.orElse(0));
//        model.addAttribute("page", products);
//        return "user/shopList/shopList";
//    }
	
	@GetMapping("/user/shoplist/search")
	public String search(
			@RequestParam("page") Optional<Integer> p, @RequestParam("name") Optional<String> n,
			@RequestParam("sort") Optional<Boolean> s, Model model) {


		Integer pe = p.orElse(session.get("pageProduct"));
		System.out.println(pe);
		session.set("pageProducer", pe);
		if (pe == null) {
			pe = 0;
		}

		Boolean sort = s.orElse(session.get("sortProduct"));
		session.set("sortProducer", sort);
		if (sort == null) {
			sort = true;
		}

		String name = n.orElse(session.get("nameProduct"));
		session.set("nameProducer", name);
		if (name == null) {
			name = "productId";
		}

		Pageable pageable = PageRequest.of(pe, 3, sort ? Direction.ASC : Direction.DESC, name);
		Page<Product> page = productService.findAllProducts(pageable);
		session.set("pageProduct", pe);
		model.addAttribute("page", page);
		return "user/shopList/shopList";
	}
	
}
