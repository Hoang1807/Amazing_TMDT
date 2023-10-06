package com.Amazing.DAO;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Store;

public interface StoreDAO extends JpaRepository<Store, String> {
	public boolean existsByStorePhone(String storePhone);

	public Optional<Store> findByStorePhone(String storePhone);

}
