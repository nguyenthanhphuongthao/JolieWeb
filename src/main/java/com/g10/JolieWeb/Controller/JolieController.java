package com.g10.JolieWeb.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.g10.JolieWeb.Service.ConfigServiceImpl;
import com.g10.JolieWeb.Service.ProductServiceImpl;

@Controller
public class JolieController {
	@Autowired
	private ConfigServiceImpl configService;
	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping(value = { "/", "trang-chu" }, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.getProduct());
		return mv;
	}

	@RequestMapping(value = "thanh-toan", method = RequestMethod.GET)
	public ModelAndView checkout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("checkout");
		mv.addObject("listCategory", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = "chi-tiet-san-pham-{id}", method = RequestMethod.GET)
	public ModelAndView productdetail(@PathVariable Integer id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productdetail");
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("detailProduct", productService.getDetailProduct(id));
		return mv;
	}

	@RequestMapping(value = {"tim-kiem", "danh-muc-{value}"}, method = RequestMethod.GET)
	public ModelAndView productfilter(@PathVariable String value) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProductbyCategory", productService.getProductbyCategory(value));
		return mv;
	}

	@RequestMapping(value = "gio-hang", method = RequestMethod.GET)
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart");
		mv.addObject("listCategory", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = "dang-nhap", method = RequestMethod.GET)
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
