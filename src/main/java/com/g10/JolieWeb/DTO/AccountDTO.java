package com.g10.JolieWeb.DTO;

import java.util.Date;

import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Config;

public class AccountDTO {
	
	private String username;
	private Config configByType;
	private Config configByRole;
	private String password;
	private Date date01;
	private Date date02;
	private Accountinfo accountinfo;
	
	public AccountDTO() {
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Config getConfigByType() {
		return configByType;
	}

	public void setConfigByType(Config configByType) {
		this.configByType = configByType;
	}

	public Config getConfigByRole() {
		return configByRole;
	}

	public void setConfigByRole(Config configByRole) {
		this.configByRole = configByRole;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public Accountinfo getAccountinfo() {
		return accountinfo;
	}

	public void setAccountinfo(Accountinfo accountinfo) {
		this.accountinfo = accountinfo;
	}
	
	

}
