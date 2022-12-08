package com.g10.JolieWeb.Controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

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
import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Detailcart;
import com.g10.JolieWeb.Entity.Product;
import com.g10.JolieWeb.Service.AccountServiceImpl;
import com.g10.JolieWeb.Service.AccountinfoServiceImpl;
import com.g10.JolieWeb.Service.CartServiceImpl;
import com.g10.JolieWeb.Service.ConfigServiceImpl;
import com.g10.JolieWeb.Service.DetailcartServiceImpl;
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
	@Autowired
	private CartServiceImpl cartService;
	@Autowired
	private DetailcartServiceImpl detailcartService;

	@RequestMapping(value = { "/", "trang-chu" }, method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		session.setAttribute("page", "trang-chu");
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
	public ModelAndView productdetail(@PathVariable Integer id, HttpSession session) {
		session.setAttribute("page", "chi-tiet-san-pham-{id}");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productdetail");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("detailProduct", productService.getDetailProduct(id));
		return mv;
	}

	@RequestMapping(value = "danh-muc-{value}", method = RequestMethod.GET)
	public ModelAndView productfilter(@PathVariable String value, HttpSession session) {
		session.setAttribute("page", "danh-muc-{value}");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.getProductbyCategory(value));
		return mv;
	}

	@RequestMapping(value = "gio-hang", method = RequestMethod.GET)
	public ModelAndView cart(HttpSession session) {
		session.setAttribute("page", "gio-hang");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		Cart cart = new Cart();
		cart = cartService.getCart(loginAccount.getId(), 0);
		if (cart != null) {
			mv.addObject("cartInfo", cart);
			mv.addObject("listCart", detailcartService.getDetailcarts(cart));
		}
		return mv;
	}

	@RequestMapping(value = "dang-nhap", method = RequestMethod.GET)
	public String displayLogin(Model model) {
		model.addAttribute("account", new Account());
		return "login";
	}

	@PostMapping("dang-nhap")
	public String login(@ModelAttribute("account") Account account, BindingResult result, HttpSession session) {

		Account acc = accountService.findByUsernameAndPassword(account.getUsername(), account.getPassword());
		if (Objects.nonNull(acc)) {
			session.setAttribute("loginAccount", acc.getAccountinfo());
			session.setAttribute("cart", cartService.getCart(acc.getAccountinfo().getId(), 0));
			return "redirect:/trang-chu";
		} else {
			return "redirect:/dang-nhap";
		}
	}

	@RequestMapping(value = "dang-xuat", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginAccount");
		return "redirect:/trang-chu";
	}

	@PostMapping("tim-kiem")
	public ModelAndView searchProduct(@ModelAttribute("product") Product product, BindingResult result,
			HttpSession session) {
		session.setAttribute("page", "trang-chu");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.searchProducts(product.getName()));
		return mv;
	}

	@RequestMapping(value = "dang-ky", method = RequestMethod.GET)
	public String signup(Model model) {
		model.addAttribute("accountInfo", new Accountinfo());
		return "register";
	}

	@PostMapping("dang-ky")
	public String saveAccountSignup(@Validated @ModelAttribute("accountInfo") Accountinfo accountInfo,
			BindingResult result, HttpSession session) {
		Account acc = new Account();
		acc = accountInfo.getAccount();
		acc.setConfigByRole(configService.getIdConfig(2));
		acc.setConfigByType(configService.getIdConfig(5));
		accountService.saveAccount(acc);
		accountInfoService.saveAccountInfo(accountInfo);
		return "redirect:/dang-nhap";
	}

	@RequestMapping(value = "them-vao-gio-hang-{id}", method = RequestMethod.GET)
	public String addItemtoCart(@PathVariable("id") Integer idProduct, HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		Product product = productService.getDetailProduct(idProduct);
		if (session.getAttribute("loginAccount") == null)
			return "redirect:/dang-nhap";
		if (session.getAttribute("cart") == null) {
			cart = new Cart((Accountinfo) session.getAttribute("loginAccount"));
			cartService.saveCart(cart);
			Detailcart detailcart = new Detailcart(cart, product, 1, product.getPrice());
			detailcartService.saveDetailcart(detailcart);
			cart.setTotalPrice(product.getPrice());
			cartService.saveCart(cart);
		} else {
			int index = isExist(idProduct, detailcartService.getDetailcarts(cart));
			if (index == -1) {
				Detailcart detailcart = new Detailcart(cart, product, 1, product.getPrice());
				detailcartService.saveDetailcart(detailcart);
			} else {
				Detailcart detailcart = detailcartService.getDetailcart(cart, product);
				detailcart.setQuantity(detailcart.getQuantity() + 1);
				detailcart.setTotalPrice(detailcart.getTotalPrice() + product.getPrice());
			}
			cart.setTotalPrice(cart.getTotalPrice() + product.getPrice());
			cartService.saveCart(cart);
		}
		session.setAttribute("cart", cart);
		String page = (String) session.getAttribute("page");
		return "redirect:/" + page;
	}

	private int isExist(Integer id, List<Detailcart> detailcarts) {
		for (int i = 0; i < detailcarts.size(); i++) {
			if (detailcarts.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}

	@RequestMapping(value = "xoa-san-pham-{id}", method = RequestMethod.GET)
	public String removeItemCart(@PathVariable("id") Integer idProduct, HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		Product product = productService.getDetailProduct(idProduct);
		Detailcart detailcart = detailcartService.getDetailcart(cart, product);
		detailcartService.deleteDetailcart(detailcart);
		cart.setTotalPrice(cart.getTotalPrice() - detailcart.getTotalPrice());
		cartService.saveCart(cart);
		session.setAttribute("cart", cart);
		return "redirect:/gio-hang";
	}

	@RequestMapping(value = "giam-so-luong-san-pham-{id}", method = RequestMethod.GET)
	public String updateCart(@PathVariable("id") Integer idProduct, HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		Product product = productService.getDetailProduct(idProduct);
		Detailcart detailcart = detailcartService.getDetailcart(cart, product);
		if (detailcart.getQuantity() > 1) {
			detailcart.setTotalPrice(detailcart.getTotalPrice() - detailcart.getProduct().getPrice());
			detailcart.setQuantity(detailcart.getQuantity() - 1);
			detailcartService.saveDetailcart(detailcart);
		} else {
			detailcartService.deleteDetailcart(detailcart);
		}
		cart.setTotalPrice(cart.getTotalPrice() - detailcart.getProduct().getPrice());
		cartService.saveCart(cart);
		session.setAttribute("cart", cart);
		return "redirect:/gio-hang";
	}

	@RequestMapping(value = "thong-tin", method = RequestMethod.GET)
	public String AccountInfo(Model model, HttpSession session) {
	model.addAttribute("accountInfo", session.getAttribute("loginAccount"));
		return "AccountInfo";
	}

	@PostMapping("thong-tin")
	public String ChangePass(@ModelAttribute("accountInfo") Accountinfo accountInfo, BindingResult result,
			HttpSession session) {

		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		
		Account account = loginAccount.getAccount();
		loginAccount.setAddress(accountInfo.getAddress());
		
		loginAccount.setName(accountInfo.getName());
		loginAccount.getConfig().setId(accountInfo.getConfig().getId());
		if(accountInfo.getBirth() == null)
		{
			loginAccount.setBirth(loginAccount.getBirth());
		}
		else {
			loginAccount.setBirth(accountInfo.getBirth());
		}
		
		if (accountInfo.getAccount().getPassword() == "") {
			account.setPassword(loginAccount.getAccount().getPassword());	
		}
		else {
			account.setPassword(accountInfo.getAccount().getPassword());
		}
		
		accountService.saveAccount(account);

		accountInfoService.saveAccountInfo(loginAccount);
		return "redirect:/trang-chu";
	}
}
