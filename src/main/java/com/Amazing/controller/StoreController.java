package com.Amazing.controller;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Amazing.entity.Category;
import com.Amazing.entity.Store;
import com.Amazing.service.CategoryService;
import com.Amazing.service.SessionService;
import com.Amazing.service.StoreService;

@Controller
@RequestMapping("admin")
@CrossOrigin(origins = "*")
public class StoreController {

	private final StoreService storeService;
	private final SessionService sessionService;
	private final CategoryService categoryService;

	@Autowired
	public StoreController(StoreService storeService, SessionService sessionService, CategoryService categoryService) {
		this.storeService = storeService;
		this.sessionService = sessionService;
		this.categoryService = categoryService;
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

	@PostMapping("addCategory")
	public String addCategoryToStore(Category category, RedirectAttributes redirectAttributes) {
		Store store = (Store) sessionService.get("store_account");
		// Lấy danh sách danh mục hiện tại của cửa hàng (store) (nếu cần)
		System.out.println(store.getStoreId());
		Optional<Store> existingStore = storeService.getStoreById(store.getStoreId());
		if (existingStore.isPresent()) {
			Store storeData = existingStore.get();
			List<Category> categories = storeData.getCategories();
			System.out.println(category);
			if (!categoryService.isCateNameExists(category.getCateName())) {
//				// Thêm danh mục vào danh sách của cửa hàng
				System.out.println(category);
				category.setCateId(UUID.randomUUID().toString());
				category.setStore(storeData);
				System.out.println(category);
				categories.add(category);
//
//				// Lưu cập nhật vào loại
				categoryService.addCategory(category);
//
//				// Thêm thông báo thành công (nếu cần)
			} else {
//				// Xử lý trường hợp không tìm thấy danh mục
				redirectAttributes.addAttribute("errorCate", "Tên loại đã tồn tại");
			}
		}
		return "redirect:category";
	}

	@PostMapping("updateCategory")
	public String updateCategory(Category updatedCategory, RedirectAttributes redirectAttributes) {

		// Kiểm tra xem danh mục cần cập nhật có thuộc cửa hàng của người dùng hay không
		Optional<Category> existingCategory = categoryService.getCategoryById(updatedCategory.getCateId());
		if (existingCategory.isPresent()) {
			// Cập nhật thông tin danh mục
			updatedCategory.setStore(existingCategory.get().getStore());
			categoryService.updateCategory(updatedCategory.getCateId(), updatedCategory);
		}

		return "redirect:category";
	}

	@GetMapping("{categoryId}")
	public String deleteCategory(@PathVariable String categoryId) {
		// Gọi hàm xóa danh mục từ CategoryService
		categoryService.deleteCategory(categoryId);
		return "redirect:/admin/category"; // Chuyển hướng sau khi xóa thành công
	}

	@ResponseBody
	@GetMapping("/categories")
	public ResponseEntity<List<Category>> getAllCategories(Model model) {
		// Lấy danh sách tất cả các danh mục từ CategoryService
		List<Category> categories = categoryService.getAllCategories();
		// Trả về trang hiển thị danh sách danh mục (category-list.jsp, ví dụ)
		return new ResponseEntity(categories, HttpStatus.OK);
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
