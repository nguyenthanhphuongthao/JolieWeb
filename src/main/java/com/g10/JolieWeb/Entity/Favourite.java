package com.g10.JolieWeb.Entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "favourite", catalog = "jolie")
public class Favourite implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Accountinfo accountinfo;
	private Product product;
	
	public Favourite() {
	}
	
	public Favourite(Accountinfo accountinfo, Product product) {
		this.accountinfo = accountinfo;
		this.product = product;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idAcc", nullable = false)
	public Accountinfo getAccountinfo() {
		return this.accountinfo;
	}

	public void setAccountinfo(Accountinfo accountinfo) {
		this.accountinfo = accountinfo;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProduct", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
