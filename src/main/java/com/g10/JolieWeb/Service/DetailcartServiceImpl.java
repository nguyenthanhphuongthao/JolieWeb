package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.DetailcartDAO;
import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Detailcart;
import com.g10.JolieWeb.Entity.Product;

@Service
public class DetailcartServiceImpl implements DetailcartService{

	@Autowired
	DetailcartDAO detailcartDAO;
	
	@Override
	public List<Detailcart> getDetailcarts(Cart cart) {
		return detailcartDAO.getDetailcarts(cart);
	}

	@Override
	public void saveDetailcart(Detailcart detailcart) {
		detailcartDAO.save(detailcart);
	}

	@Override
	public Integer getNumDetailcart(Cart cart) {
		return detailcartDAO.getNumDetailcarts(cart);
	}

	@Override
	public Detailcart getDetailcart(Cart cart, Product product) {
		return detailcartDAO.getDetailcart(cart, product);
	}

	@Override
	public void deleteDetailcart(Detailcart detailcart) {
		detailcartDAO.delete(detailcart);
	}
}
