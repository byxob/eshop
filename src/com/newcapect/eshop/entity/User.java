package com.newcapect.eshop.entity;

public class User {
	private Integer id      ;
	private String email   ;
	private String password;
	private String addr1   ;
	private String addr2   ;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public User(String email, String password, String addr1, String addr2) {
		super();
		this.email = email;
		this.password = password;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}
	public User() {
		super();
	}
}
