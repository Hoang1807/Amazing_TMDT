package com.Amazing.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Amazing.entity.Store;
import com.Amazing.service.SessionService;
import com.Amazing.service.StoreService;

@Controller
@RequestMapping("admin")
public class StoreController {

	private final StoreService storeService;
	private final SessionService sessionService;

	@Autowired
	public StoreController(StoreService storeService, SessionService sessionService) {
		this.storeService = storeService;
		this.sessionService = sessionService;
	}

	@GetMapping("login")
	public String getLoginAdmin() {
		return "seller/login";
	}

	@GetMapping("register")
	public String getRegisterAdmin() {
		return "seller/register";
	}

	@GetMapping("home")
	public String getHomeAdmin() {
		return "seller/index";
	}

	@GetMapping("category")
	public String getCategotyAdmin() {
		return "seller/category";
	}

	@PostMapping("login")
	public String loginAdmin(@RequestParam("phone") String phone, @RequestParam("password") String password) {
		sessionService.set("store_account", storeService.getStoreByPhoneNumber(phone).get());
		return "redirect:home";

	}

	@PostMapping("add")
	public String addStore(Store store, Model model) {
		// Kiểm tra xem số điện thoại đã tồn tại
		if (storeService.isPhoneNumberExists(store.getStorePhone())) {
			model.addAttribute("error", "Số điện thoại đã tồn tại");
			model.addAttribute("store", store);
			return "seller/register"; // Trả về trang đăng ký với thông báo lỗi
		}

		UUID uuid = UUID.randomUUID();
		store.setStoreId(uuid.toString());

		sessionService.set("store_account", store);
		Store addedStore = storeService.addStore(store);

		return "redirect:home";
	}

	@GetMapping("logout")
	public String logoutAdmin(Model model, RedirectAttributes redirectAttributes) {
		// Xóa thông tin đăng nhập khỏi session
		sessionService.remove("store_account");

		// Thêm thông báo đăng xuất thành công (nếu cần)
		redirectAttributes.addFlashAttribute("success", "Đăng xuất thành công");

		return "redirect:/home"; // Chuyển hướng đến trang đăng nhập
	}

}
