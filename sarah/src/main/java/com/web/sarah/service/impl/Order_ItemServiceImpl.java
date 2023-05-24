package com.web.sarah.service.impl;

import com.web.sarah.entity.Order_Item;
import com.web.sarah.repository.Order_ItemRepository;
import com.web.sarah.service.Order_ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Order_ItemServiceImpl implements Order_ItemService{

	@Autowired
	Order_ItemRepository order_ItemRepository;
	@Override
	public void saveOrder_Item(Order_Item order_Item) {
		// TODO Auto-generated method stub
		order_ItemRepository.save(order_Item);
	}
	@Override
	public List<Order_Item> getAllByOrder_Id(int id) {
		// TODO Auto-generated method stub
		return order_ItemRepository.findAllByOrder_id(id);
	}
	@Override
	public void deleteById(int id) {
		order_ItemRepository.deleteById(id);
	}
}
