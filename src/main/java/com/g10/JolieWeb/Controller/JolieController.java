package com.g10.JolieWeb.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JolieController {

	@RequestMapping(value = {"/", "/trang-chu"}, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value = {"thanh-toan"}, method = RequestMethod.GET)
	public ModelAndView checkout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("checkout");
		return mv;
	}
	
	@RequestMapping(value = {"chi-tiet-san-pham"}, method = RequestMethod.GET)
	public ModelAndView productdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productdetail");
		return mv;
	}
	
	@RequestMapping(value = {"productfilter"}, method = RequestMethod.GET)
	public ModelAndView productfilter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		return mv;
	}
	
	@RequestMapping(value = {"gio-hang"}, method = RequestMethod.GET)
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart");
		return mv;
	}
}
