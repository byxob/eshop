package com.newcapect.eshop.entity;

import java.sql.Date;

public class Goods {

	private Integer gcode ;
	private String gname ;
	private Double gprice;
	private Date mdate ;
	private String gdesc ;
	private String gpic  ;
	public Integer getGcode() {
		return gcode;
	}
	public void setGcode(Integer gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Double getGprice() {
		return gprice;
	}
	public void setGprice(Double gprice) {
		this.gprice = gprice;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getGdesc() {
		return gdesc;
	}
	public void setGdesc(String gdesc) {
		this.gdesc = gdesc;
	}
	public String getGpic() {
		return gpic;
	}
	public void setGpic(String gpic) {
		this.gpic = gpic;
	}
	public Goods(String gname, Double gprice, Date mdate, String gdesc, String gpic) {
		super();
		this.gname = gname;
		this.gprice = gprice;
		this.mdate = mdate;
		this.gdesc = gdesc;
		this.gpic = gpic;
	}
	public Goods(String gname, Double gprice, String gdesc, String gpic) {
		super();
		this.gname = gname;
		this.gprice = gprice;
		this.gdesc = gdesc;
		this.gpic = gpic;
	}
	public Goods() {
		super();
	}
	
	
	
}
