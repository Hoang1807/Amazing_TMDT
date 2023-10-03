package com.Amazing.controller;


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
		return "/loginFolder/layoutLogin";
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
		return "/loginFolder/layoutRegister";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "AmazingRegister")
	public String doSignUp() {
		
		return "redirect:/home";
	}
}
