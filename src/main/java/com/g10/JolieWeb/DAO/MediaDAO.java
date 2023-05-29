package com.g10.JolieWeb.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Media;

@Repository
public interface MediaDAO extends JpaRepository <Media, Long> {
	
}
