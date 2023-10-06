package com.Amazing.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Amazing.DAO.UserDAO;
import com.Amazing.entity.Shipper;
import com.Amazing.entity.Store;
import com.Amazing.entity.Users;
import com.Amazing.service.SessionService;
import com.Amazing.service.ShipperService;
import com.Amazing.service.StoreService;
import com.Amazing.service.UserService;
import com.Amazing.utils.ALParam;
import com.AnLa.NET.Cloud;

@Controller
public class AccountController {
	@Autowired
	UserService userService;
	@Autowired
	StoreService storeService;
	@Autowired
	ShipperService shipperService;
	@Autowired
	SessionService session;

	Cloud damMayTuyetVoi = new Cloud("cloudinary://884888726373298:NTUdYT7s_LevjBATris_Fzpa8vA@dq721aual");

	@RequestMapping(method = RequestMethod.GET, value = "AmazingLogin")
	public String getFormLogin() {
		return "/user/loginFolder/layoutLogin";
	}

	@RequestMapping(method = RequestMethod.POST, value = "AmazingLogin")
	public String doLogin(@RequestParam("userPhone") String phone, @RequestParam("userPassword") String password, Model model, @RequestParam("roleLogin") String role) {
		System.out.println(role);
		if (role.equals("user")) {
			System.out.println("a");
			Users us = userService.findByUserPhone(phone).orElse(null);
			if (us != null) {
				System.out.println("a1 "+us.getUserPassword());
				if (us.getUserPassword().equals(password)) {
					System.out.println("a2");
					session.set("currentUser", us);
					session.setTimeOut(1 * 24 * 60 * 60);
					return "redirect:/home";
				}
			}
		}else if(role.equals("seller")) {
			// mục đăng nhập cho seller 
			System.out.println("b");
				Store store = storeService.getStoreByPhoneNumber(phone).orElse(null);
				if(store != null) {
					if(store.getStorePassword().equals(password)) {
						session.set("currentUser", store);
						session.setTimeOut(1 * 24 * 60 * 60);
						return "seller/index";
					}
				}
		}else if (role.equals("shipper")) {
			System.out.println("c");// mục đăng nhập cho shipper 
			Shipper shipper = shipperService.findShipperByPhone(phone).orElse(null);
			if(shipper != null) {
				System.out.println(shipper.getShipperPassword());
				if(shipper.getShipperPassword().equals(password)) {
					System.out.println("123");
					session.set("currentUser", shipper);
					session.setTimeOut(1 * 24 * 60 * 60);
//					return "shipper/shipper_Home";
					return "redirect:/shipper/home";
					}
			}
		}
			
		model.addAttribute("loginFail","hay kiem tra lai tai khoan va mat khau");
		return"loginFolder/layoutLogin";
	
	}

	@RequestMapping(method = RequestMethod.GET, value = "logout")
	public String doLogOut() throws InterruptedException {
		Users user = session.get("current_account");
		if (user != null) {
			session.setTimeOut(1);
			Thread.sleep(1000);
		}
		return "redirect:/home";
	}

	@RequestMapping(method = RequestMethod.GET, value = "AmazingRegister")
	public String getFormRegisted() {
		return "/user/loginFolder/layoutRegister";
	}

	@RequestMapping(method = RequestMethod.POST, value = "AmazingRegister")
	public String doSignUp(Users us, Model model, @RequestParam("pFile") MultipartFile pFile) throws IOException {
		if (!userService.existUserPhone(us.getUserPhone())) {
			File fifai = ALParam.saveFile(pFile, "/views/avatarUser/",
					String.valueOf(System.currentTimeMillis()) + ".png");
			us.setUserImage(damMayTuyetVoi.FileUpload(fifai.getAbsolutePath(), "Amazing"));
			fifai.deleteOnExit();
			System.out.println("Thanh` co^ng dang ki'");
			userService.addUser(us);
			return "/user/loginFolder/layoutLogin";
		}
		model.addAttribute("registerFail", "hay chac chan ban da dien day du cac form");
		return "/user/loginFolder/layoutRegister";
	}
}
