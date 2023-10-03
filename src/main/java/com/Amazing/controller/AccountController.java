package com.Amazing.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Amazing.DAO.UserDAO;
import com.Amazing.entity.Users;



@Controller
public class AccountController {

	@Autowired
	UserDAO account;
	
	@RequestMapping(method = RequestMethod.GET , value = "AmazingLogin")
	public String getFormLogin() {
		return "/user/loginFolder/layoutLogin";
	}
	
	@RequestMapping(method = RequestMethod.POST , value = "AmazingLogin")
	public String doLogin(Users user,Model model) {
		Users us = account.findById(user.getUserPhone()).orElse(null);
		if(us != null) {
			if(us.getUserPassword().equals(user.getUserPassword())) {
				System.out.println("Thanh` co^ng");
			}else {
				model.addAttribute("loginFail", "hay kiem tra lai tai khoan va mat khau");
				return "login";
			}
		}
		return "redirect:/home";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "AmazingRegister")
	public String getFormRegisted() {
		return "/user/loginFolder/layoutRegister";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "AmazingRegister")
	public String doSignUp(Users us, Model model) {
		System.out.println(us.getUserPhone());
		if(!account.existsByUserPhone(us.getUserPhone())) {
			us.setUserImage("https://i.pinimg.com/564x/80/aa/c3/80aac385ef85310f59dc6c05c92006b8.jpg");
			System.out.println("Thanh` co^ng dang ki'");
			return "/user/loginFolder/layoutLogin";
		}
		model.addAttribute("registerFail", "hay chac chan ban da dien day du cac form");
		return "/user/loginFolder/layoutRegister";
	}
}
