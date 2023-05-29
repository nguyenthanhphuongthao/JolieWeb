package com.g10.JolieWeb.DTO;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.g10.JolieWeb.Entity.Account;
import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Config;

public class AccountinfoDTO {
	
	private Integer id;
	private Account account;
	private Config config;
	private String name;
	private Date birth;
	private String address;
	private String email;
	private String phone;
	private Date date02;
	private Set<Cart> carts = new HashSet<Cart>(0);
	
	public AccountinfoDTO() {
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Config getConfig() {
		return config;
	}
	public void setConfig(Config config) {
		this.config = config;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDate02() {
		return date02;
	}
	public void setDate02(Date date02) {
		this.date02 = date02;
	}
	public Set<Cart> getCarts() {
		return carts;
	}
	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}
	
	

}
