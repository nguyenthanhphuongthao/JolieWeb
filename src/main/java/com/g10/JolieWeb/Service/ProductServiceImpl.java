package com.g10.JolieWeb.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.ProductDAO;
import com.g10.JolieWeb.Entity.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Product> getProduct(Integer pageNo, Integer pageSize, String sortBy) 
	{
        Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
        Page<Product> pagedResult = productDAO.getProduct(paging);

        if (pagedResult.hasContent()) {
            return pagedResult.getContent();
        } else {
            return new ArrayList<Product>();
        }
		
	}
	@Override
	public int numProduct() {
		return productDAO.numProduct();
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
