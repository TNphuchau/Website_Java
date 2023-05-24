package com.web.sarah.controller;

import com.web.sarah.entity.*;
import com.web.sarah.entity.Mail;
import com.web.sarah.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Controller
public class AdminController {
	@Autowired
	OrderService orderService;

	@Autowired
	UserService userService;

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	Order_ItemService order_ItemService;

	@Autowired
	CloudinaryService cloudinaryService;

	@Autowired
	MailService mailService;

	@Autowired
	HttpSession session;

	@Autowired
	ProductImageService productImageService;

	@GetMapping("loginAdmin")
	public String SignInAdminView(Model model) {
		String err_sign_admin = (String) session.getAttribute("err_sign_admin");
		model.addAttribute("err_sign_admin", err_sign_admin);
		session.setAttribute("err_sign_admin", null);
		return "loginAdmin";
	}

	@PostMapping("loginAdmin")
	public String SignInAdminHandel(@ModelAttribute("login-name") String login_name,
			@ModelAttribute("pass") String pass, Model model) throws Exception {
		User admin = userService.findByIdAndRole(login_name, "admin");
		if (admin == null) {
			session.setAttribute("err_sign_admin", "UserName or Password is not correct!");
			return "redirect:/loginAdmin";
		} else {
			String decodedValue = new String(Base64.getDecoder().decode(admin.getPassword()));
			if (!decodedValue.equals(pass)) {
				session.setAttribute("err_sign_admin", "UserName or Password is not correct!");
				return "redirect:/loginAdmin";
			} else {
				session.setAttribute("admin", admin);
				return "redirect:/homeAdmin";
			}
		}

	}

	@GetMapping("logout")
	public String LogOutAdmin(Model model) {
		session.setAttribute("admin", null);
		return "redirect:/loginAdmin";
	}

	@GetMapping("homeAdmin")
	public String HomeView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			List<Order> listOrder = orderService.findAll();
			List<Product> listProduct = productService.getAllProduct();
			List<User> listUser = userService.findAll();
			List<Category> listCategory = categoryService.findAll();

			List<Order> recentOrders = orderService.findTop5RecentOrder();
			List<String> recentUser = orderService.findTop5RecentCustomer();
			List<User> recentCustomer = new ArrayList<>();
			for (String y : recentUser) {
				recentCustomer.add(userService.findByIdAndRole(y, "user"));
			}
			model.addAttribute("Total_Order", listOrder.size());
			model.addAttribute("Total_Product", listProduct.size());
			model.addAttribute("Total_User", listUser.size());
			model.addAttribute("Total_Category", listCategory.size());
			model.addAttribute("recentOrders", recentOrders);
			model.addAttribute("recentCustomer", recentCustomer);
			return "homeAdmin";
		}
	}
	@GetMapping("/listAccount")
	public String ListAccountView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			List<User> users = userService.getAllUser();
			model.addAttribute("users", users);
			return "listAccount";
		}
	}

@GetMapping("/editAccount/{id}")
public String editAccountView(@PathVariable("id") String id, Model model) {
	User admin = (User) session.getAttribute("admin");
	if (admin == null) {
		return "redirect:/loginAdmin";
	} else {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "editAccount";
	}
}

	@PostMapping("/editAccount")
	public String editAccount(@ModelAttribute User user, Model model) {
		// Thực hiện chỉnh sửa thông tin tài khoản
		User updatedUser = userService.updateUser(user);

		// Cập nhật lại danh sách tài khoản
		List<User> userList = userService.findAll();
		model.addAttribute("users", userList);

		// Chuyển hướng về trang danh sách tài khoản
		return "redirect:/listAccount";
	}

	@GetMapping("/listCategory")
	public String ListCategoryView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			List<Category> listCategories = categoryService.findAll();
			model.addAttribute("listCategories", listCategories);
			return "listCategory";
		}
	}
	@GetMapping("/listAccount/delete/{id}")
	public String deleteAccount(@PathVariable String id) {
		userService.deleteUserById(id);
		return "redirect:/listAccount";
	}

	@DeleteMapping("/api/listAccount/delete/{id}")
	public ResponseEntity<Object> deleteAccountById(@PathVariable String id) {
		userService.deleteUserById(id);
		return ResponseEntity.ok().build();
	}

	@GetMapping("/addCategory")
	public String AddCategoryView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			String addCategory = (String) session.getAttribute("addCategory");
			model.addAttribute("addCategory", addCategory);
			session.setAttribute("addCategory", null);
			return "addCategory";
		}
	}
	@PostMapping("/addCategory")
	public String AddCategoryHandle(Model model, @ModelAttribute("category_name") String category_name) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			Category newCategory = new Category();
			newCategory.setCategory_Name(category_name);
			categoryService.saveCategory(newCategory);
			session.setAttribute("addCategory", "addCategorySuccess");
			return "redirect:/addCategory";
		}
	}
//	@GetMapping("/editCategory/{categoryId}")
//	public String editCategoryView(Model model, @PathVariable int categoryId) {
//		User admin = (User) session.getAttribute("admin");
//		if (admin == null) {
//			return "redirect:/loginAdmin";
//		} else {
//			Category category = categoryService.getCategoryById(categoryId);
//			if (category == null) {
//				// Xử lý trường hợp không tìm thấy danh mục
//				return "redirect:/listCategory";
//			}
//			model.addAttribute("category", category);
//			return "editCategory";
//		}
//	}
//
//	@PostMapping("/editCategory")
//	public String editCategoryHandle(Model model, @ModelAttribute("category") Category updatedCategory) {
//		User admin = (User) session.getAttribute("admin");
//		if (admin == null) {
//			return "redirect:/loginAdmin";
//		} else {
//			Category existingCategory = categoryService.getCategoryById(updatedCategory.getId());
//			if (existingCategory == null) {
//				return "redirect:/listCategory";
//			}
//			existingCategory.setCategory_Name(updatedCategory.getCategory_Name());
//			categoryService.updateCategory(existingCategory);
//			return "redirect:/listCategory";
//		}
//	}
	@PostMapping("/deleteCategory/{categoryId}")
	public String deleteCategory(@PathVariable int categoryId) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		}
		Category category = categoryService.getCategoryById(categoryId);
		if (category == null) {
			return "redirect:/listCategory";
		}
		categoryService.deleteCategoryId(categoryId);
		return "redirect:/listCategory";
	}
	@GetMapping("listProduct")
	public String ListProductView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			List<Category> listCategories = categoryService.findAll();
			Pageable pageable = PageRequest.of(0, 3);
			Page<Product> pageProduct = productService.findAll(pageable);
			model.addAttribute("pageProduct", pageProduct);
			model.addAttribute("listCategories", listCategories);
			return "listProduct";
		}
	}
	@GetMapping("addProduct")
	public String DashboardAddProductView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			String addProduct = (String) session.getAttribute("addProduct");
			model.addAttribute("addProduct", addProduct);
			session.setAttribute("addProduct", null);
			List<Category> listCategories = categoryService.findAll();
			model.addAttribute("listCategories", listCategories);
			return "addProduct";
		}
	}

	@PostMapping("addProduct")
	public String DashboardAddProductHandel(Model model, @ModelAttribute("product_name") String product_name,
											@ModelAttribute("price") String price, @ModelAttribute("availability") String availability,
											@ModelAttribute("category") int category, @ModelAttribute("description") String description,
											@ModelAttribute("listImage") MultipartFile[] listImage) throws Exception {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			if (listImage != null) {
				Category cate = categoryService.getCategoryById(category);
				System.out.println(cate);
				long millis = System.currentTimeMillis();
				Date create_at = new java.sql.Date(millis);
				Product newPro = new Product();
				newPro.setCreated_At(create_at);
				newPro.setDescription(description);
				newPro.setIs_Active(1);
				newPro.setIs_Selling(1);
				newPro.setPrice(Integer.parseInt(price));
				newPro.setProduct_Name(product_name);
				newPro.setQuantity(Integer.parseInt(availability));
				newPro.setSold(0);
				newPro.setCategory(cate);
				productService.saveProduct(newPro);
				List<Product> listProducts = productService.getAllProduct();
				newPro = listProducts.get(listProducts.size() - 1);
				for (MultipartFile y : listImage) {
					String urlImg = cloudinaryService.uploadFile(y);
					ProductImage img = new ProductImage();
					img.setProduct(newPro);
					img.setUrl_Image(urlImg);
					productImageService.save(img);
				}
				session.setAttribute("addProduct", "addProductSuccess");
				return "redirect:/addProduct";
			} else {
				return "redirect:/addProduct";
			}

		}
	}

	@GetMapping("/listProduct/edit/{id}")
	public String DashboardMyProductEditView(@PathVariable int id, Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			List<Category> listCategories = categoryService.findAll();
			Product product = productService.getProductById(id);
			model.addAttribute("product", product);
			model.addAttribute("listCategories", listCategories);
			String editProduct = (String) session.getAttribute("editProduct");
			model.addAttribute("editProduct", editProduct);
			session.setAttribute("editProduct", null);
			return "editProduct";
		}
	}

	@PostMapping("/listProduct/edit")
	public String DashboardMyProductEditHandel(Model model, @ModelAttribute("product_id") int product_id,
											   @ModelAttribute("product_name") String product_name, @ModelAttribute("price") String price,
											   @ModelAttribute("availability") String availability, @ModelAttribute("category") int category,
											   @ModelAttribute("description") String description, @ModelAttribute("listImage") MultipartFile[] listImage)
			throws Exception {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			if (listImage != null) {
				Category cate = categoryService.getCategoryById(category);
				Product product = productService.getProductById(product_id);
//				System.out.println(cate);
//				long millis = System.currentTimeMillis();
//				Date create_at = new java.sql.Date(millis);
//				Product newPro = new Product();
				product.setProduct_Name(product_name);
				product.setPrice(Integer.parseInt(price));
				product.setQuantity(Integer.parseInt(availability));
				product.setCategory(cate);
				product.setDescription(description);
				productService.saveProduct(product);
				for (MultipartFile y : listImage) {
					if (!y.isEmpty()) {
						String urlImg = cloudinaryService.uploadFile(y);
						ProductImage img = new ProductImage();
						img.setProduct(product);
						img.setUrl_Image(urlImg);
						productImageService.save(img);
					}
				}
				session.setAttribute("editProduct", "editProductSuccess");
				return "redirect:/listProduct/edit/" + product_id;
			} else {
				return "redirect:/listProduct/edit/" + product_id;
			}

		}
	}
	@GetMapping("/listProduct/delete/{id}")
	public String deleteProduct(@PathVariable int id) {
		Product product = productService.getProductById(id);
		if (product == null) {
			return "redirect:/listProduct";
		}
		productService.deleteProductById(id);
		return "redirect:/listProduct";
	}
	@DeleteMapping("/listProduct/delete/{id}")
	public ResponseEntity<Object> deleteProductById(@PathVariable int id) {
		Product product = productService.getProductById(id);
		if (product == null) {
			return ResponseEntity.notFound().build();
		}
		productService.deleteProductById(id);
		return ResponseEntity.ok().build();
	}
	@GetMapping("/listProduct/delete-image/{id}")
	public String DeleteImage(@PathVariable int id, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		productImageService.deleteById(id);
		return "redirect:"+referer;
	}

	@GetMapping("listProduct/{page}")
	public String DashboardMyProductPageView(@PathVariable int page, Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			List<Category> listCategories = categoryService.findAll();
			Pageable pageable = PageRequest.of(page, 3);
			Page<Product> pageProduct = productService.findAll(pageable);
			model.addAttribute("pageProduct", pageProduct);
			model.addAttribute("listCategories", listCategories);
			return "listProduct";
		}
	}

	@PostMapping("/listProduct/search")
	public String DashboardMyproductSearch(@ModelAttribute("search-input") String search_input,
										   @ModelAttribute("category-selected") int category_selected, Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			Page<Product> pageProduct = null;
			Pageable pageable = PageRequest.of(0, 3);
			if (category_selected > 0) {
				pageProduct = productService.findByProduct_NameAndCategory_idContaining(search_input, category_selected,
						pageable);
			} else {
				pageProduct = productService.findByProduct_NameContaining(search_input, pageable);
			}
			List<Category> listCategories = categoryService.findAll();
			String nameCategory = null;
			if (category_selected == 0) {
				nameCategory = null;
			} else {
				for (Category y : listCategories) {
					if (y.getId() == category_selected) {
						nameCategory = y.getCategory_Name();
					}
				}
			}
			System.out.println(nameCategory);
			model.addAttribute("pageProduct", pageProduct);
			model.addAttribute("listCategories", listCategories);
			model.addAttribute("search_dashboard", "search_dashboard");
			model.addAttribute("search_input", search_input);
			model.addAttribute("nameCategory", nameCategory);
			session.setAttribute("search_input_dashboard", search_input);
			session.setAttribute("category_selected", category_selected);
			return "listProduct";
		}
	}

	@GetMapping("/listProduct/search/{page}")
	public String DashboardMyproductSearchPage(@PathVariable int page, Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			String search_input = (String) session.getAttribute("search_input_dashboard");
			int category_selected = (int) session.getAttribute("category_selected");
//			int category_selected = 0;
			Page<Product> pageProduct = null;
			Pageable pageable = PageRequest.of(page, 3);
			if (category_selected > 0) {
				pageProduct = productService.findByProduct_NameAndCategory_idContaining(search_input, category_selected,
						pageable);
			} else {
				pageProduct = productService.findByProduct_NameContaining(search_input, pageable);
			}
			List<Category> listCategories = categoryService.findAll();
			model.addAttribute("pageProduct", pageProduct);
			model.addAttribute("listCategories", listCategories);
			model.addAttribute("search_dashboard", "search_dashboard");
			model.addAttribute("search_input", search_input);
			model.addAttribute("category_selected", category_selected);
			session.setAttribute("search_input_dashboard", search_input);
			return "listProduct";
		}
	}

	@GetMapping("dashboard-myprofile")
	public String DashboardMyProfile(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			String error_change_pass = (String) session.getAttribute("error_change_pass");
			String ChangePassSuccess = (String) session.getAttribute("ChangePassSuccess");
			String messageChangeProfile = (String) session.getAttribute("messageChangeProfile");
			model.addAttribute("messageChangeProfile", messageChangeProfile);
			model.addAttribute("error_change_pass", error_change_pass);
			model.addAttribute("ChangePassSuccess", ChangePassSuccess);
			session.setAttribute("error_change_pass", null);
			session.setAttribute("ChangePassSuccess", null);
			session.setAttribute("messageChangeProfile", null);
			model.addAttribute("admin", admin);
			return "dashboard-my-profile";
		}
	}

	@PostMapping("/dashboard-myprofile/changepassword")
	public String DashboardChangePassword(Model model, @ModelAttribute("current_password") String current_password,
										  @ModelAttribute("new_password") String new_password,
										  @ModelAttribute("confirm_password") String confirm_password, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			String decodedValue = new String(Base64.getDecoder().decode(admin.getPassword()));
			if (!decodedValue.equals(current_password)) {
				session.setAttribute("error_change_pass", "Current Password not correct!");
				return "redirect:/dashboard-myprofile";
			} else {

				if (!new_password.equals(confirm_password)) {
					session.setAttribute("error_change_pass", "Confirm New Password not valid!");
					return "redirect:/dashboard-myprofile";
				} else {
					String encodedValue = Base64.getEncoder().encodeToString(new_password.getBytes());
					admin.setPassword(encodedValue);
					userService.saveUser(admin);
					session.setAttribute("admin", admin);
				}
			}
			session.setAttribute("ChangePassSuccess", "ChangePassSuccess");
			return "redirect:" + referer;
		}
	}

	@PostMapping("/dashboard-myprofile/changeProfile")
	public String ChangeProfile(Model model, @ModelAttribute("avatar") MultipartFile avatar,
								@ModelAttribute("fullname") String fullname, @ModelAttribute("phone") String phone,
								@ModelAttribute("email") String email) throws IOException {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			if (!avatar.isEmpty()) {
				String url = cloudinaryService.uploadFile(avatar);
				admin.setAvatar(url);
			}
			admin.setUser_Name(fullname);
			admin.setEmail(email);
			admin.setPhone_Number(phone);
			userService.saveUser(admin);
			session.setAttribute("admin", admin);
			session.setAttribute("messageChangeProfile", "Change Success.");
			return "redirect:/dashboard-myprofile";
		}
	}

	@GetMapping("/orderAdmin")
	public String DashboardOrderView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			Pageable pageable = PageRequest.of(0, 3);
			Page<Order> pageOrder = orderService.findAll(pageable);
			model.addAttribute("pageOrder", pageOrder);
			return "orderAdmin";
		}
	}

	@GetMapping("/orderAdmin/{page}")
	public String DashboardOrderPageView(@PathVariable int page, Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			Pageable pageable = PageRequest.of(page, 3);
			Page<Order> pageOrder = orderService.findAll(pageable);
			model.addAttribute("pageOrder", pageOrder);
			return "orderAdmin";
		}
	}

	@PostMapping("/send-message")
	public String SendMessage(Model model, @ModelAttribute("message") String message,
							  @ModelAttribute("email") String email, HttpServletRequest request) throws Exception {
		String referer = request.getHeader("Referer");
		System.out.println(message);
		System.out.println(email);
		Mail mail = new Mail();
		mail.setMailFrom("tn0909ph@gmail.com");
		mail.setMailTo(email);
		mail.setMailSubject("Lời chào từ Sarah đến khách hàng.");
		mail.setMailContent(message);
		mailService.sendEmail(mail);
		return "redirect:" + referer;
	}

	@GetMapping("/delete-order/{id}")
	public String DeleteOrder(@PathVariable int id, Model model, HttpServletRequest request) throws Exception {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			String referer = request.getHeader("Referer");
			Order order = orderService.findById(id);
			System.out.println(order);
			if (order != null) {
				for (Order_Item y : order.getOrder_Item()) {
					order_ItemService.deleteById(y.getId());
				}
				orderService.deleteById(id);
			}
			return "redirect:" + referer;
		}
	}

	@GetMapping("doanhThu")
	public String DashboardWalletView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/loginAdmin";
		} else {
			List<Order> listOrder = orderService.findAll();
			List<Order> listPaymentWithMomo = orderService.findAllByPayment_Method("Payment with momo");
			List<Order> listPaymentOnDelivery = orderService.findAllByPayment_Method("Payment on delivery");
			int TotalMomo = 0;
			int TotalDelivery = 0;
			for (Order y : listPaymentWithMomo) {
				TotalMomo = TotalMomo + y.getTotal();
			}
			for (Order y : listPaymentOnDelivery) {
				TotalDelivery = TotalDelivery + y.getTotal();
			}
			List<Order> listRecentMomo = orderService.findTop5OrderByPaymentMethod("Payment with momo");
			List<Order> listRecentDelivery = orderService.findTop5OrderByPaymentMethod("Payment on delivery");

			model.addAttribute("TotalMomo", TotalMomo);
			model.addAttribute("TotalDelivery", TotalDelivery);
			model.addAttribute("TotalOrder", listOrder.size());
			model.addAttribute("listRecentDelivery", listRecentDelivery);
			model.addAttribute("listRecentMomo", listRecentMomo);
			return "doanhThu";
		}
	}

}
