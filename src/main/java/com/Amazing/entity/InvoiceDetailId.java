package com.Amazing.entity;
// Generated Sep 29, 2023, 7:50:24 PM by Hibernate Tools 4.3.6.Final

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

/**
 * InvoiceDetailId generated by hbm2java
 */
@Embeddable
public class InvoiceDetailId {

	private int invoiceId;
	private String productId;

	public InvoiceDetailId() {
	}

	public InvoiceDetailId(int invoiceId, String productId) {
		this.invoiceId = invoiceId;
		this.productId = productId;
	}

	@Column(name = "INVOICE_ID", nullable = false)
	public int getInvoiceId() {
		return this.invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	@Column(name = "PRODUCT_ID", nullable = false, length = 36)
	public String getProductId() {
		return this.productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof InvoiceDetailId))
			return false;
		InvoiceDetailId castOther = (InvoiceDetailId) other;

		return (this.getInvoiceId() == castOther.getInvoiceId())
				&& ((this.getProductId() == castOther.getProductId()) || (this.getProductId() != null
						&& castOther.getProductId() != null && this.getProductId().equals(castOther.getProductId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getInvoiceId();
		result = 37 * result + (getProductId() == null ? 0 : this.getProductId().hashCode());
		return result;
	}

}
