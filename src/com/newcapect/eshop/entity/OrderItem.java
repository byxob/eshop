package com.newcapect.eshop.entity;

public class OrderItem {

	private int icode = 0;
	private int gcode = 100000;
	private String gname = "ÍÁºÀ½ðÉö6plus";
	private double gprice = 6768.0;
	private int gcount = 1;
	public int getIcode() {
		return icode;
	}
	public void setIcode(int icode) {
		this.icode = icode;
	}
	public int getGcode() {
		return gcode;
	}
	public void setGcode(int gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public double getGprice() {
		return gprice;
	}
	public void setGprice(double gprice) {
		this.gprice = gprice;
	}
	public int getGcount() {
		return gcount;
	}
	public void setGcount(int gcount) {
		this.gcount = gcount;
	}
	public OrderItem(int gcode, String gname, double gprice, int gcount) {
		super();
		this.gcode = gcode;
		this.gname = gname;
		this.gprice = gprice;
		this.gcount = gcount;
	}
	public OrderItem() {
		super();
	}
	
	
}
