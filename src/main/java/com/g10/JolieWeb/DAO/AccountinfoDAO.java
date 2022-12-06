package com.g10.JolieWeb.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.g10.JolieWeb.Entity.Accountinfo;

@Repository
public interface AccountinfoDAO extends JpaRepository<Accountinfo, Long> {


 
}
