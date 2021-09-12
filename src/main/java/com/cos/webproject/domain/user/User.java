package com.cos.webproject.domain.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;


@Data
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(unique = true, length = 20)
	private String username;
	private String firstname;
	private String lastname;
	private String enfirstname;
	private String enlastname;
	private String password;
	private int birthday;
	private String gender;
	private String email;
	private String nationality;
	private String phonenumber;
}
