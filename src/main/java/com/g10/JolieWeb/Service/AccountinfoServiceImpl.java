package com.g10.JolieWeb.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.AccountinfoDAO;
import com.g10.JolieWeb.Entity.Accountinfo;

@Service
public class AccountinfoServiceImpl implements AccountinfoService{
	@Autowired
	private AccountinfoDAO accountInfoDAO;
	
	@Override
	public void saveAccountInfo(Accountinfo accountInfo) {
		accountInfoDAO.save(accountInfo);
	}
}
