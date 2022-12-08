package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Detailcart;
import com.g10.JolieWeb.Entity.Product;

@Service
public interface DetailcartService {
	List<Detailcart> getDetailcarts(Cart cart);
	Detailcart getDetailcart(Cart cart, Product product);
	void saveDetailcart(Detailcart detailcart);
	Integer getNumDetailcart(Cart cart);
	void deleteDetailcart(Detailcart detailcart);
}
