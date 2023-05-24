package com.web.sarah.service;
import com.web.sarah.entity.Cart;
import java.util.List;

public interface CartService {
	
	void deleteById(int id);
	
	List<Cart> GetAllCartByUser_id(String user_id);
	
	void saveCart(Cart cart);
	
}
