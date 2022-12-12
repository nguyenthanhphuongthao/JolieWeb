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
	public List<Product> getProduct() {
		return productDAO.getProduct();
	}
	@Override
	public List<Product> getProductbyCategory(String category) {
		return productDAO.getProductbyCategory(category);
	}
	@Override
	public Product getDetailProduct(Integer id) {
		return productDAO.getDetailProduct(id);
	}
	@Override
	public List<Product> searchProducts(String name) {
		return productDAO.searchProduct(name);
	}
	@Override
	public void saveProduct(Product product) {
		productDAO.save(product);
	}

}
