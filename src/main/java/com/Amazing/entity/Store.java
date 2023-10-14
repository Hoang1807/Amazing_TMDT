package com.Amazing.entity;
// Generated Oct 14, 2023, 12:05:32 AM by Hibernate Tools 4.3.6.Final

import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.ToString;

/**
 * Store generated by hbm2java
 */
@Entity
@Table(name = "STORE", schema = "dbo", catalog = "AMAZING_TMDT")
@ToString
public class Store {

	private String storeId;
	private String storePassword;
	private String storeAddress;
	private String storeName;
	private String storePhone;
	private String storeEmail;
	private String storeImage;
	private List<Category> categories;

	public Store() {
	}

	public Store(String storePassword, String storeName, String storePhone, String storeEmail) {
		this.storePassword = storePassword;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeEmail = storeEmail;
	}

	public Store(String storePassword, String storeAddress, String storeName, String storePhone,
			String storeEmail, String storeImage, List<Category> categories) {
		this.storePassword = storePassword;
		this.storeAddress = storeAddress;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeEmail = storeEmail;
		this.storeImage = storeImage;
		this.categories = categories;
	}

	@Id
	@Column(name = "STORE_ID", unique = true, nullable = false, length = 36)
	public String getStoreId() {
		return this.storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	@Column(name = "STORE_PASSWORD", nullable = false, length = 50)
	public String getStorePassword() {
		return this.storePassword;
	}

	public void setStorePassword(String storePassword) {
		this.storePassword = storePassword;
	}

	@Column(name = "STORE_ADDRESS")
	public String getStoreAddress() {
		return this.storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	@Column(name = "STORE_NAME", nullable = false)
	public String getStoreName() {
		return this.storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	@Column(name = "STORE_PHONE", nullable = false, length = 11)
	public String getStorePhone() {
		return this.storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	@Column(name = "STORE_EMAIL", nullable = false, length = 128)
	public String getStoreEmail() {
		return this.storeEmail;
	}

	public void setStoreEmail(String storeEmail) {
		this.storeEmail = storeEmail;
	}

	@Column(name = "STORE_IMAGE")
	public String getStoreImage() {
		return this.storeImage;
	}

	public void setStoreImage(String storeImage) {
		this.storeImage = storeImage;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "store")
	public List<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

}
