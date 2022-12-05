package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.ProductDAO;
import com.g10.JolieWeb.Entity.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Product> getProductbyCategory() {
		return productDAO.getProductbyCategory();
	}

}
