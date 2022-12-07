package com.g10.JolieWeb.Service;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Accountinfo;

@Service
public interface AccountinfoService {
	
	void saveAccountInfo(Accountinfo accountInfo);
}
