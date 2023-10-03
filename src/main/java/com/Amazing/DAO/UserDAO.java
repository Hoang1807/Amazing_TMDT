package com.Amazing.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Users;

public interface UserDAO extends JpaRepository<Users, String> {
	public boolean existsByUserPhone(String userPhone);
}
