package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Product;

@Repository
public interface ProductDAO extends JpaRepository<Product, Integer>{

	@Query("FROM Product p")
	public Page<Product> getProduct(Pageable pageable);

	@Query("SELECT p FROM Product p WHERE configByCategory.value = ?1")
	public List<Product> getProductbyCategory(String category);
	
	@Query("SELECT p FROM Product p WHERE p.id = ?1")
	public Product getDetailProduct(Integer id);

	@Query("SELECT p FROM Product p WHERE p.name LIKE %?1%")
	public List<Product> searchProduct(String name);
	
	@Query("SELECT COUNT(p) FROM Product p")
	int numProduct();
}