package com.icss.dto;


import java.util.Date;


public class BookImfo {
	private String tno; 					// 车次
	private int bno;						//班次
	private String orderno; 				// 订单号
	private String departure_name; 			// 始发站名字
	private String destination_name; 		// 终点站名字
	private String startTime;		 		// 发车时间
	private String longTime; 				// 历时
	private Date StartDate; 				// 发车日期
	private String type; 					// 车票种类
	private String seatno;					//座位号
	
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		if(type.equals("05")) {
			this.type = "软卧";
		}else if(type.equals("04")) {
			this.type = "硬卧";
		}else if(type.equals("03")) {
			this.type = "硬座";
		}else if(type.equals("02")) {
			this.type = "二等座";
		}else if(type.equals("01")) {
			this.type = "一等座";
		}else{
			this.type = "软卧";
		}
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getDeparture_name() {
		return departure_name;
	}
	public void setDeparture_name(String departure_name) {
		this.departure_name = departure_name;
	}
	public String getDestination_name() {
		return destination_name;
	}
	public void setDestination_name(String destination_name) {
		this.destination_name = destination_name;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getLongTime() {
		return longTime;
	}
	public void setLongTime(String longTime) {
		this.longTime = longTime;
	}
	public Date getStartDate() {
		return StartDate;
	}
	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}
}
