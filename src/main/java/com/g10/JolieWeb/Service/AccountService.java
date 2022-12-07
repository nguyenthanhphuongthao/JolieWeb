package com.g10.JolieWeb.Service;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Account;
import com.g10.JolieWeb.Entity.Accountinfo;

@Service
public interface AccountService {

	Account findByUsernameAndPassword(String username, String password);
	void saveAccount(Account account);
}
