package com.Amazing.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String> {
	// Kiểm tra xem cateName đã tồn tại hay chưa
	public boolean existsByCateName(String cateName);
}
