package com.g10.JolieWeb.Entity;
// default package
// Generated Dec 2, 2022, 3:53:02 PM by Hibernate Tools 4.3.6.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Config generated by hbm2java
 */
@Entity
@Table(name = "config", catalog = "jolie")
public class Config implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String groupcode;
	private String code;
	private String name;
	private String value;
	private String note;
	private Integer iduser01;
	private Integer iduser02;
	private Date date01;
	private Date date02;
	private Set<Product> productsForBrand = new HashSet<Product>(0);
	private Set<Accountinfo> accountinfos = new HashSet<Accountinfo>(0);
	private Set<Billinfo> billinfosForPaymentMethod = new HashSet<Billinfo>(0);
	private Set<Account> accountsForType = new HashSet<Account>(0);
	private Set<Product> productsForCategory = new HashSet<Product>(0);
	private Set<Account> accountsForRole = new HashSet<Account>(0);
	private Set<Billinfo> billinfosForShippingMethod = new HashSet<Billinfo>(0);

	public Config() {
	}

	public Config(String groupcode, String code, String name, String value, String note, Integer iduser01,
			Integer iduser02, Date date01, Date date02, Set<Product> productsForBrand, Set<Accountinfo> accountinfos,
			Set<Billinfo> billinfosForPaymentMethod, Set<Account> accountsForType, Set<Product> productsForCategory,
			Set<Account> accountsForRole, Set<Billinfo> billinfosForShippingMethod) {
		this.groupcode = groupcode;
		this.code = code;
		this.name = name;
		this.value = value;
		this.note = note;
		this.iduser01 = iduser01;
		this.iduser02 = iduser02;
		this.date01 = date01;
		this.date02 = date02;
		this.productsForBrand = productsForBrand;
		this.accountinfos = accountinfos;
		this.billinfosForPaymentMethod = billinfosForPaymentMethod;
		this.accountsForType = accountsForType;
		this.productsForCategory = productsForCategory;
		this.accountsForRole = accountsForRole;
		this.billinfosForShippingMethod = billinfosForShippingMethod;
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

	@Column(name = "groupcode", length = 500)
	public String getGroupcode() {
		return this.groupcode;
	}

	public void setGroupcode(String groupcode) {
		this.groupcode = groupcode;
	}

	@Column(name = "code", length = 500)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "name", length = 500)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "value", length = 1000)
	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Column(name = "note", length = 1000)
	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Column(name = "iduser01")
	public Integer getIduser01() {
		return this.iduser01;
	}

	public void setIduser01(Integer iduser01) {
		this.iduser01 = iduser01;
	}

	@Column(name = "iduser02")
	public Integer getIduser02() {
		return this.iduser02;
	}

	public void setIduser02(Integer iduser02) {
		this.iduser02 = iduser02;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date01", length = 19)
	public Date getDate01() {
		return this.date01;
	}

	public void setDate01(Date date01) {
		this.date01 = date01;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date02", length = 19)
	public Date getDate02() {
		return this.date02;
	}

	public void setDate02(Date date02) {
		this.date02 = date02;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "configByBrand")
	public Set<Product> getProductsForBrand() {
		return this.productsForBrand;
	}

	public void setProductsForBrand(Set<Product> productsForBrand) {
		this.productsForBrand = productsForBrand;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "config")
	public Set<Accountinfo> getAccountinfos() {
		return this.accountinfos;
	}

	public void setAccountinfos(Set<Accountinfo> accountinfos) {
		this.accountinfos = accountinfos;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "configByPaymentMethod")
	public Set<Billinfo> getBillinfosForPaymentMethod() {
		return this.billinfosForPaymentMethod;
	}

	public void setBillinfosForPaymentMethod(Set<Billinfo> billinfosForPaymentMethod) {
		this.billinfosForPaymentMethod = billinfosForPaymentMethod;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "configByType")
	public Set<Account> getAccountsForType() {
		return this.accountsForType;
	}

	public void setAccountsForType(Set<Account> accountsForType) {
		this.accountsForType = accountsForType;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "configByCategory")
	public Set<Product> getProductsForCategory() {
		return this.productsForCategory;
	}

	public void setProductsForCategory(Set<Product> productsForCategory) {
		this.productsForCategory = productsForCategory;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "configByRole")
	public Set<Account> getAccountsForRole() {
		return this.accountsForRole;
	}

	public void setAccountsForRole(Set<Account> accountsForRole) {
		this.accountsForRole = accountsForRole;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "configByShippingMethod")
	public Set<Billinfo> getBillinfosForShippingMethod() {
		return this.billinfosForShippingMethod;
	}

	public void setBillinfosForShippingMethod(Set<Billinfo> billinfosForShippingMethod) {
		this.billinfosForShippingMethod = billinfosForShippingMethod;
	}

}
