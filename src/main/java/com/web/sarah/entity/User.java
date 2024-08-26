package com.web.sarah.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Data // lombok giúp generate các hàm constructor, get, set v.v.
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "user")
public class User {
	@Id()
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String id;

	@Column(name = "role", columnDefinition = "nvarchar(255)")
	private String role;
	
	@Column(name = "password",columnDefinition = "nvarchar(255)")
	private String password;
	
	@Column(name = "user_Name", columnDefinition = "nvarchar(255)")
	private String user_Name;

	@Column(name = "avatar", columnDefinition = "nvarchar(255)")
	private String avatar;
	
	@Column(name = "email", columnDefinition = "nvarchar(255)")
	private String email;
	
	@Column(name = "phone_Number", columnDefinition = "nvarchar(255)")
	private String phone_Number;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Order> order;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Cart> cart;
}
