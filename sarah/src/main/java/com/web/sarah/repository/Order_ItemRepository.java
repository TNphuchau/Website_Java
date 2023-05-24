package com.web.sarah.repository;
import com.web.sarah.entity.Order_Item;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface Order_ItemRepository extends JpaRepository<Order_Item,Integer>{

	List<Order_Item> findAllByOrder_id(int id);

	void deleteById(int id);
	
}
