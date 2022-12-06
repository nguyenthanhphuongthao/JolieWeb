package com.g10.JolieWeb.Controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g10.JolieWeb.DAO.AccountDAO;
import com.g10.JolieWeb.DAO.AccountinfoDAO;
import com.g10.JolieWeb.Entity.Account;
import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Product;
import com.g10.JolieWeb.Service.AccountServiceImpl;
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

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public String displayLogin(Model model) {
		model.addAttribute("account", new Account());
		return "login";
	}

	@PostMapping("/dang-nhap")
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

	@GetMapping("/dang-ky")
	public String showRegistrationForm(Model model) {
		model.addAttribute("AccountInfo", new Accountinfo());

		return "register";
	}
}
