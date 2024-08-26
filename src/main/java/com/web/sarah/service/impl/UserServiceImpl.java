package com.web.sarah.service.impl;

import com.web.sarah.entity.User;
import com.web.sarah.repository.UserRepository;
import com.web.sarah.service.UserService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	SessionFactory factory;
	
	private UserRepository userRepository;
	public UserServiceImpl(UserRepository userRepository) {
		super();
		this.userRepository=userRepository;
	}
	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	@Override
	public User saveUser(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}

	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}



	@Override
	public User getUserById(String id) {
		// TODO Auto-generated method stub
		return userRepository.findById(id);
	}

	@Override
	public void deleteUserById(String id) {
		User user = userRepository.findById(id);
		if (user != null) {
			userRepository.delete(user);
		}
	}
	@Override
	public User GetUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.findByEmail(email);
	}
	@Override
	public User findByIdAndRole(String id, String role) {
		return userRepository.findByIdAndRole(id, role);
	}
	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	public boolean existsById(String accountId) {
		return false;
	}


}
