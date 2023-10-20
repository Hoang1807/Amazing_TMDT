package com.Amazing.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Amazing.DAO.TypeDAO;
import com.Amazing.entity.Product;
import com.Amazing.entity.Type;

@Service
public class TypeService {

	private TypeDAO dao;

	@Autowired
	public TypeService(TypeDAO dao) {
		this.dao = dao;
	}
	
	
	public List<Type> findAll(){
		return dao.findAll();
	}
	
	public List<Type> findTypeByIdProduct(Product p){
		return dao.findByProduct(p);
	}
	
	public Type getTypeById(String id) {
		try {
			return dao.findByTypeId(id);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	 public Type updateType(Type type) {
		 return dao.save(type);
	 }
}
