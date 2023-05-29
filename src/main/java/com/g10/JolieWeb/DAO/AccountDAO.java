package com.g10.JolieWeb.DAO;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Account;

@Repository
public interface AccountDAO extends JpaRepository<Account, Long> {
	Optional<Account> findByUsername(String userName);
	Account findByUsernameAndPassword(String username, String password);
	List<Account> findAll();
	
	@Query("SELECT a FROM Account a WHERE username=?1")
	public Account findByUserName(String username);
}
