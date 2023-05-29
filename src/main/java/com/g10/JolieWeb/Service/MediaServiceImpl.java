package com.g10.JolieWeb.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g10.JolieWeb.DAO.MediaDAO;
import com.g10.JolieWeb.Entity.Media;

@Service
public class MediaServiceImpl implements MediaService {
	@Autowired
	private MediaDAO mediaDAO;

	@Override
	public void saveMedia(Media media) {
		mediaDAO.save(media);
	}

	
}
