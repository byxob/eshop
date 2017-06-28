package com.newcapect.eshop.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.newcapect.eshop.entity.Order;
import com.newcapect.eshop.entity.OrderItem;

public class OrderService {

	public int placeOrder(Order order,List<OrderItem> items){
		int ocode = 0;
		int rows = 0;
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = DbUtil.getConnection();
			
			/*
			 * 1,添加订单表信息
			 * 把默认行为--执行任何一条数据修改操作，都会开启一个事务，
			 * 数据修改操作结束，提交事务
			 * setAutoCommit方法能够关闭默认行为
			 */
			con.setAutoCommit(false);
			String sql = "insert into t_orders (ucode,uname,rname,rtel,raddr,odate,amount)" + " values (?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql
					,PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, order.getOcode());
			stmt.setString(2, order.getUname());
			stmt.setString(3, order.getRname());
			stmt.setString(4, order.getRtel());
			stmt.setString(5, order.getRaddr());
			stmt.setDate(6, order.getOdate());
			stmt.setDouble(7, order.getAmount());
			rows += stmt.executeUpdate();
			
			// 得到自动产生的订单编号
			ResultSet keys = stmt.getGeneratedKeys();
			keys.next();
			ocode = keys.getInt(1);
			
			for(OrderItem item : items){
				sql = "insert into t_oitems (ocode,gcode,gname,gprice,gcount) " + " values (?,?,?,?,?)";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, ocode);
				stmt.setInt(2, item.getGcode());
				stmt.setString(3, item.getGname());
				stmt.setDouble(4, item.getGprice());
				stmt.setInt(5, item.getGcount());
				rows += stmt.executeUpdate();
			}
			con.commit();
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rows;
	}
}
