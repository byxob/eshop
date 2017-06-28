package com.newcapect.eshop.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.newcapect.eshop.entity.Order;
import com.newcapect.eshop.entity.OrderItem;
import com.newcapect.eshop.service.OrderService;


public class OrderServiceTest {

	public static void main(String[] args) {
		Order order = new Order(1000,"李沛","刘宽","88888888888"
				,"郑州轻工业大学", Date.valueOf("2017-06-21"),7000.0);
		
		List<OrderItem> items = new ArrayList<OrderItem>();
		items.add(new OrderItem(100000,"iPhone 6 plus",4800,1));
		items.add(new OrderItem(1000, "dsd", 2800, 1));
		
		OrderService os = new OrderService();
		int rs  = os.placeOrder(order, items);
		
		if(rs == 3){
			System.out.println("订单已生成");
		}else{
			System.out.println("订单失败");
		}

	}

}
