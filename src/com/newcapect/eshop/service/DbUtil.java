package com.newcapect.eshop.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
	
	private static String user = "root";
	private static String password = "123456";
	private static String url = "jdbc:mysql://localhost:3306/eshop";
	
	public static Connection getConnection(){
		/*
		 * 1,加载驱动程序，因为应用当中，可能存在多个
		 * 数据库产品的驱动程序（多个jar文件）
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		/*
		 * 2，建立数据库连接。使用DriverManager工具类
		 * 的getConnection函数得到数据库连接对象
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
