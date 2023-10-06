package com.Amazing.service;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Amazing.DAO.UserDAO;
import com.Amazing.entity.Users;

@Service
public class UserService {
	private UserDAO dao;

	@Autowired
	public UserService(UserDAO dao) {
		this.dao = dao;
	}
	
	public Users addUser(Users u) {
		return dao.save(u);
	}
	
	public Users updateUser(Users u) {
		return dao.save(u);
	}
	
	public void deleteUser(String phone) {
		dao.deleteById(phone);
	}
	
	public boolean existUserPhone(String phone) {
		return dao.existsByUserPhone(phone);
	}
	
	public Optional<Users> findByUserPhone(String phone){
		return dao.findById(phone);
	}
	
}
