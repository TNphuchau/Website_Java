package com.web.sarah.controller;

import com.web.sarah.entity.Cart;
import com.web.sarah.entity.Product;
import com.web.sarah.entity.User;
import com.web.sarah.service.CartService;
import com.web.sarah.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {

	@Autowired
	CartService cartService;

	@Autowired
	ProductService productService;

	@Autowired
	HttpSession session;

	@GetMapping("/cart")
	public String CartView(Model model) throws Exception {
		User user = (User) session.getAttribute("acc");
		if (user == null) {
			session.setAttribute("NoSignIn", "Vui lòng đăng nhập trước khi thực hiện thao tác");
			return "redirect:/home";
		} else {
			List<Cart> listCart = cartService.GetAllCartByUser_id(user.getId());
			int cartItemCount = 0;
			for (Cart cart : listCart) {
				cartItemCount += cart.getCount();
			}
			int Total = 0;
			for (Cart y : listCart) {
				Total = Total + y.getCount() * y.getProduct().getPrice();
			}
			if (listCart != null) {
				model.addAttribute("cartItemCount", cartItemCount);
				model.addAttribute("Total", Total);
				model.addAttribute("listCart", listCart);
				session.setAttribute("listCart", listCart);
				session.setAttribute("Total", Total);
			}
			return "shopping-cart";
		}
	}

	@GetMapping("/deleteCart/{id}")
	public String GetDeleteCart(@PathVariable int id, Model model, HttpServletRequest request) throws Exception {
		String referer = request.getHeader("Referer");
		User user = (User) session.getAttribute("acc");
		if (user == null) {
			return "redirect:" +referer;
		} else {
			System.out.println(id);
			cartService.deleteById(id);
			session.setAttribute("CartDelete", id);
			List<Cart> listCart = cartService.GetAllCartByUser_id(user.getId());
			session.setAttribute("countCart", listCart.size());
			return "redirect:/cart";
		}
	}

	@PostMapping("/updateCart")
	public String UpdateCart(HttpServletRequest request, Model model) throws Exception {
		@SuppressWarnings("unchecked")
		List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
		int i = 0;
		for (Cart o : listCart) {
			String a = request.getParameter("count" + i);
			int count = Integer.parseInt(a);
			System.out.println(count);
			o.setCount(count);
			i++;
		}
		for (Cart o : listCart) {
			cartService.saveCart(o);
		}
		return "redirect:/cart";
	}

	@GetMapping("/addToCart/{id}")
	public String AddToCart(@PathVariable int id, Model model, HttpServletRequest request) throws Exception {
		String referer = request.getHeader("Referer");
		User user = (User) session.getAttribute("acc");
		if (user == null) {
			session.setAttribute("AddToCartErr", "Vui lòng đăng nhập trước khi thực hiện thao tác");
			return "redirect:/signin"; // Thay "/login" bằng đường dẫn tới trang đăng nhập của bạn
		} else {
			List<Cart> listCart = cartService.GetAllCartByUser_id(user.getId());
			Product product = productService.getProductById(id);
			int cart = 0;
			for (Cart y : listCart) {
				if (y.getProduct().getId() == id) {
					cart++;
				}
			}
			if (cart > 0) {
				for (Cart y : listCart) {
					if (y.getProduct().getId() == id) {
						y.setCount(y.getCount() + 1);
						cartService.saveCart(y);
					}
				}
			} else {
				Cart newCart = new Cart();
				newCart.setCount(1);
				newCart.setProduct(product);
				newCart.setUser(user);
				cartService.saveCart(newCart);
			}
			listCart = cartService.GetAllCartByUser_id(user.getId());
			session.setAttribute("countCart", listCart.size());
			return "redirect:" + referer;
		}
	}

	@PostMapping("/addToCart")
	public String AddToCartPost(@ModelAttribute("product_id") int product_id, @ModelAttribute("count") String a,
								Model model, HttpServletRequest request, HttpSession session) throws Exception {
		int count = Integer.parseInt(a);
		String referer = request.getHeader("Referer");
		User user = (User) session.getAttribute("acc");
		if (user == null) {
			session.setAttribute("AddToCartErr", "Vui lòng đăng nhập trước khi thực hiện thao tác");
			return "redirect:/signin"; // Thay "/login" bằng đường dẫn tới trang đăng nhập của bạn
		} else {
			List<Cart> listCart = cartService.GetAllCartByUser_id(user.getId());
			Product product = productService.getProductById(product_id);
			int cart = 0;
			for (Cart y : listCart) {
				if (y.getProduct().getId() == product_id) {
					y.setCount(y.getCount() + count);
					cartService.saveCart(y);
					cart++;
				}
			}
			if (cart == 0) {
				Cart newCart = new Cart();
				newCart.setCount(count);
				newCart.setProduct(product);
				newCart.setUser(user);
				cartService.saveCart(newCart);
			}
			listCart = cartService.GetAllCartByUser_id(user.getId());
			session.setAttribute("countCart", listCart.size());
			return "redirect:" + referer;
		}
	}

}