package com.Amazing.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Amazing.entity.Shipper;

public interface ShipperDAO extends JpaRepository<Shipper, String>{
	Boolean existsByShipperPhone (String shipperPhone);
}
