package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.DetailcartDAO;
import com.g10.JolieWeb.Entity.Detailcart;

@Service
public class DetailcartServiceImpl implements DetailcartService{

	@Autowired
	DetailcartDAO detailcartDAO;
	
	@Override
	public List<Detailcart> getDetailcarts(Integer idCart) {
		return detailcartDAO.getDetailcarts(idCart);
	}

}
