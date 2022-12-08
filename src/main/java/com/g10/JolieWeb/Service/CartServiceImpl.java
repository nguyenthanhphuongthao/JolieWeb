package com.g10.JolieWeb.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.CartDAO;
import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Product;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public Cart getCart(Integer idAccount, Integer status) {
		return cartDAO.getCart(idAccount, status);
	}

	@Override
	public Cart addItemToCart(Product product, Integer quantity, Accountinfo accountinfo) {
		return null;
	}

	@Override
	public void saveCart(Cart cart) {
		cartDAO.save(cart);
	}

}
