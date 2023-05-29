package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.g10.JolieWeb.Entity.Config;
import com.g10.JolieWeb.Entity.Product;

@Service
public interface ConfigService {
	List<Config> getCategory();
	List<Config> getBrand();
	List<Config> getRole();
	Config getIdConfig(Integer id);
	void saveConfig(Config config);
	Config findConfig(String name);
}
