package com.newcapect.eshop.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.newcapect.eshop.entity.User;

public class UserService {

	public int changePassword(int id,String old
			,String first,String second){
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbUtil.getConnection();
			String sql = "select password from t_users where id=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			rs.next();
			String oldpwd = rs.getString("password");
			stmt.close();
			if(!oldpwd.equals(old)){
				System.out.println("原密码错误");
				return 0;
			}
			
			if(!first.equals(second)){
				System.out.println("两次密码不一致");
				return 0;
			}
			
			sql = "update t_users set password = ? where id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, first);
			stmt.setInt(2, id);
			
			int rows = stmt.executeUpdate();
			return rows;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return 0;
	}
	
	
	public User login(String userid,String password){
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbUtil.getConnection();
			String sql = "select * from t_users where email=? and password=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userid);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			if(rs.next()){
				User u = new User(rs.getString("email")
						,rs.getString("password")
						,rs.getString("addr1")
						,rs.getString("addr2"));
				u.setId(rs.getInt("id"));
				return u;
			}
			
			int rows = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	
}
