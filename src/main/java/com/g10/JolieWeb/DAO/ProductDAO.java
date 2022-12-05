package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Product;

@Repository
public interface ProductDAO extends JpaRepository<Product, Long>{

	@Query("FROM Product p")
	public List<Product> getProductbyCategory();
}