package com.Amazing.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Amazing.DAO.ShipperDAO;
import com.Amazing.entity.Invoice;
import com.Amazing.entity.Shipper;
import com.Amazing.service.InvoiceService;
import com.Amazing.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ShipperController {
	@Autowired
	ShipperDAO shipperDAO;
	@Autowired
	InvoiceService invoiceSER;
	@Autowired
	HttpServletRequest ser;

	@Autowired
	SessionService session;

	@RequestMapping("/shipper/register")
	public String register(Model model, Shipper ship) {
		return "/shipper/shipper_Signup";
	}

	@RequestMapping("/shipper/sign-up")
	public String signup(Model model, Shipper ship) {
		if (!shipperDAO.existsByShipperPhone(ship.getShipperPhone())) {
			UUID uuid = UUID.randomUUID();
			ship.setShipperId(uuid.toString());
			ship.setShipperAvatar("https://th.bing.com/th/id/OIP.SbV0Uuvj7z0Izlwvm8m9VQHaHU?pid=ImgDet&rs=1");
			ship.setShipperLicense("https://th.bing.com/th/id/OIP.YYCCkt4IkWyF4I0j_3ofhwHaEx?pid=ImgDet&rs=1");
			shipperDAO.save(ship);
			model.addAttribute("success", "Sign Up Success");
			return "/shipper/shipper_Home";
		}
		model.addAttribute("fail", "Sign Up Fail	");
		return "/shipper/shipper_Signup";
	}

	@GetMapping("/shipper/home")
	public String index(Model model) {
		model.addAttribute("user", session.get("currentUser"));
		// Tính tổng số lượng invoices
		int totalInvoices = invoiceSER.getAll().size();

		// Thêm tổng số lượng vào Model
		model.addAttribute("totalInvoices", totalInvoices);

		// List đơn hàng
		List<Invoice> invoice = invoiceSER.getAll();

		model.addAttribute("invoices", invoice);
		return "/shipper/shipper_Home";
	}

}
