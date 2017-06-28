package com.newcapect.eshop.test;

import com.newcapect.eshop.service.UserService;

public class UserServicetest {

	public static void main(String[] args) {
		int id = 1000;
		String old = "123123";
		String first = "123456";
		String second = "123456";
		
		UserService us = new UserService();
		
		int rs = us.changePassword(id,old,first,second);
		if(rs>0){
			System.out.println("ÃÜÂëĞŞ¸Ä³É¹¦");
		}

	}

}
