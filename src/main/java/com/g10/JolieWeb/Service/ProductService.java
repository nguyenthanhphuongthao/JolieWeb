package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Product;

@Service
public interface ProductService {
	List<Product> getProductbyCategory();
}
