package com.g10.JolieWeb.Entity;
// default package
// Generated Dec 2, 2022, 3:53:02 PM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Cart generated by hbm2java
 */
@Entity
@Table(name = "cart", catalog = "jolie")
public class Cart implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Accountinfo accountinfo;
	private float totalPrice;
	private Integer status;
	private Set<Detailcart> detailcarts = new HashSet<Detailcart>(0);
	private Set<Billinfo> billinfos = new HashSet<Billinfo>(0);

	public Cart() {
	}

	public Cart(Accountinfo accountinfo, float totalPrice) {
		this.accountinfo = accountinfo;
		this.totalPrice = totalPrice;
	}

	public Cart(Accountinfo accountinfo, float totalPrice, Integer status, Set<Detailcart> detailcarts,
			Set<Billinfo> billinfos) {
		this.accountinfo = accountinfo;
		this.totalPrice = totalPrice;
		this.status = status;
		this.detailcarts = detailcarts;
		this.billinfos = billinfos;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUser", nullable = false)
	public Accountinfo getAccountinfo() {
		return this.accountinfo;
	}

	public void setAccountinfo(Accountinfo accountinfo) {
		this.accountinfo = accountinfo;
	}

	@Column(name = "totalPrice", nullable = false, precision = 12, scale = 0)
	public float getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cart")
	public Set<Detailcart> getDetailcarts() {
		return this.detailcarts;
	}

	public void setDetailcarts(Set<Detailcart> detailcarts) {
		this.detailcarts = detailcarts;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cart")
	public Set<Billinfo> getBillinfos() {
		return this.billinfos;
	}

	public void setBillinfos(Set<Billinfo> billinfos) {
		this.billinfos = billinfos;
	}

}