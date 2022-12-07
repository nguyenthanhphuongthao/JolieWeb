package com.g10.JolieWeb.Service;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Cart;

@Service
public interface CartService {
	Cart getCart(Integer idAccount, Integer status);
}
