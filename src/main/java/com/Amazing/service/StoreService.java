package com.Amazing.service;

import com.Amazing.DAO.StoreDAO;
import com.Amazing.entity.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StoreService {

	private final StoreDAO storeDAO;

	@Autowired
	public StoreService(StoreDAO storeDAO) {
		this.storeDAO = storeDAO;
	}

	// Thêm một cửa hàng mới
	public Store addStore(Store store) {
		return storeDAO.save(store);
	}

	// Lấy danh sách tất cả cửa hàng
	public List<Store> getAllStores() {
		return storeDAO.findAll();
	}

	// Lấy thông tin một cửa hàng theo ID
	public Optional<Store> getStoreById(String storeId) {
		return storeDAO.findById(storeId);
	}

	// Cập nhật thông tin một cửa hàng
	public Store updateStore(String storeId, Store updatedStore) {
		Optional<Store> existingStore = storeDAO.findById(storeId);
		if (existingStore.isPresent()) {
			updatedStore.setStoreId(existingStore.get().getStoreId());
			return storeDAO.save(updatedStore);
		} else {
			throw new IllegalArgumentException("Không tìm thấy cửa hàng với ID: " + storeId);
		}
	}

	// Xóa một cửa hàng theo ID
	public void deleteStore(String storeId) {
		storeDAO.deleteById(storeId);
	}

	// Kiểm tra xem số điện thoại đã tồn tại hay chưa
	public boolean isPhoneNumberExists(String phoneNumber) {
		boolean flag = storeDAO.existsByStorePhone(phoneNumber);
		return flag;
	}

	public Optional<Store> getStoreByPhoneNumber(String storePhone) {
		return storeDAO.findByStorePhone(storePhone);
	}
}
