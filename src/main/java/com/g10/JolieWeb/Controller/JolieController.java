package com.g10.JolieWeb.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.g10.JolieWeb.Service.ConfigServiceImpl;

@Controller
public class JolieController {
	@Autowired
	private ConfigServiceImpl configService;

	@RequestMapping(value = { "/", "/trang-chu" }, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("listConfig", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = { "thanh-toan" }, method = RequestMethod.GET)
	public ModelAndView checkout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("checkout");
		mv.addObject("listConfig", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = { "chi-tiet-san-pham" }, method = RequestMethod.GET)
	public ModelAndView productdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productdetail");
		mv.addObject("listConfig", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = { "productfilter" }, method = RequestMethod.GET)
	public ModelAndView productfilter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		mv.addObject("listConfig", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = { "gio-hang" }, method = RequestMethod.GET)
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart");
		mv.addObject("listConfig", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = { "dang-nhap" }, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(value = { "dang-ky" }, method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
}
