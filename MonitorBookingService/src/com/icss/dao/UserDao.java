package com.icss.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao extends BaseDao{

	
	/**
	 * ���ݶ�����ţ���ȡ��λ��.
	 * @param orderno
	 * @return
	 * @throws Exception
	 */
	public String getBanciSeatno(String orderno) throws Exception{
		String seatno = null;
		String sql = "select seatno from ticket t where orderno=?";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, orderno);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			seatno = rs.getString("seatno");
			break;
		}
		
		return seatno;
	}
	
	
	/**
	 * ��Ʊ�ɹ���������λ��
	 * @param bno
	 * @param type
	 * @param orderno
	 * @return
	 * @throws Exception
	 */
	public String updateTicketState(int bno, String type, String orderno) throws Exception{	
		String seatNO = null;
		
		String sql = "update ticket set state='02',orderno='" + orderno + "' "
				+ " where stype='" + type + "' and bno=" + bno + " and"
						+ " (select count(*) count from ticket t where stype='" + type + "' and bno=" + bno + " and state='01')>0 and state='01' and rownum=1";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		
		int iRet = ps.executeUpdate();
		if(iRet >0 ){
			seatNO = getBanciSeatno(orderno);
		}
		
		return seatNO;
	}
}
