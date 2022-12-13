package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.FavouriteDAO;
import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Favourite;
import com.g10.JolieWeb.Entity.Product;

@Service
public class FavouriteServiceImpl implements FavouriteService{

	@Autowired
	FavouriteDAO favouriteDAO;
	
	@Override
	public List<Favourite> getListFavourites(Accountinfo accountinfo) {
		return favouriteDAO.getListFavourites(accountinfo);
	}

	@Override
	public void saveFavourite(Favourite favourite) {
		favouriteDAO.save(favourite);
	}

	@Override
	public void deleteFavourite(Favourite favourite) {
		favouriteDAO.delete(favourite);
	}

	@Override
	public Favourite findFavourite(Accountinfo accountinfo, Product product) {
		return favouriteDAO.findFavourite(accountinfo, product);
	}

}
