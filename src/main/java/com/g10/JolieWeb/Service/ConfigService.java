package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.g10.JolieWeb.Entity.Config;

@Service
public interface ConfigService {
	List<Config> getCategory();
	Config getIdConfig(Integer id);
}
