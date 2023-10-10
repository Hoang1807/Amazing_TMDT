package com.Amazing.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Type;

public interface TypeDAO extends JpaRepository<Type, String> {
	
}
