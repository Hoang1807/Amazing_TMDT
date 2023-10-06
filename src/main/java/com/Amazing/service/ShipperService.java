package com.Amazing.service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;

import com.Amazing.DAO.ShipperDAO;
import com.Amazing.entity.Shipper;

public class ShipperService {
	@Autowired
	ShipperDAO shipperDAO;

	public <S extends Shipper> S save(S entity) {
		return shipperDAO.save(entity);
	}

	public <S extends Shipper> List<S> saveAll(Iterable<S> entities) {
		return shipperDAO.saveAll(entities);
	}

	public <S extends Shipper> Optional<S> findOne(Example<S> example) {
		return shipperDAO.findOne(example);
	}

	public List<Shipper> findAll(Sort sort) {
		return shipperDAO.findAll(sort);
	}

	public void flush() {
		shipperDAO.flush();
	}

	public Page<Shipper> findAll(Pageable pageable) {
		return shipperDAO.findAll(pageable);
	}

	public <S extends Shipper> S saveAndFlush(S entity) {
		return shipperDAO.saveAndFlush(entity);
	}

	public <S extends Shipper> List<S> saveAllAndFlush(Iterable<S> entities) {
		return shipperDAO.saveAllAndFlush(entities);
	}

	public List<Shipper> findAll() {
		return shipperDAO.findAll();
	}

	public List<Shipper> findAllById(Iterable<String> ids) {
		return shipperDAO.findAllById(ids);
	}

	public void deleteInBatch(Iterable<Shipper> entities) {
		shipperDAO.deleteInBatch(entities);
	}

	public <S extends Shipper> Page<S> findAll(Example<S> example, Pageable pageable) {
		return shipperDAO.findAll(example, pageable);
	}

	public Optional<Shipper> findById(String id) {
		return shipperDAO.findById(id);
	}

	public void deleteAllInBatch(Iterable<Shipper> entities) {
		shipperDAO.deleteAllInBatch(entities);
	}

	public boolean existsById(String id) {
		return shipperDAO.existsById(id);
	}

	public void deleteAllByIdInBatch(Iterable<String> ids) {
		shipperDAO.deleteAllByIdInBatch(ids);
	}

	public <S extends Shipper> long count(Example<S> example) {
		return shipperDAO.count(example);
	}

	public <S extends Shipper> boolean exists(Example<S> example) {
		return shipperDAO.exists(example);
	}

	public void deleteAllInBatch() {
		shipperDAO.deleteAllInBatch();
	}

	public Shipper getOne(String id) {
		return shipperDAO.getOne(id);
	}

	public <S extends Shipper, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
		return shipperDAO.findBy(example, queryFunction);
	}

	public long count() {
		return shipperDAO.count();
	}

	public void deleteById(String id) {
		shipperDAO.deleteById(id);
	}

	public Shipper getById(String id) {
		return shipperDAO.getById(id);
	}

	public void delete(Shipper entity) {
		shipperDAO.delete(entity);
	}

	public Shipper getReferenceById(String id) {
		return shipperDAO.getReferenceById(id);
	}

	public void deleteAllById(Iterable<? extends String> ids) {
		shipperDAO.deleteAllById(ids);
	}

	public void deleteAll(Iterable<? extends Shipper> entities) {
		shipperDAO.deleteAll(entities);
	}

	public <S extends Shipper> List<S> findAll(Example<S> example) {
		return shipperDAO.findAll(example);
	}

	public <S extends Shipper> List<S> findAll(Example<S> example, Sort sort) {
		return shipperDAO.findAll(example, sort);
	}

	public void deleteAll() {
		shipperDAO.deleteAll();
	}
	
}
