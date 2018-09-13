package com.icss.dto;


import java.util.Date;


public class BookImfo {
	private String tno; 					// ����
	private int bno;						//���
	private String orderno; 				// ������
	private String departure_name; 			// ʼ��վ����
	private String destination_name; 		// �յ�վ����
	private String startTime;		 		// ����ʱ��
	private String longTime; 				// ��ʱ
	private Date StartDate; 				// ��������
	private String type; 					// ��Ʊ����
	private String seatno;					//��λ��
	
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
			this.type = "����";
		}else if(type.equals("04")) {
			this.type = "Ӳ��";
		}else if(type.equals("03")) {
			this.type = "Ӳ��";
		}else if(type.equals("02")) {
			this.type = "������";
		}else if(type.equals("01")) {
			this.type = "һ����";
		}else{
			this.type = "����";
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
