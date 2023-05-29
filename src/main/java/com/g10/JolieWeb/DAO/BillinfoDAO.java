package com.g10.JolieWeb.DAO;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.g10.JolieWeb.Entity.Billinfo;

public interface BillinfoDAO extends JpaRepository <Billinfo, Long>{
	
	@Query("SELECT b FROM Billinfo b WHERE id=?1")
	public Billinfo getBillinfo(Integer idBillinfo);
	
	@Query("FROM Billinfo b")
	public Page<Billinfo> getBillinfo(Pageable pageable);
	
	@Query("SELECT COUNT(b) FROM Billinfo b")
	int numBillinfo();
}
