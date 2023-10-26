package com.Amazing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.Amazing.DAO.ProductDAO;
import com.Amazing.entity.Product;

@Service
public class ProductService {

	private ProductDAO dao;
	
	@Autowired
	public ProductService(ProductDAO dao) {
		this.dao = dao;
	}
	
	public List<Product> getAllProduct(){
		return dao.findAll();
	}
	
	public List<Integer> findMinPricesGroupedByProductId() {
        return dao.findMinPricesGroupedByProductId();
    }
	
	public int getMaxPrice(String idProduct) {
		return dao.findMaxPriceByProductId(idProduct);
	}
	
	public Product findByIdProduct(String id) {
		return dao.findByProductId(id);
	}
	
	public Page<Product> findAllProducts(Pageable pageable) {
        return dao.findAll(pageable);
    }

}
