package com.Amazing.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Invoice;
import java.util.List;


public interface InvoiceDAO extends JpaRepository<Invoice, Integer>{
	public Invoice findByInvoiceId(Integer invoiceId);
}
