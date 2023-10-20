package com.Amazing.DAO;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Type;
import com.Amazing.entity.Product;


public interface TypeDAO extends JpaRepository<Type, String> {
	List<Type> findByProduct(Product p);
	Type findByTypeId(String id);
}
