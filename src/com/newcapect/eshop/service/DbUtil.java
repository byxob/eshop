package com.newcapect.eshop.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
	
	private static String user = "root";
	private static String password = "123456";
	private static String url = "jdbc:mysql://localhost:3306/eshop";
	
	public static Connection getConnection(){
		/*
		 * 1,��������������ΪӦ�õ��У����ܴ��ڶ��
		 * ���ݿ��Ʒ���������򣨶��jar�ļ���
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		/*
		 * 2���������ݿ����ӡ�ʹ��DriverManager������
		 * ��getConnection�����õ����ݿ����Ӷ���
		 */
		Connection con = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			return con;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void setUser(String username){
		user = username;
	}
	
	public static void setPassword (String passwd){
		password = passwd;
	}
	
	public static void setUrl(String addr){
		url = addr;
	}

}
