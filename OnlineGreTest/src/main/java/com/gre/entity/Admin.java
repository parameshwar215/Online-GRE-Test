package com.gre.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Admin {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int adminId;
	private String adminName;
	private String email;
	private String password;
	private long phoneNo;
	private String country;
	private String state;
	private String city;
	private String address;
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(int adminId, String adminName, String email, String password, String country, String state,
			long phoneNo, String city, String address) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.email = email;
		this.password = password;
		this.country = country;
		this.state = state;
		this.phoneNo = phoneNo;
		this.city = city;
		this.address = address;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public long getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(long phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
