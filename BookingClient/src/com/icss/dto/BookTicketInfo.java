package com.icss.dto;

/**
 * 订票信息
 * @author Administrator
 *
 */
public class BookTicketInfo {

	private String orderno; 			// 订单号
	private String uname; 				// 用户名
	private int bno; 					// 车次
	private String type;				// 车票类型

	


	
	


	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
