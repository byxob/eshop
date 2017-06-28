package com.newcapect.eshop.entity;

import java.sql.Date;

public class Order {
	private int ocode 		;
	private int ucode 		;
	private String uname 	;
	private String rname 	;
	private String rtel 	;
	private String raddr 	;
	private Date odate 		;
	private double amount 	;
	
	public int getOcode(){
		return this.ocode;
	}
	public void setOcode(int ocode){
		this.ocode = ocode;
	}
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRtel() {
		return rtel;
	}
	public void setRtel(String rtel) {
		this.rtel = rtel;
	}
	public String getRaddr() {
		return raddr;
	}
	public void setRaddr(String raddr) {
		this.raddr = raddr;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Order(int ucode, String uname, String rname, String rtel, String raddr, Date odate, double amount) {
		super();
		this.ucode = ucode;
		this.uname = uname;
		this.rname = rname;
		this.rtel = rtel;
		this.raddr = raddr;
		this.odate = odate;
		this.amount = amount;
	}
	public Order() {
		super();
	}
	
	
}
