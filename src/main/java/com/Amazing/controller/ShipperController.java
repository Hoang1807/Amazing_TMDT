package com.Amazing.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Amazing.DAO.ShipperDAO;
import com.Amazing.entity.Invoice;
import com.Amazing.entity.Shipper;
import com.Amazing.service.InvoiceService;
import com.Amazing.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	public String index(Model model,HttpSession session,HttpServletResponse response) {
		model.addAttribute("user", session.getAttribute("currentUser"));
		Shipper currentShipper = (Shipper) session.getAttribute("currentUser");

		// Tính tổng số lượng invoices
		int totalInvoices = invoiceSER.getAll().size();
		// Tính tổng số đơn chưa nhận
		int Invoices = invoiceSER.countInvoices();
		// Tính tổng đơn hàng đã nhận
	
		int myInvoices = invoiceSER.countMyInvoices(currentShipper.getShipperId());
		
		// Truyền dữ liệu
		model.addAttribute("Invoices", Invoices);
		model.addAttribute("totalInvoices", totalInvoices);
		model.addAttribute("myInvoices", myInvoices);
		// List đơn hàng
		List<Invoice> invoice = invoiceSER.getAll();

		model.addAttribute("invoices", invoice);
		return "/shipper/shipper_Home";
	}

	@RequestMapping("/shipper/receive/{invoiceId}")
	public String receiveInvoice(@PathVariable("invoiceId") Integer invoiceId, HttpSession session,
			HttpServletResponse response) {
		// Lấy thông tin shipper hiện tại (đã đăng nhập) từ session hoặc nơi lưu trữ
		// thông tin đăng nhập của shipper
		Shipper currentShipper = (Shipper) session.getAttribute("currentUser");

		// Kiểm tra xem có đơn hàng có invoiceId trong hệ thống không
		Invoice invoice = invoiceSER.findByIdInvoice(invoiceId);
		if (invoice != null) {
			// Đánh dấu đơn hàng đã được nhận bởi shipper hiện tại
			invoice.setShipper(currentShipper);
			invoice.setInvoiceShippingstatus(true);

			// Lưu các thay đổi vào cơ sở dữ liệu
			invoiceSER.saveInvoice(invoice);

//			// Redirect hoặc trả về trang chính hoặc trang danh sách đơn hàng (tùy theo
//			// thiết kế của ứng dụng)
			return "redirect:/shipper/home";
		}

		// Xử lý nếu không tìm thấy đơn hàng

		return "/shipper/shipper_Home";
	}

}
