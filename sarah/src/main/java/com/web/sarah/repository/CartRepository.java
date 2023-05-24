package com.web.sarah.repository;
import com.web.sarah.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
public interface CartRepository extends JpaRepository<Cart,Integer>{
//	@Query(value="DELETE FROM `cart` e WHERE e.id= ?1",nativeQuery = true)
//	void deleteById(int id);
	List<Cart> findAllByUser_id(String user_id);
}
