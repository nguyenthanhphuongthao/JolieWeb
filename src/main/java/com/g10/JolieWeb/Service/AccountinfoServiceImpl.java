package com.g10.JolieWeb.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.AccountinfoDAO;
import com.g10.JolieWeb.Entity.Account;
import com.g10.JolieWeb.Entity.Accountinfo;

@Service
public class AccountinfoServiceImpl implements AccountinfoService{
	@Autowired
	private AccountinfoDAO accountInfoDAO;
	
	@Override
	public void saveAccountInfo(Accountinfo accountInfo) {
//		Accountinfo acc = new Accountinfo();
//		acc.setAccount(accountInfo.getAccount());
//		acc.setName(accountInfo.getName());
//		acc.setBirth(accountInfo.getBirth());
//		acc.setConfig(accountInfo.getConfig());
		accountInfoDAO.save(accountInfo);
	}
}
