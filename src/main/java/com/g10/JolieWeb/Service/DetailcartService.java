package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Detailcart;

@Service
public interface DetailcartService {
	List<Detailcart> getDetailcarts(Integer idCart);
}
