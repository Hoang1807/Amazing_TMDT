package com.Amazing.DAO;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Amazing.entity.Invoice;


public interface InvoiceDAO extends JpaRepository<Invoice, Integer>{
	public Invoice findByInvoiceId(Integer invoiceId);
	
	  @Query("SELECT COUNT(i) FROM Invoice i WHERE i.shipper IS NULL")
	  public  int countInvoicesWithNullShipper();
	  
	  @Query("SELECT COUNT(i) FROM Invoice i WHERE i.shipper.shipperId = :shipperId")
	    int countInvoicesByShipperId(@Param("shipperId") String shipperId);
}
