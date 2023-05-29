package com.g10.JolieWeb.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	@Override
	public List<Billinfo> getBillinfo(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
        Page<Billinfo> pagedResult = billinfoDAO.getBillinfo(paging);

        if (pagedResult.hasContent()) {
            return pagedResult.getContent();
        } else {
            return new ArrayList<Billinfo>();
        }
	}

	@Override
	public int numBillinfo() {
		return billinfoDAO.numBillinfo();
	}

	@Override
	public List<Billinfo> getAllBillinfo() {
		return billinfoDAO.findAll();
	}

}
