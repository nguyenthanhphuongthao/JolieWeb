package com.g10.JolieWeb.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JolieController {

	@RequestMapping("home")
	public String index() {
		return "index";
	}
}
