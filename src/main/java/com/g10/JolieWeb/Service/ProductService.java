package com.g10.JolieWeb.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Product;

@Service
public interface ProductService {
	List<Product> getProduct(Integer pageNo, Integer pageSize, String sortBy);
	int numProduct();
	List<Product> getProductbyCategory(String category);
	Product getDetailProduct(Integer id);
	List<Product> searchProducts(String name);
	void saveProduct(Product product);
}
