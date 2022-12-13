package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Favourite;
import com.g10.JolieWeb.Entity.Product;

@Service
public interface FavouriteService {

	List<Favourite> getListFavourites(Accountinfo accountinfo);
	void saveFavourite(Favourite favourite);
	void deleteFavourite(Favourite favourite);
	Favourite findFavourite(Accountinfo accountinfo, Product product);
}
