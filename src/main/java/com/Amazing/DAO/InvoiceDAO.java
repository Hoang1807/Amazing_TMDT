package com.Amazing.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Invoice;

public interface InvoiceDAO extends JpaRepository<Invoice, Integer>{
	
}
