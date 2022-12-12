package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Product;

@Service
public interface CartService {
	Cart getCart(Integer idAccount, Integer status);
	Cart addItemToCart(Product product, Integer quantity, Accountinfo accountinfo);
	void saveCart(Cart cart);
	List<Cart> getListCart(Integer idAccount, Integer status);
}
