package com.icss.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.icss.util.JsonDateSerializer;

/**
 * ��ѯ��Ʊ��ҵ�񳡾���
 * 
 * @author Administrator
 * 
 */
public class TicketDto {
	private String tno; 					// ����
	private int bno;						//���
	private String departure_name; 			// ����վ����
	private String destination_name; 		// ʼ��վ����
	private String startTime;		 		// ����ʱ��
	private String longTime; 				// ��ʱ
	private Date StartDate; 				// ��������
	private List<TicketTypeDto> ttdList; 	// ��ǰ���εĳ�Ʊ����

	public TicketDto() {
		ttdList = new ArrayList<TicketTypeDto>(20);
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
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

	public List<TicketTypeDto> getTtdList() {
		return ttdList;
	}

	public void setTtdList(TicketTypeDto ttd) {
		this.ttdList.add(ttd);
	}

	@JsonSerialize(using = JsonDateSerializer.class)
	public Date getStartDate() {
		return StartDate;
	}

	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}

	public void setTtdList(List<TicketTypeDto> ttdList) {
		this.ttdList = ttdList;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

}
