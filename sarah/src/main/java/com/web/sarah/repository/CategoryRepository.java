package com.web.sarah.repository;
import com.web.sarah.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category,Long> {
	
	Category getById(int id);

}
