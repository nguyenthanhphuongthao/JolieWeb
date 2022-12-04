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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "product", catalog = "jolie")
public class Product implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Config configByBrand;
	private Config configByCategory;
	private Media media;
	private String name;
	private String origin;
	private String description;
	private float price;
	private Float priceSale;
	private int inventory;
	private Integer iduser01;
	private Integer iduser02;
	private Date date01;
	private Date date02;
	private Set<Review> reviews = new HashSet<Review>(0);
	private Set<Detailcart> detailcarts = new HashSet<Detailcart>(0);

	public Product() {
	}

	public Product(Config configByBrand, String name, float price, int inventory) {
		this.configByBrand = configByBrand;
		this.name = name;
		this.price = price;
		this.inventory = inventory;
	}

	public Product(Config configByBrand, Config configByCategory, Media media, String name, String origin,
			String description, float price, Float priceSale, int inventory, Integer iduser01, Integer iduser02,
			Date date01, Date date02, Set<Review> reviews, Set<Detailcart> detailcarts) {
		this.configByBrand = configByBrand;
		this.configByCategory = configByCategory;
		this.media = media;
		this.name = name;
		this.origin = origin;
		this.description = description;
		this.price = price;
		this.priceSale = priceSale;
		this.inventory = inventory;
		this.iduser01 = iduser01;
		this.iduser02 = iduser02;
		this.date01 = date01;
		this.date02 = date02;
		this.reviews = reviews;
		this.detailcarts = detailcarts;
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
	@JoinColumn(name = "brand", nullable = false)
	public Config getConfigByBrand() {
		return this.configByBrand;
	}

	public void setConfigByBrand(Config configByBrand) {
		this.configByBrand = configByBrand;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category")
	public Config getConfigByCategory() {
		return this.configByCategory;
	}

	public void setConfigByCategory(Config configByCategory) {
		this.configByCategory = configByCategory;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "image")
	public Media getMedia() {
		return this.media;
	}

	public void setMedia(Media media) {
		this.media = media;
	}

	@Column(name = "name", nullable = false, length = 500)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "origin", length = 100)
	public String getOrigin() {
		return this.origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	@Column(name = "description", length = 16777215)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "price", nullable = false, precision = 12, scale = 0)
	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	@Column(name = "priceSale", precision = 12, scale = 0)
	public Float getPriceSale() {
		return this.priceSale;
	}

	public void setPriceSale(Float priceSale) {
		this.priceSale = priceSale;
	}

	@Column(name = "inventory", nullable = false)
	public int getInventory() {
		return this.inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Review> getReviews() {
		return this.reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Detailcart> getDetailcarts() {
		return this.detailcarts;
	}

	public void setDetailcarts(Set<Detailcart> detailcarts) {
		this.detailcarts = detailcarts;
	}

}
