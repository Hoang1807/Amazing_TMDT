package com.Amazing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Amazing.DAO.TypeDAO;
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
	
	
}
