package com.g10.JolieWeb.Service;

import org.springframework.stereotype.Service;

import com.g10.JolieWeb.Entity.Media;

@Service
public interface MediaService {

	void saveMedia(Media media);
}
