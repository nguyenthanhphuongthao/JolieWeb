package com.g10.JolieWeb.Controller;

import java.io.IOException;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.g10.JolieWeb.DTO.AccountDTO;
import com.g10.JolieWeb.DTO.ProductDTO;
import com.g10.JolieWeb.Entity.Account;
import com.g10.JolieWeb.Entity.Billinfo;
import com.g10.JolieWeb.Entity.Media;
import com.g10.JolieWeb.Entity.Product;
import com.g10.JolieWeb.Entity.Config;
import com.g10.JolieWeb.Service.AccountServiceImpl;
import com.g10.JolieWeb.Service.BillinfoServiceImpl;
import com.g10.JolieWeb.Service.ConfigServiceImpl;
import com.g10.JolieWeb.Service.DetailcartServiceImpl;
import com.g10.JolieWeb.Service.FileUpload;
import com.g10.JolieWeb.Service.MediaServiceImpl;
import com.g10.JolieWeb.Service.ProductServiceImpl;

@Controller
public class AdminController {
	@Autowired
	private ConfigServiceImpl configService;
	@Autowired
	private MediaServiceImpl mediaService;
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private AccountServiceImpl accountService;
	@Autowired
	private BillinfoServiceImpl billinfoService;
	@Autowired
	private DetailcartServiceImpl detailcartService;
	private final FileUpload fileUpload;
	@Autowired
    public AdminController(FileUpload fileUpload) {
        this.fileUpload = fileUpload;
    }
	  public static boolean isInteger(String input) {
	        try {
	            Integer.parseInt(input);
	            return true;
	        } catch (NumberFormatException e) {
	            return false;
	        }
	    }
	public static boolean containsSpecialInput(String input) {
		Pattern specialCharPattern = Pattern.compile("[!\"#$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~]");
        Matcher specialCharMatcher = specialCharPattern.matcher(input);

        for (char c : input.toCharArray()) {
            if (Character.isLetter(c) && !Character.isLetterOrDigit(c)) {
                return true; 
            }
        }

        return specialCharMatcher.find();
    }
	public static boolean containsSpecialDecription(String input) {
		Pattern specialCharPattern = Pattern.compile("[#$%*/;-<=>@\\[\\]^_`{|}~]");
        Matcher specialCharMatcher = specialCharPattern.matcher(input);

        for (char c : input.toCharArray()) {
            if (Character.isLetter(c) && !Character.isLetterOrDigit(c)) {
                return true; 
            }
        }

        return specialCharMatcher.find();
    }
	@GetMapping(value = "admin")
	public String displayLogin(Model model, HttpSession session) {
		session.removeAttribute("isAdmin");
		model.addAttribute("account", new Account());
		return "loginAdmin";
	}

	@PostMapping("admin")
	public String login(Model model, @ModelAttribute("account") AccountDTO account,  HttpSession session) {
		session.removeAttribute("isAdmin");
		Account acc = accountService.findByUserName(account.getUsername());
		if (Objects.nonNull(acc) && acc.getConfigByRole().getId() == 1  && BCrypt.checkpw(account.getPassword(), acc.getPassword())) {
			session.removeAttribute("alert");
			session.setAttribute("isAdmin", true);
			return "redirect:/home-admin";
		} else {
			session.removeAttribute("isAdmin");
			session.setAttribute("alert", "Sai tên đăng nhập hoặc mật khẩu!");
			model.addAttribute("alert", session.getAttribute("alert"));
			return "redirect:/admin";
		}
	}
	
	@GetMapping(value = "home-admin")
	public ModelAndView home(HttpSession session, Model model, @RequestParam(defaultValue = "0") Integer pageNo,
			@RequestParam(defaultValue = "100") Integer pageSize, @RequestParam(defaultValue = "id") String sortBy) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("isAdmin") == null) {
			mv.setViewName("redirect:/admin");
			return mv;
		}
		session.setAttribute("page", "home-admin");
		mv.setViewName("homeAdmin");
		int numProduct = productService.numProduct();
		int maxPage = (numProduct / pageSize) - 1;
		mv.addObject("listProduct", productService.getProduct(pageNo, pageSize, sortBy));
		mv.addObject("pageNo", pageNo);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
	@GetMapping(value = "update-product")
	public ModelAndView displayUpdateProduct(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("isAdmin") == null) {
			mv.setViewName("redirect:/admin");
			return mv;
		}
		Product product = productService.getDetailProduct(id);
		mv.setViewName("updateproduct");
		mv.addObject("product", product);
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listBrand", configService.getBrand());
		return mv;
	}
	
	@PostMapping("update-product")
	public String saveUpdateProduct(@ModelAttribute("product") ProductDTO productDTO, @RequestParam("file") MultipartFile file, BindingResult result,
			HttpSession session) {
		
			Product product = Product.fromDTO(productDTO);
			
			if (file.isEmpty()) {
				product.setMedia(productService.getDetailProduct(product.getId()).getMedia());
			}
			else {
				Media media = new Media();
				String imageUrl = null;
				try {
					imageUrl = fileUpload.uploadFile(file);
				} catch (IOException e) {
					e.printStackTrace();
					return "redirect:/home-admin";
				}
				media.setFileName(imageUrl);
				mediaService.saveMedia(media);
				product.setMedia(media);
			}
			product.setConfigByBrand(configService.getIdConfig(productDTO.getConfigByBrand().getId()));
			product.setConfigByCategory(configService.getIdConfig(productDTO.getConfigByCategory().getId()));
			if(containsSpecialInput(productDTO.getName())==false && containsSpecialInput(productDTO.getOrigin())==false
					 ) {
			productService.saveProduct(product);
			return "redirect:/home-admin";
			}
			return "redirect:/home-admin";
		
	}
	@GetMapping(value = "insert-product")
	public ModelAndView displayInsertProduct(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("isAdmin") == null) {
			mv.setViewName("redirect:/admin");
			return mv;
		}
		mv.setViewName("createproduct");
		mv.addObject("product", new Product());
		mv.addObject("listCategory", configService.getCategory());
		mv.addObject("listBrand", configService.getBrand());
		return mv;
	}
	
	@PostMapping("insert-product")
	public String saveProduct(@ModelAttribute("product") ProductDTO productDTO, @RequestParam("file") MultipartFile file, BindingResult result,
			HttpSession session) {
		if(containsSpecialInput(productDTO.getName())==false && containsSpecialInput(productDTO.getOrigin())==false  ) { 
		Product product = Product.fromDTO(productDTO);
		Media media = new Media();
		String imageUrl = null;
		try {
			imageUrl = fileUpload.uploadFile(file);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/home-admin";
		}
		media.setFileName(imageUrl);
		mediaService.saveMedia(media);
		product.setMedia(media);
		product.setConfigByBrand(configService.getIdConfig(productDTO.getConfigByBrand().getId()));
		product.setConfigByCategory(configService.getIdConfig(productDTO.getConfigByCategory().getId()));
		productService.saveProduct(product);
		return "redirect:/home-admin";
		}
		return "redirect:/insert-product";
	}
	
	@PostMapping("insert-brand")
	public String saveBrand(@RequestParam("name") String name, HttpSession session) {
		if (containsSpecialInput(name) == false && configService.findConfig(name) == null && name.length() <= 30) {
			Config brand = new Config();
			brand.setGroupcode("BRAND");
			brand.setCode("Thương hiệu sản phẩm");
			brand.setName(name);
			configService.saveConfig(brand);
			return "redirect:/insert-product";
		}
		return "redirect:/insert-product";
	}
	@GetMapping(value = "manage-bill")
	public ModelAndView manageBill(HttpSession session) {
		session.setAttribute("page", "manage-bill");
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("isAdmin") == null) {
			mv.setViewName("redirect:/admin");
			return mv;
		}
		mv.setViewName("managebill");
		mv.addObject("listBill", billinfoService.getAllBillinfo());
		return mv;
	}
	
	@GetMapping(value = "detail-bill")
	public ModelAndView detailBill(@RequestParam("id") int id, HttpSession session) {
		Billinfo billinfo = billinfoService.getBillinfo(id);
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("isAdmin") == null) {
			mv.setViewName("redirect:/admin");
			return mv;
		}
		mv.setViewName("managebilldetail");
		mv.addObject("billinfo", billinfoService.getBillinfo(id));
		mv.addObject("cart", billinfo.getCart());
		mv.addObject("listProductBill", detailcartService.getDetailcarts(billinfo.getCart()));
		return mv;
	}
	
	@PostMapping(value = "update-new-bill")
	public String updateNewBill(@RequestParam("id") int id, HttpSession session) {
		Billinfo billinfo = billinfoService.getBillinfo(id);
		billinfo.setConfigByStatus(configService.getIdConfig(20));
		billinfoService.saveBillinfo(billinfo);
		return "redirect:/manage-bill";
	}
	
	@PostMapping(value = "update-processing-bill")
	public String updateProcessingBill(@RequestParam("id") int id, HttpSession session) {
		Billinfo billinfo = billinfoService.getBillinfo(id);
		billinfo.setConfigByStatus(configService.getIdConfig(21));
		billinfoService.saveBillinfo(billinfo);
		return "redirect:/manage-bill";
	}
	
	@PostMapping(value = "cancel-bill")
	public String cancelBill(@RequestParam("id") int id, HttpSession session) {
		Billinfo billinfo = billinfoService.getBillinfo(id);
		billinfo.setConfigByStatus(configService.getIdConfig(22));
		billinfoService.saveBillinfo(billinfo);
		return "redirect:/manage-bill";
	}
	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.removeAttribute("isAdmin");
		session.removeAttribute("alert");
		return "redirect:/admin";
	}
}
