package com.Amazing.entity;
// Generated Sep 29, 2023, 7:50:24 PM by Hibernate Tools 4.3.6.Final

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

/**
 * Shipper generated by hbm2java
 */
@Entity
@Table(name = "SHIPPER", schema = "dbo", catalog = "AMAZING_TMDT")
public class Shipper implements java.io.Serializable {

	private String shipperId;
	private String shipperPassword;
	private Date shipperDate;
	private String shipperAvatar;
	private String shipperPhone;
	private String shipperLicense;
	private Serializable shipperFullname;
	private Set<Invoice> invoices = new HashSet<Invoice>(0);

	public Shipper() {
	}

	public Shipper(String shipperPassword, Date shipperDate, String shipperAvatar, String shipperPhone,
			String shipperLicense, Serializable shipperFullname) {
		this.shipperPassword = shipperPassword;
		this.shipperDate = shipperDate;
		this.shipperAvatar = shipperAvatar;
		this.shipperPhone = shipperPhone;
		this.shipperLicense = shipperLicense;
		this.shipperFullname = shipperFullname;
	}

	public Shipper(String shipperPassword, Date shipperDate, String shipperAvatar, String shipperPhone,
			String shipperLicense, Serializable shipperFullname, Set<Invoice> invoices) {
		this.shipperPassword = shipperPassword;
		this.shipperDate = shipperDate;
		this.shipperAvatar = shipperAvatar;
		this.shipperPhone = shipperPhone;
		this.shipperLicense = shipperLicense;
		this.shipperFullname = shipperFullname;
		this.invoices = invoices;
	}

	@Id
	@Column(name = "SHIPPER_ID", unique = true, nullable = false, length = 36)
	public String getShipperId() {
		return this.shipperId;
	}

	public void setShipperId(String shipperId) {
		this.shipperId = shipperId;
	}

	@Column(name = "SHIPPER_PASSWORD", nullable = false, length = 50)
	public String getShipperPassword() {
		return this.shipperPassword;
	}

	public void setShipperPassword(String shipperPassword) {
		this.shipperPassword = shipperPassword;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "SHIPPER_DATE", nullable = false, length = 10)
	public Date getShipperDate() {
		return this.shipperDate;
	}

	public void setShipperDate(Date shipperDate) {
		this.shipperDate = shipperDate;
	}

	@Column(name = "SHIPPER_AVATAR", nullable = false)
	public String getShipperAvatar() {
		return this.shipperAvatar;
	}

	public void setShipperAvatar(String shipperAvatar) {
		this.shipperAvatar = shipperAvatar;
	}

	@Column(name = "SHIPPER_PHONE", nullable = false, length = 11)
	public String getShipperPhone() {
		return this.shipperPhone;
	}

	public void setShipperPhone(String shipperPhone) {
		this.shipperPhone = shipperPhone;
	}

	@Column(name = "SHIPPER_LICENSE", nullable = false)
	public String getShipperLicense() {
		return this.shipperLicense;
	}

	public void setShipperLicense(String shipperLicense) {
		this.shipperLicense = shipperLicense;
	}

	@Column(name = "SHIPPER_FULLNAME", nullable = false)
	public Serializable getShipperFullname() {
		return this.shipperFullname;
	}

	public void setShipperFullname(Serializable shipperFullname) {
		this.shipperFullname = shipperFullname;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "shipper")
	public Set<Invoice> getInvoices() {
		return this.invoices;
	}

	public void setInvoices(Set<Invoice> invoices) {
		this.invoices = invoices;
	}

}