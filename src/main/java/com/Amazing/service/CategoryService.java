package com.Amazing.service;

import com.Amazing.DAO.CategoryDAO;
import com.Amazing.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {

	private final CategoryDAO categoryDAO;

	@Autowired
	public CategoryService(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	// Thêm một danh mục mới
	public Category addCategory(Category category) {
		return categoryDAO.save(category);
	}

	// Lấy danh sách tất cả danh mục
	public List<Category> getAllCategories() {
		return categoryDAO.findAll();
	}

	// Lấy thông tin một danh mục theo ID
	public Optional<Category> getCategoryById(String categoryId) {
		return categoryDAO.findById(categoryId);
	}

	// Cập nhật thông tin một danh mục
	public Category updateCategory(String categoryId, Category updatedCategory) {
		Optional<Category> existingCategory = categoryDAO.findById(categoryId);
		if (existingCategory.isPresent()) {
			updatedCategory.setCateId(existingCategory.get().getCateId());
			return categoryDAO.save(updatedCategory);
		} else {
			throw new IllegalArgumentException("Không tìm thấy danh mục với ID: " + categoryId);
		}
	}

	// Xóa một danh mục theo ID
	public void deleteCategory(String categoryId) {
		categoryDAO.deleteById(categoryId);
	}
	
	// Kiểm tra xem cateName đã tồn tại hay chưa
	public boolean isCateNameExists(String cateName) {
        return categoryDAO.existsByCateName(cateName);
    }
}
