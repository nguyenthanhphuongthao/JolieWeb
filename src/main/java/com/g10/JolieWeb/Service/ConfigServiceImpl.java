package com.g10.JolieWeb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Config;
import com.g10.JolieWeb.DAO.ConfigDAO;

@Service
public class ConfigServiceImpl implements ConfigService {

	@Autowired
	private ConfigDAO configDAO;
	
	@Override
	public List<Config> getCategory() {
		return configDAO.getCategory();
	}

	@Override
	public Config getIdConfig(Integer id) {
		return configDAO.getIdConfig(id);
	}
}