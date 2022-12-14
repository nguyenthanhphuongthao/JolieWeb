package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Cart;

@Repository
public interface CartDAO extends JpaRepository <Cart, Long>{
	
	@Query("SELECT c FROM Cart c WHERE c.accountinfo.id=?1 AND c.status=?2")
	public Cart getCart(Integer idAccount, Integer status);
	
	@Query("SELECT c FROM Cart c WHERE c.accountinfo.id=?1 AND c.status=?2 ORDER BY c.id DESC")
	public List<Cart> getListCart(Integer idAccount, Integer status);
}
