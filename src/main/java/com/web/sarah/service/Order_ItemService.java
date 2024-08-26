package com.web.sarah.service;

import com.web.sarah.entity.Order_Item;

import java.util.List;

public interface Order_ItemService {

	List<Order_Item> getAllByOrder_Id(int id);
	public void saveOrder_Item(Order_Item order_Item);
	void deleteById(int id);
}
