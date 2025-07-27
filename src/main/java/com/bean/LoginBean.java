package com.bean;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public class LoginBean {
	
	private int id;
	@NotBlank(message="Required Field..")
	@Pattern(regexp="[a-zA-Z]+", message="Enter Valid last name..")
	private String name;
	
	private String email;
	
	@NotBlank(message="Required Field..")
	private String password;
	private String confirm;
	
	@NotBlank(message="Required Field..")
	private String role;
	
	

	public boolean isPasswordMatching() {
		return password != null && password.equals(confirm);
	}
	
	public int getId() {
	    return id;
	}
	public void setId(int id) {
	    this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}	
}
