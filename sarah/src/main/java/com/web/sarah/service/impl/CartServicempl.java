package com.web.sarah.service.impl;

import com.web.sarah.entity.Cart;
import com.web.sarah.repository.CartRepository;
import com.web.sarah.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServicempl implements CartService{

	@Autowired
	CartRepository cartRepository;
	/**
	 *
	 */
	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		cartRepository.deleteById(id);
	}
	@Override
	public List<Cart> GetAllCartByUser_id(String user_id) {
		// TODO Auto-generated method stub
		return cartRepository.findAllByUser_id(user_id);
	}
	@Override
	public void saveCart(Cart cart) {
		// TODO Auto-generated method stub
		cartRepository.save(cart);
	}
}
