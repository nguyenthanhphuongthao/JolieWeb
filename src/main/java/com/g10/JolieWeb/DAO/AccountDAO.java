package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Account;
@Repository
public interface AccountDAO extends JpaRepository<Account, Long> {
	Account findByUsernameAndPassword(String username, String password);
	List<Account> findAll();
}
