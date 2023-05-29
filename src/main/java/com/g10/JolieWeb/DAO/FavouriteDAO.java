package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Favourite;
import com.g10.JolieWeb.Entity.Product;

@Repository
public interface FavouriteDAO extends JpaRepository <Favourite, Long>{

	@Query("SELECT f FROM Favourite f WHERE accountinfo=?1")
	public List<Favourite> getListFavourites(Accountinfo accountinfo);
	
	@Query("SELECT f FROM Favourite f WHERE accountinfo=?1 AND product=?2")
	public Favourite findFavourite(Accountinfo accountinfo, Product product);
}
