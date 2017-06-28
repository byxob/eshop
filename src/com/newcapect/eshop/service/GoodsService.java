package com.newcapect.eshop.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.newcapect.eshop.entity.Goods;

public class GoodsService {

	public List<Goods> findGoodsByTitle(String title){
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		List<Goods> list = new  ArrayList<>();
		try {
			con = DbUtil.getConnection();
			String sql = "select gcode,gname,gprice,gdesc,gpic from t_goods "
					+ "where gname like ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, "%"+ title + "%");
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				Goods g = new Goods(rs.getString("gname")
						, rs.getDouble("gprice")
						, rs.getString("gdesc")
						, rs.getString("gpic"));
				g.setGcode(rs.getInt("gcode"));
				list.add(g);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

	public Goods findGoodsByCode(int gcode){
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbUtil.getConnection();
			String sql = "select * from t_goods where gcode=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, gcode);
			rs = stmt.executeQuery();
			
			Goods g = new Goods(rs.getString("gname")
					, rs.getDouble("gprice")
					, rs.getDate("mdate")
					, rs.getString("gdesc")
					, rs.getString("gpic"));
			g.setGcode(gcode);
			return g;
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
