package com.g10.JolieWeb.Controller;

import java.sql.Date;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g10.JolieWeb.DTO.AccountDTO;
import com.g10.JolieWeb.DTO.AccountinfoDTO;
import com.g10.JolieWeb.DTO.BillinfoDTO;
import com.g10.JolieWeb.DTO.ProductDTO;
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
public class CustomerController {
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
	
	 private static final String PHONE_NUMBER_PATTERN = "\\d{10}"; 

	public static boolean isValidPhoneNumber(String phoneNumber) {
	    Pattern pattern = Pattern.compile(PHONE_NUMBER_PATTERN);
	    Matcher matcher = pattern.matcher(phoneNumber);
	    return matcher.matches();
	}
	public static boolean isValidEmail(String input) {
        String regex = "[!#$%^&*(),?\":{}|<>/'+;=-]";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.find();
    }
	public static boolean containsSpecialCharacter(String input) {
		  Pattern specialCharPattern = Pattern.compile("[!\"#$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~]");
	        Matcher specialCharMatcher = specialCharPattern.matcher(input);

	        for (char c : input.toCharArray()) {
	            if (Character.isLetter(c) && !Character.isLetterOrDigit(c)) {
	                return true; 
	            }
	        }

	        return specialCharMatcher.find();
    }
	public static boolean containsSpecialInput(String input) {
        String regex = "[!@#$%^&*().?\\\":{}|<>/'+;=-]";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.find();
    }
	
	public static boolean isStrongPassword(String password) {
		return password.length() >= 6 &&
				password.length() <= 25 &&
				password.matches(".*[A-Z].*") &&
				password.matches(".*[a-z].*") &&
				password.matches(".*\\d.*") &&
				containsSpecialCharacter(password);
	}
	 
	@GetMapping(value = { "/", "trang-chu" })
	public ModelAndView index(HttpSession session, @RequestParam(defaultValue = "0") Integer pageNo,
			@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "id") String sortBy) {
		session.setAttribute("page", "trang-chu");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		int numProduct = productService.numProduct();
		int maxPage = (numProduct / pageSize) - 1;
		mv.addObject("listProduct", productService.getProduct(pageNo, pageSize, sortBy));
		mv.addObject("pageNo", pageNo);
		mv.addObject("maxPage", maxPage);
		return mv;
	}

	@GetMapping(value = "thanh-toan")
	public ModelAndView checkout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Cart cart = (Cart) session.getAttribute("cart");
		List<Detailcart> detailcarts = detailcartService.getDetailcarts(cart);
		for (int i = 0; i < detailcarts.size(); i++) {
			Product product = detailcarts.get(i).getProduct();
			if (detailcarts.get(i).getQuantity() > product.getInventory()) {
				session.setAttribute("alert", "Số lượng hàng trong kho của sản phẩm " + product.getName()
						+ " không đủ!\n Vui lòng giảm số lượng!");
				mv.addObject("alert", session.getAttribute("alert"));
				mv.setViewName("redirect:/gio-hang");
				return mv;
			} else {
				session.removeAttribute("alert");
			}
		}
		mv.setViewName("checkout");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("cart", cart);
		mv.addObject("listCart", detailcartService.getDetailcarts(cart));
		mv.addObject("billInfo", new Billinfo());
		return mv;
	}

	@PostMapping("thanh-toan")
	public String getBillinfoCheckout(@ModelAttribute("billInfo") BillinfoDTO billinfoDTO, HttpSession session) {
		Billinfo billinfo = Billinfo.fromDTO(billinfoDTO);
		Cart cart = (Cart) session.getAttribute("cart");
		cart.setStatus(1);
		List<Detailcart> detailcarts = detailcartService.getDetailcarts(cart);
		for (int i = 0; i < detailcarts.size(); i++) {
			int quantity = detailcarts.get(i).getQuantity();
			Product product = detailcarts.get(i).getProduct();
			product.setInventory(product.getInventory() - quantity);
			productService.saveProduct(product);
		}
		if( containsSpecialInput(billinfo.getRecipientName())==false 
				&& containsSpecialInput(billinfo.getShippingAddress())==false
				&& isValidPhoneNumber(billinfo.getRecipientPhone())== true)
		{
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
			session.removeAttribute("messageShipInfo");
			return "redirect:/trang-chu";
		}

		session.setAttribute("messageShipInfo", "Kiểm tra lại thông tin bạn vừa nhập!");
		return "redirect:/thanh-toan";
	}

	@GetMapping(value = "chi-tiet-san-pham-{id}")
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

	@GetMapping(value = "danh-muc-{value}")
	public ModelAndView productfilter(@PathVariable String value, HttpSession session) {
		if (value != null)
		{
			session.setAttribute("ctg", value);
		}
		session.setAttribute("page", "danh-muc-" + (String) session.getAttribute("ctg"));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("productfilter");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.getProductbyCategory(value));
		return mv;
	}

	@GetMapping(value = "gio-hang")
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

	@GetMapping(value = "dang-nhap")
	public String displayLogin(Model model, HttpSession session) {
		session.removeAttribute("loginAccount");
		model.addAttribute("account", new Account());
		return "login";
	}

	@PostMapping("dang-nhap")
	public String login(Model model, @ModelAttribute("account") AccountDTO account, HttpSession session) {
		session.removeAttribute("loginAccount");
		Account acc = accountService.findByUserName(account.getUsername());
		if (Objects.nonNull(acc) && acc.getConfigByRole().getId() == 2 && BCrypt.checkpw(account.getPassword(), acc.getPassword())) {
			session.removeAttribute("alert");
			acc.setPassword(null);
			session.setAttribute("loginAccount", acc.getAccountinfo());
			session.setAttribute("cart", cartService.getCart(acc.getAccountinfo().getId(), 0));
			session.setAttribute("numDetailcart",
					detailcartService.getNumDetailcart(cartService.getCart(acc.getAccountinfo().getId(), 0)));
			return "redirect:/trang-chu";
		} else {
			session.removeAttribute("loginAccount");
			session.setAttribute("alert", "Sai tên đăng nhập hoặc mật khẩu!");
			model.addAttribute("alert", session.getAttribute("alert"));
			return "redirect:/dang-nhap";
		}
	}

	@GetMapping(value = "dang-xuat")
	public String logout(HttpSession session) {
		session.removeAttribute("loginAccount");
		session.removeAttribute("alert");
		session.removeAttribute("cart");
		return "redirect:/trang-chu";
	}
	
	@PostMapping("tim-kiem")
	public ModelAndView searchProduct(@ModelAttribute("product") ProductDTO product, HttpSession session ) {
		 
		session.setAttribute("page", "tim-kiem");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.searchProducts(product.getName()));
		session.setAttribute("search", product.getName());
		return mv;
	}
	
	@GetMapping("tim-kiem")
	public ModelAndView searchProducts(HttpSession session) {
		session.setAttribute("page", "tim-kiem");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search");
		mv.addObject("product", new Product());
		Product product = new Product();
		product.setName((String)session.getAttribute("search"));
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listProduct", productService.searchProducts(product.getName()));
		return mv;
	}

	@GetMapping(value = "dang-ky")
	public String signup(Model model, HttpSession session) {
		model.addAttribute("accountInfo", new Accountinfo());
		return "register";
	}

	@PostMapping("dang-ky")
	public String saveAccountSignup(@ModelAttribute("accountInfo") AccountinfoDTO accountInfoDTO, BindingResult result,
			HttpSession session) {
		if (accountInfoDTO.getAccount().getUsername().length() <= 25 && containsSpecialCharacter(accountInfoDTO.getAccount().getUsername()) == false
				&& isStrongPassword(accountInfoDTO.getAccount().getPassword())== true) {
			if (accountService.findByUserName(accountInfoDTO.getAccount().getUsername()) == null) {
				Account acc = new Account();
				acc = accountInfoDTO.getAccount();
				acc.setPassword(BCrypt.hashpw(acc.getPassword(), BCrypt.gensalt()));
				acc.setConfigByRole(configService.getIdConfig(2));
				acc.setConfigByType(configService.getIdConfig(5));
				accountService.saveAccount(acc);
				acc.setPassword(null);
				Accountinfo accountInfo = Accountinfo.fromDTO(accountInfoDTO);
				accountInfo.setAccount(acc);
				accountInfoService.saveAccountInfo(accountInfo);
				session.removeAttribute("alert");
				session.setAttribute("loginAccount", accountInfo);
				session.setAttribute("cart", cartService.getCart(accountInfo.getId(), 0));
				session.setAttribute("numDetailcart",
						detailcartService.getNumDetailcart(cartService.getCart(accountInfo.getId(), 0)));
				return "redirect:/trang-chu";
			} else {
				session.setAttribute("alert", "Đã tồn tại tài khoản với tên đăng nhập này");
			}
		}
		return "redirect:/dang-ky";
	}

	@GetMapping(value = "them-vao-gio-hang-{id}")
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

	@GetMapping(value = "xoa-san-pham-{id}")
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
		session.removeAttribute("alert");
		session.setAttribute("cart", cart);
		return "redirect:/gio-hang";
	}

	@GetMapping(value = "giam-so-luong-san-pham-{id}")
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

	@GetMapping(value = "thong-tin-tai-khoan")
	public String AccountInfo(Model model, HttpSession session) {
		model.addAttribute("accountInfo", session.getAttribute("loginAccount"));
		model.addAttribute("product", new Product());
		model.addAttribute("listCategory", configService.getCategory());
		return "accountInfo";
	}

	@PostMapping("thong-tin-tai-khoan")
	public String ChangePass(@ModelAttribute("accountInfo") AccountinfoDTO accountInfo, BindingResult result,
			HttpSession session) {
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		Account account = loginAccount.getAccount();
		loginAccount.getConfig().setId(accountInfo.getConfig().getId());
		if(accountInfo.getName() != "") {
			if(containsSpecialInput(accountInfo.getName()) == true&& accountInfo.getName().length() >25 ) {
				session.setAttribute("messageAI", "Kiểm tra lại tên tài khoản bạn vừa nhập!");
				return "redirect:/thong-tin-tai-khoan";
			}
			loginAccount.setName(accountInfo.getName());
			session.removeAttribute("messageAI");
		}
		else {
			session.setAttribute("messageAI", "Tên tài khoản không được để trống!");
		}
		if(accountInfo.getEmail() != "") {
			if(isValidEmail(accountInfo.getEmail()) == true && accountInfo.getEmail().length()>50) {
				session.setAttribute("messageAI", "Kiểm tra lại email bạn vừa nhập!");
				return "redirect:/thong-tin-tai-khoan";
			}
			loginAccount.setEmail(accountInfo.getEmail());
			session.removeAttribute("messageAI");
		}
		if(accountInfo.getAddress() != "") {
			if(containsSpecialInput(accountInfo.getAddress()) == true &&accountInfo.getAddress().length()>50 ) {
				session.setAttribute("messageAI", "Kiểm tra lại địa chỉ bạn vừa nhập!");
				return "redirect:/thong-tin-tai-khoan";
			}
			loginAccount.setAddress(accountInfo.getAddress());
			session.removeAttribute("messageAI");
		}

		if(accountInfo.getPhone() != "") {
			if(isValidPhoneNumber(accountInfo.getPhone()) == false) {
				session.setAttribute("messageAI", "Kiểm tra lại số điện thoại bạn vừa nhập!");
				return "redirect:/thong-tin-tai-khoan";
			}
			loginAccount.setPhone(accountInfo.getPhone());
			session.removeAttribute("messageAI");
		}
		if (accountInfo.getBirth() == null) {
			loginAccount.setBirth(loginAccount.getBirth());
		} else {
			loginAccount.setBirth(accountInfo.getBirth());
		}
		if (accountInfo.getAccount().getPassword() == "") {
			Account acc = accountService.findByUserName(loginAccount.getAccount().getUsername());
			account.setPassword(acc.getPassword());
			session.removeAttribute("messageAI");
		}
		else {
			if(isStrongPassword(accountInfo.getAccount().getPassword())) {
		account.setPassword(BCrypt.hashpw(accountInfo.getAccount().getPassword(), BCrypt.gensalt()));
		}
			session.setAttribute("messageAI", "Kiểm tra lại mật khẩu bạn vừa nhập!");
			return "redirect:/thong-tin-tai-khoan";
		}
	
		accountService.saveAccount(account);
		accountInfoService.saveAccountInfo(loginAccount);
		session.setAttribute("loginAccount", loginAccount);
		session.removeAttribute("messageAI");
		return "redirect:/thong-tin-tai-khoan";
	}

	@GetMapping(value = "danh-sach-yeu-thich")
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

	@GetMapping(value = "them-vao-danh-sach-yeu-thich-{id}")
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

	@GetMapping(value = "xoa-khoi-danh-sach-yeu-thich-{id}")
	public String removeItemFromFav(@PathVariable("id") Integer idProduct, HttpSession session) {
		Product product = productService.getDetailProduct(idProduct);
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		Favourite favourite = favouriteService.findFavourite(loginAccount, product);
		favouriteService.deleteFavourite(favourite);
		String page = (String) session.getAttribute("page");
		return "redirect:/" + page;
	}

	@GetMapping(value = "quan-ly-don-hang")
	public ModelAndView OrderBill(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		Accountinfo loginAccount = (Accountinfo) session.getAttribute("loginAccount");
		mv.addObject("listBill", cartService.getListCart(loginAccount.getId(), 1));
		return mv;
	}

	@GetMapping(value = "huy-don-hang-{id}")
	public String cancelBill(@PathVariable("id") Integer idBillinfo) {
		Billinfo billinfo = billinfoService.getBillinfo(idBillinfo);
		billinfo.setConfigByStatus(configService.getIdConfig(22));
		billinfoService.saveBillinfo(billinfo);
		return "redirect:/quan-ly-don-hang";
	}

	@GetMapping(value = "chi-tiet-don-hang-{id}")
	public ModelAndView viewBillinfo(@PathVariable("id") Integer idBillinfo, HttpSession session) {
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
