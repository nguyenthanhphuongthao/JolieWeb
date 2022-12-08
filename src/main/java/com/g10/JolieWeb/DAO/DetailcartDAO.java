package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Detailcart;
import com.g10.JolieWeb.Entity.Product;

@Repository
public interface DetailcartDAO extends JpaRepository <Detailcart, Long>{

	@Query("SELECT d FROM Detailcart d WHERE cart=?1")
	public List<Detailcart> getDetailcarts(Cart cart);
	
	@Query("SELECT COUNT(d) FROM Detailcart d WHERE cart=?1")
	public Integer getNumDetailcarts(Cart cart);
	
	@Query("SELECT d FROM Detailcart d WHERE cart=?1 AND product=?2")
	Detailcart getDetailcart(Cart cart, Product product);
}
