package com.Amazing.entity;
// Generated Sep 29, 2023, 7:50:24 PM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/**
 * Users generated by hbm2java
 */
@Entity
@Table(name = "USERS", schema = "dbo", catalog = "AMAZING_TMDT")
public class Users {

	private String userPhone;
	private String userPassword;
	private String userFullname;
	private String userImage;
	private String userEmail;
	private Set<Invoice> invoices = new HashSet<Invoice>(0);

	public Users() {
	}

	public Users(String userPhone, String userPassword, String userFullname, String userEmail) {
		this.userPhone = userPhone;
		this.userPassword = userPassword;
		this.userFullname = userFullname;
		this.userEmail = userEmail;
	}

	public Users(String userPhone, String userPassword, String userFullname, String userImage, String userEmail,
			Set<Invoice> invoices) {
		this.userPhone = userPhone;
		this.userPassword = userPassword;
		this.userFullname = userFullname;
		this.userImage = userImage;
		this.userEmail = userEmail;
		this.invoices = invoices;
	}

	@Id
	@Column(name = "USER_PHONE", unique = true, nullable = false, length = 11)
	public String getUserPhone() {
		return this.userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	@Column(name = "USER_PASSWORD", nullable = false, length = 50)
	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Column(name = "USER_FULLNAME", nullable = false)
	public String getUserFullname() {
		return this.userFullname;
	}

	public void setUserFullname(String userFullname) {
		this.userFullname = userFullname;
	}

	@Column(name = "USER_IMAGE")
	public String getUserImage() {
		return this.userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	@Column(name = "USER_EMAIL", nullable = false, length = 50)
	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Invoice> getInvoices() {
		return this.invoices;
	}

	public void setInvoices(Set<Invoice> invoices) {
		this.invoices = invoices;
	}

}