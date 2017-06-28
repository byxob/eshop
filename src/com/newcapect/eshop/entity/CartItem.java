package com.newcapect.eshop.entity;

public class CartItem {
	
	private Goods goods;
	private int num;
	private double sum;
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getSum() {
		return sum;
	}
	public void setSum(double sum) {
		this.sum = sum;
	}
	public CartItem(Goods goods, int num, double sum) {
		super();
		this.goods = goods;
		this.num = num;
		this.sum = sum;
	}
	public CartItem() {
		super();
	}
}
