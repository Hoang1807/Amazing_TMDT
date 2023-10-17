package com.Amazing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Amazing.DAO.InvoiceDetailDAO;
import com.Amazing.entity.InvoiceDetail;

@Service
public class InvoiceDetailService  {

	private InvoiceDetailDAO dao;
	
	@Autowired
	public InvoiceDetailService(InvoiceDetailDAO dao) {
		this.dao = dao;
	}
	
	public InvoiceDetail addInvoiceDetail(InvoiceDetail invoiceDetail) {
		return dao.save(invoiceDetail);
	}
	
	
	
	
}
