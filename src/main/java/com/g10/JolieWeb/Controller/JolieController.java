package com.g10.JolieWeb.Controller;

import java.sql.Date;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.g10.JolieWeb.Entity.Account;
import com.g10.JolieWeb.Entity.Accountinfo;
import com.g10.JolieWeb.Entity.Billinfo;
import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Detailcart;
import com.g10.JolieWeb.Entity.Product;
import com.g10.JolieWeb.Entity.Favourite;
import com.g10.JolieWeb.Service.AccountServiceImpl;
import com.g10.JolieWeb.Service.AccountinfoServiceImpl;
import com.g10.JolieWeb.Service.BillinfoServiceImpl;
import com.g10.JolieWeb.Service.CartServiceImpl;
import com.g10.JolieWeb.Service.ConfigServiceImpl;
import com.g10.JolieWeb.Service.DetailcartServiceImpl;
import com.g10.JolieWeb.Service.FavouriteServiceImpl;
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
	@Autowired
	private BillinfoServiceImpl billinfoService;
	@Autowired
	private FavouriteServiceImpl favouriteService;

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
	public ModelAndView checkout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Cart cart = (Cart) session.getAttribute("cart");
		mv.setViewName("checkout");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("cart", cart);
		mv.addObject("listCart", detailcartService.getDetailcarts(cart));
		mv.addObject("billInfo", new Billinfo());
		return mv;
	}

	@PostMapping("thanh-toan")
	public String getBillinfoCheckout(@ModelAttribute("billInfo") Billinfo billinfo, BindingResult result,
			HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		cart.setStatus(1);
		List<Detailcart> detailcarts = detailcartService.getDetailcarts(cart);
		for (int i = 0; i < detailcarts.size(); i++) {
			int quantity = detailcarts.get(i).getQuantity();
			Product product = detailcarts.get(i).getProduct();
			product.setInventory(product.getInventory() - quantity);
			productService.saveProduct(product);
		}
		session.setAttribute("numDetailcart", 0);
		billinfo.setCart(cart);
		billinfo.setConfigByStatus(configService.getIdConfig(19));
		billinfo.setTotalPrice(cart.getTotalPrice());
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		billinfo.setDatePayment(date);
		billinfoService.saveBillinfo(billinfo);
		cartService.saveCart(cart);
		session.removeAttribute("cart");
		return "redirect:/trang-chu";
	}

	@RequestMapping(value = "chi-tiet-san-pham-{id}", method = RequestMethod.GET)
	public ModelAndView productdetail(@PathVariable Integer id, HttpSession session) {
		session.setAttribute("page", "chi-tiet-san-pham-{id}");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productdetail");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("detailProduct", productService.getDetailProduct(id));
		mv.addObject("numDetailCart", session.getAttribute("numDetailCart"));
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
	public String displayLogin(Model model, HttpSession session) {
		model.addAttribute("account", new Account());
		return "login";
	}

	@PostMapping("dang-nhap")
	public String login(Model model, @ModelAttribute("account") Account account, BindingResult result,
			HttpSession session) {
		Account acc = accountService.findByUsernameAndPassword(account.getUsername(), account.getPassword());
		if (Objects.nonNull(acc)) {
			session.removeAttribute("alert");
			session.setAttribute("loginAccount", acc.getAccountinfo());
			session.setAttribute("cart", cartService.getCart(acc.getAccountinfo().getId(), 0));
			session.setAttribute("numDetailcart", detailcartService.getNumDetailcart(cartService.getCart(acc.getAccountinfo().getId(), 0)));
			return "redirect:/trang-chu";
		} else {
			session.setAttribute("alert", "Sai t??n ????ng nh???p ho???c m???t kh???u!");
			model.addAttribute("alert", session.getAttribute("alert"));
			return "redirect:/dang-nhap";
		}
	}

	@RequestMapping(value = "dang-xuat", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginAccount");
		session.removeAttribute("alert");
		session.removeAttribute("cart");
		return "redirect:/trang-chu";
	}

	@RequestMapping("tim-kiem")
	public ModelAndView searchProduct(@ModelAttribute("product") Product product, BindingResult result,
			HttpSession session) {
		session.setAttribute("page", "tim-kiem");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.searchProducts(product.getName()));
		return mv;
	}

	@RequestMapping(value = "dang-ky", method = RequestMethod.GET)
	public String signup(Model model, HttpSession session) {
		model.addAttribute("accountInfo", new Accountinfo());
		return "register";
	}

	@PostMapping("dang-ky")
	public String saveAccountSignup(@ModelAttribute("accountInfo") Accountinfo accountInfo, BindingResult result,
			HttpSession session) {
		if (accountService.findByUsername(accountInfo.getAccount().getUsername()) == null) {
			Account acc = new Account();
			acc = accountInfo.getAccount();
			acc.setConfigByRole(configService.getIdConfig(2));
			acc.setConfigByType(configService.getIdConfig(5));
			accountService.saveAccount(acc);
			accountInfoService.saveAccountInfo(accountInfo);
			session.removeAttribute("alert");
			session.setAttribute("loginAccount", accountInfo);
			session.setAttribute("cart", cartService.getCart(accountInfo.getId(), 0));
			session.setAttribute("numDetailcart", detailcartService.getNumDetailcart(cartService.getCart(accountInfo.getId(), 0)));
			return "redirect:/trang-chu";
		} else {
			session.setAttribute("alert", "???? t???n t???i t??i kho???n v???i t??n ????ng nh???p n??y");
		}
		return "redirect:/dang-ky";
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
		session.setAttribute("numDetailcart", detailcartService.getNumDetailcart(cart));
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
		if (detailcartService.getNumDetailcart(cart) == 0)
			session.setAttribute("numDetailcart", detailcartService.getNumDetailcart(cart));
		else {
			session.setAttribute("numDetailcart", detailcartService.getNumDetailcart(cart));
		}
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

	@RequestMapping(value = "thong-tin-tai-khoan", method = RequestMethod.GET)
	public String AccountInfo(Model model, HttpSession session) {
		model.addAttribute("accountInfo", session.getAttribute("loginAccount"));
		model.addAttribute("product", new Product());
		model.addAttribute("listCategory", configService.getCategory());
		return "accountInfo";
	}

	@PostMapping("thong-tin-tai-khoan")
	public String ChangePass(@ModelAttribute("accountInfo") Accountinfo accountInfo, BindingResult result,
			HttpSession session) {
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		Account account = loginAccount.getAccount();
		loginAccount.setAddress(accountInfo.getAddress());
		loginAccount.setName(accountInfo.getName());
		loginAccount.getConfig().setId(accountInfo.getConfig().getId());
		loginAccount.setEmail(accountInfo.getEmail());
		loginAccount.setPhone(accountInfo.getPhone());

		if (accountInfo.getBirth() == null) {
			loginAccount.setBirth(loginAccount.getBirth());
		} else {
			loginAccount.setBirth(accountInfo.getBirth());
		}
		if (accountInfo.getAccount().getPassword() == "") {
			account.setPassword(loginAccount.getAccount().getPassword());
		} else {
			account.setPassword(accountInfo.getAccount().getPassword());
		}
		accountService.saveAccount(account);
		accountInfoService.saveAccountInfo(loginAccount);
		session.setAttribute("loginAccount", loginAccount);
		return "redirect:/thong-tin-tai-khoan";
	}

	@RequestMapping(value = "danh-sach-yeu-thich", method = RequestMethod.GET)
	public ModelAndView Favourite(HttpSession session) {
		session.setAttribute("page", "danh-sach-yeu-thich");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("favourite");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listFavourite",
				favouriteService.getListFavourites((Accountinfo) session.getAttribute("loginAccount")));
		return mv;
	}

	@RequestMapping(value = "them-vao-danh-sach-yeu-thich-{id}", method = RequestMethod.GET)
	public String addItemtoFav(@PathVariable("id") Integer idProduct, HttpSession session) {
		String page = (String) session.getAttribute("page");
		Product product = productService.getDetailProduct(idProduct);
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		List<Favourite> favourites = favouriteService.getListFavourites(loginAccount);
		Favourite favourite = new Favourite(loginAccount, product);
		if (session.getAttribute("loginAccount") == null) {
			return "redirect:/dang-nhap";
		}
		if (isExistFav(idProduct, favourites) == -1) {
			favouriteService.saveFavourite(favourite);
		}
		
		return "redirect:/" + page;
	}

	private int isExistFav(Integer id, List<Favourite> favourites) {
		for (int i = 0; i < favourites.size(); i++) {
			if (favourites.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}

	@RequestMapping(value = "xoa-khoi-danh-sach-yeu-thich-{id}", method = RequestMethod.GET)
	public String removeItemFromFav(@PathVariable("id") Integer idProduct, HttpSession session) {
		Product product = productService.getDetailProduct(idProduct);
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		Favourite favourite = favouriteService.findFavourite(loginAccount, product);
		favouriteService.deleteFavourite(favourite);
		String page = (String) session.getAttribute("page");
		return "redirect:/" + page;
	}

	@RequestMapping(value = "quan-ly-don-hang", method = RequestMethod.GET)
	public ModelAndView OrderBill(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		mv.addObject("listBill", cartService.getListCart(loginAccount.getId(), 1));
		return mv;
	}
	
	@RequestMapping(value = "huy-don-hang-{id}", method = RequestMethod.GET)
	public String cancelBill(@PathVariable("id") Integer idBillinfo) {
		Billinfo billinfo = billinfoService.getBillinfo(idBillinfo);
		billinfo.setConfigByStatus(configService.getIdConfig(22));
		billinfoService.saveBillinfo(billinfo);
		return "redirect:/quan-ly-don-hang";
	}
	
	@RequestMapping(value = "chi-tiet-don-hang-{id}", method = RequestMethod.GET)
	public ModelAndView viewBillinfo(@PathVariable("id") Integer idBillinfo,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("detailbill");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("numDetailCart", session.getAttribute("numDetailCart"));
		Billinfo billinfo = billinfoService.getBillinfo(idBillinfo);
		mv.addObject("billinfo", billinfo);
		mv.addObject("cart", billinfo.getCart());
		mv.addObject("listProductBill", detailcartService.getDetailcarts(billinfo.getCart()));
		return mv;
	}
}
