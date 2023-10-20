package com.Amazing.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.InvoiceDetail;
import com.Amazing.entity.InvoiceDetailId;

public interface InvoiceDetailDAO extends JpaRepository<InvoiceDetail, InvoiceDetailId> {
	
}
