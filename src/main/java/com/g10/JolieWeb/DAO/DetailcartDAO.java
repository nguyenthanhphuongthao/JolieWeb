package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Detailcart;

@Repository
public interface DetailcartDAO extends JpaRepository <Detailcart, Long>{

	@Query("SELECT d FROM Detailcart d WHERE cart.id=?1")
	public List<Detailcart> getDetailcarts(Integer idCart);
}
