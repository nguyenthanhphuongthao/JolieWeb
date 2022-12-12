package com.g10.JolieWeb.Service;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Account;

@Service
public interface AccountService {

	Account findByUsernameAndPassword(String username, String password);
	Account findByUsername(String username);
	void saveAccount(Account account);
}
