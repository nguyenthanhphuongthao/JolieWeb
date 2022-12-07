package com.g10.JolieWeb.Controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.g10.JolieWeb.Entity.Account;
import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Product;
import com.g10.JolieWeb.Service.AccountServiceImpl;
import com.g10.JolieWeb.Service.AccountinfoServiceImpl;
import com.g10.JolieWeb.Service.ConfigServiceImpl;
import com.g10.JolieWeb.Service.ProductServiceImpl;

@Controller
public class JolieController {
	@Autowired
	private ConfigServiceImpl configService;
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private AccountServiceImpl accountService;
	@Autowired
	private AccountinfoServiceImpl accountInfoService;

	@RequestMapping(value = { "/", "trang-chu" }, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.getProduct());
		return mv;
	}

	@RequestMapping(value = "thanh-toan", method = RequestMethod.GET)
	public ModelAndView checkout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("checkout");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = "chi-tiet-san-pham-{id}", method = RequestMethod.GET)
	public ModelAndView productdetail(@PathVariable Integer id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productdetail");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("detailProduct", productService.getDetailProduct(id));
		return mv;
	}

	@RequestMapping(value = "danh-muc-{value}", method = RequestMethod.GET)
	public ModelAndView productfilter(@PathVariable String value) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.getProductbyCategory(value));
		return mv;
	}

	@RequestMapping(value = "gio-hang", method = RequestMethod.GET)
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		return mv;
	}

	@RequestMapping(value = "dang-nhap", method = RequestMethod.GET)
	public String displayLogin(Model model) {
		model.addAttribute("account", new Account());
		return "login";
	}

	@PostMapping("dang-nhap")
	public String login(@ModelAttribute("account") Account account, BindingResult result) {

		Account oauthUser = accountService.findByUsernameAndPassword(account.getUsername(), account.getPassword());
		if (Objects.nonNull(oauthUser)) {
			return "redirect:/trang-chu";
		} else {
			return "redirect:/dang-nhap";
		}
	}

	@PostMapping("tim-kiem")
	public ModelAndView searchProduct(@ModelAttribute("product") Product product, BindingResult result) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.searchProducts(product.getName()));
		return mv;
	}

	@RequestMapping(value = "dang-ky", method = RequestMethod.GET)
	public String showFormForAdd(Model model) {
		model.addAttribute("accountInfo", new Accountinfo());
		return "register";
	}

	@PostMapping("dang-ky")
	public String saveCustomer(@Validated @ModelAttribute("accountInfo") Accountinfo accountInfo, BindingResult result) {
		Account acc = new Account();
		acc = accountInfo.getAccount();
		acc.setConfigByRole(configService.getIdConfig(2));
		acc.setConfigByType(configService.getIdConfig(5));
		accountService.saveAccount(acc);
		accountInfoService.saveAccountInfo(accountInfo);
		return "redirect:/trang-chu";
	}

}
