package com.g10.JolieWeb.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.AccountDAO;
import com.g10.JolieWeb.Entity.Account;

@Service
public class AccountServiceImpl implements AccountService  {

	@Autowired
	private AccountDAO accountDAO;

	@Override
	public Account findByUsernameAndPassword(String username, String password) {
		return accountDAO.findByUsernameAndPassword(username, password);
	}

	@Override
	public void saveAccount(Account account) {
		accountDAO.save(account);
	}

	@Override
	public Account findByUsername(String username) {
		return accountDAO.findByUsername(username);
	}
}
