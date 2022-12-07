package com.g10.JolieWeb.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Config;



@Repository
public interface ConfigDAO extends JpaRepository <Config, Long>{

	@Query("SELECT c FROM Config c WHERE groupcode='CATEGORY'")
	public List<Config> getCategory();
	
	@Query("SELECT c FROM Config c WHERE id=?1")
	public Config getIdConfig(Integer id);
}
