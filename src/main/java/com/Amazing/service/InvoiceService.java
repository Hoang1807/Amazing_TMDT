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
import org.springframework.stereotype.Service;

import com.Amazing.DAO.InvoiceDAO;
import com.Amazing.entity.Invoice;

@Service
public class InvoiceService {
	private InvoiceDAO dao;

	@Autowired
	public InvoiceService(InvoiceDAO dao) {
		this.dao = dao;
	}
	public List<Invoice> getAll() {
		return dao.findAll();
	}
	public <S extends Invoice> S save(S entity) {
		return dao.save(entity);
	}
	public <S extends Invoice> List<S> saveAll(Iterable<S> entities) {
		return dao.saveAll(entities);
	}
	public <S extends Invoice> Optional<S> findOne(Example<S> example) {
		return dao.findOne(example);
	}
	public List<Invoice> findAll(Sort sort) {
		return dao.findAll(sort);
	}
	public void flush() {
		dao.flush();
	}
	public Page<Invoice> findAll(Pageable pageable) {
		return dao.findAll(pageable);
	}
	public <S extends Invoice> S saveAndFlush(S entity) {
		return dao.saveAndFlush(entity);
	}
	public <S extends Invoice> List<S> saveAllAndFlush(Iterable<S> entities) {
		return dao.saveAllAndFlush(entities);
	}
	public List<Invoice> findAll() {
		return dao.findAll();
	}
	public List<Invoice> findAllById(Iterable<Integer> ids) {
		return dao.findAllById(ids);
	}
	public void deleteInBatch(Iterable<Invoice> entities) {
		dao.deleteInBatch(entities);
	}
	public <S extends Invoice> Page<S> findAll(Example<S> example, Pageable pageable) {
		return dao.findAll(example, pageable);
	}
	public Optional<Invoice> findById(Integer id) {
		return dao.findById(id);
	}
	public void deleteAllInBatch(Iterable<Invoice> entities) {
		dao.deleteAllInBatch(entities);
	}
	public boolean existsById(Integer id) {
		return dao.existsById(id);
	}
	public void deleteAllByIdInBatch(Iterable<Integer> ids) {
		dao.deleteAllByIdInBatch(ids);
	}
	public <S extends Invoice> long count(Example<S> example) {
		return dao.count(example);
	}
	public <S extends Invoice> boolean exists(Example<S> example) {
		return dao.exists(example);
	}
	public void deleteAllInBatch() {
		dao.deleteAllInBatch();
	}
	public Invoice getOne(Integer id) {
		return dao.getOne(id);
	}
	public <S extends Invoice, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
		return dao.findBy(example, queryFunction);
	}
	public long count() {
		return dao.count();
	}
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}
	public Invoice getById(Integer id) {
		return dao.getById(id);
	}
	public void delete(Invoice entity) {
		dao.delete(entity);
	}
	public Invoice getReferenceById(Integer id) {
		return dao.getReferenceById(id);
	}
	public void deleteAllById(Iterable<? extends Integer> ids) {
		dao.deleteAllById(ids);
	}
	public void deleteAll(Iterable<? extends Invoice> entities) {
		dao.deleteAll(entities);
	}
	public <S extends Invoice> List<S> findAll(Example<S> example) {
		return dao.findAll(example);
	}
	public <S extends Invoice> List<S> findAll(Example<S> example, Sort sort) {
		return dao.findAll(example, sort);
	}
	public void deleteAll() {
		dao.deleteAll();
	}
	
	
}
