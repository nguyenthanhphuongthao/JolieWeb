package com.g10.JolieWeb;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cloudinary.Cloudinary;

@SpringBootApplication
@Configuration
public class JolieWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(JolieWebApplication.class, args);
	}
	@Bean
	public Cloudinary cloudinary(){
		Map<String, String> config = new HashMap<>();
		config.put("cloud_name", "dt3xylr2x");
		config.put("api_key", "162511964791273");
		config.put("api_secret", "eZkWDwuH4NJZxPBcTBNljLwuBtQ");
		Cloudinary cloudinary = new Cloudinary(config);
		return cloudinary;
	}
}
