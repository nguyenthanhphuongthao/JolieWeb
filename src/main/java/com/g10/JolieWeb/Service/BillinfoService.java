package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Billinfo;

@Service
public interface BillinfoService {
	void saveBillinfo(Billinfo billinfo);
	Billinfo getBillinfo(Integer idBillinfo);
	List<Billinfo> getBillinfo(Integer pageNo, Integer pageSize, String sortBy);
	int numBillinfo();
	List<Billinfo> getAllBillinfo();
}
