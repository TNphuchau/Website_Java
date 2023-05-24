package com.web.sarah.repository;
import com.web.sarah.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	User findByEmail(String email);
	User findById(String id);
	
//	@Query(value="select * from user u where u.id = ?1 and u.role = ?2",nativeQuery = true)
	User findByIdAndRole(String id, String role);
	void delete(User user);
	void deleteById(String id);
}
