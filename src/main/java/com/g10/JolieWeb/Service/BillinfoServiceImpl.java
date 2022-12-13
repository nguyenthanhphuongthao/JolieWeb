package com.g10.JolieWeb.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.BillinfoDAO;
import com.g10.JolieWeb.Entity.Billinfo;

@Service
public class BillinfoServiceImpl implements BillinfoService{

	@Autowired
	BillinfoDAO billinfoDAO;
	
	@Override
	public void saveBillinfo(Billinfo billinfo) {
		billinfoDAO.save(billinfo);
	}

	@Override
	public Billinfo getBillinfo(Integer idBillinfo) {
		return billinfoDAO.getBillinfo(idBillinfo);
	}

}
