package com.g10.JolieWeb.DTO;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.g10.JolieWeb.Entity.Config;
import com.g10.JolieWeb.Entity.Detailcart;
import com.g10.JolieWeb.Entity.Media;

public class ProductDTO {
	
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
	private Set<Detailcart> detailcarts = new HashSet<Detailcart>(0);
	
	public ProductDTO() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Config getConfigByBrand() {
		return configByBrand;
	}

	public void setConfigByBrand(Config configByBrand) {
		this.configByBrand = configByBrand;
	}

	public Config getConfigByCategory() {
		return configByCategory;
	}

	public void setConfigByCategory(Config configByCategory) {
		this.configByCategory = configByCategory;
	}

	public Media getMedia() {
		return media;
	}

	public void setMedia(Media media) {
		this.media = media;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Float getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(Float priceSale) {
		this.priceSale = priceSale;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public Integer getIduser01() {
		return iduser01;
	}

	public void setIduser01(Integer iduser01) {
		this.iduser01 = iduser01;
	}

	public Integer getIduser02() {
		return iduser02;
	}

	public void setIduser02(Integer iduser02) {
		this.iduser02 = iduser02;
	}

	public Date getDate01() {
		return date01;
	}

	public void setDate01(Date date01) {
		this.date01 = date01;
	}

	public Date getDate02() {
		return date02;
	}

	public void setDate02(Date date02) {
		this.date02 = date02;
	}

	public Set<Detailcart> getDetailcarts() {
		return detailcarts;
	}

	public void setDetailcarts(Set<Detailcart> detailcarts) {
		this.detailcarts = detailcarts;
	}
}
