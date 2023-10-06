package com.Amazing.controller;



import java.net.http.HttpRequest;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Amazing.DAO.ShipperDAO;
import com.Amazing.entity.Category;
import com.Amazing.entity.Shipper;
import com.Amazing.entity.Store;
import com.Amazing.entity.Users;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;


@Controller
public class ShipperController {
	@Autowired
	ShipperDAO shipperDAO;
	@Autowired
	HttpServletRequest ser;
	
	@RequestMapping("/shipper/register")
	public String register(Model model, Shipper ship) {
		return "/shipper/shipper_Signup";
	}
	
	@RequestMapping("/shipper/sign-up")
	public String signup(Model model,  Shipper ship ) {
		if(!shipperDAO.existsByShipperPhone(ship.getShipperPhone())) {
			UUID uuid = UUID.randomUUID();
			ship.setShipperId(uuid.toString());
				ship.setShipperAvatar("https://th.bing.com/th/id/OIP.SbV0Uuvj7z0Izlwvm8m9VQHaHU?pid=ImgDet&rs=1");
				ship.setShipperLicense("https://th.bing.com/th/id/OIP.YYCCkt4IkWyF4I0j_3ofhwHaEx?pid=ImgDet&rs=1");
			shipperDAO.save(ship);
			model.addAttribute("success", "Dang ki thanh cong");
			return "/shipper/shipper_Signup";
		}
		model.addAttribute("fail","Dang ky that bai");
		return "/shipper/shipper_Signup";
	}
}
