package com.g10.JolieWeb.Service;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Billinfo;

@Service
public interface BillinfoService {
	void saveBillinfo(Billinfo billinfo);
}
