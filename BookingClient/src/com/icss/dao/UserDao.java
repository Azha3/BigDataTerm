package com.icss.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.icss.dto.BookImfo;
import com.icss.dto.TicketDto;
import com.icss.dto.TicketTypeDto;
import com.icss.entity.Area;
import com.icss.entity.User;
import com.icss.exception.InitDataException;

public class UserDao extends BaseDao {
	/**
	 * 获得指定班次下的各类车票数量.
	 * @param bno 班次编号
	 * @return
	 * @throws Exception
	 */
	public List<TicketTypeDto> getTicketTypeCountByBno(int bno) throws Exception{
		List<TicketTypeDto> ttdList = null;
		
		String sql = "select tbanci.bno bno,ticket.stype stype,ticket.price price,count(1) tcount from tarea t, tbanci,ticket,train "
				+ " where tbanci.bno = ticket.bno and t.ano = train.departure "
				+ " and train.tno = tbanci.tno and tbanci.bno=? and"
				+ " ticket.state='01' group by ticket.stype, ticket.price, tbanci.bno"
				+ "  order by tbanci.bno, ticket.stype";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, bno);
		ResultSet rs = ps.executeQuery();
		ttdList = new ArrayList<TicketTypeDto>(5);
		while(rs.next()){
			TicketTypeDto ttd = new TicketTypeDto();
			ttd.setBno(rs.getInt("bno"));
			ttd.setCount(rs.getInt("tcount"));
			ttd.setType(rs.getString("stype"));
			ttd.setPrice(rs.getInt("price"));
			ttdList.add(ttd);
		}
	
		return ttdList;
	}
	
	/**
	 * 获得指定班次下的列车信息.
	 *   如果班次查询不到列车信息,则认为班次编号不存在,应该主动抛出初始化错误的异常.
	 * @param bno 班次编号
	 * @return
	 * @throws Exception
	 */
	public TicketDto getTicketDto01ByBno(int bno) throws InitDataException, Exception{
		TicketDto td01 = null;
		
		String sql = "select t.tno tno,t.tstart tstart,t.tend tend,to_char(t.starttime,'HH24:mi') starttime,"
				+ " t.longtime longtime,tbanci.bno bno,tbanci.startdate startdate"
				+ " from train t,tbanci "
				+ " where t.tno = tbanci.tno and tbanci.bno=?";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, bno);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			td01 = new TicketDto();
			td01.setTno(rs.getString("tno"));
			td01.setBno(rs.getInt("bno"));
			td01.setDeparture_name(rs.getString("tstart"));
			td01.setDestination_name(rs.getString("tend"));
			td01.setStartTime(rs.getString("starttime"));
			td01.setLongTime(rs.getString("longtime"));
			td01.setStartDate(rs.getDate("startdate"));
			break;
		}
		
		if(td01 == null){
			throw new InitDataException("初始化数据失败");
		}
		
		return td01;
	}
	
	
	/**
	 * 根据车次编号获取列车的其他信息.
	 * @param bno 车次编号
	 * @return
	 * @throws Exception
	 */
	public TicketDto getTicketDtoByBno(int bno) throws Exception{
		TicketDto td = null;
		
		String sql = "select tbanci.bno bno,train.tno tno,train.tstart tstart,train.tend tend, to_char(train.starttime,'HH24:mi') starttime,train.longtime longtime,tbanci.startdate startdate"
				+ " from tbanci,ticket,train "
				+ " where tbanci.bno = ticket.bno and train.tno = tbanci.tno and tbanci.bno=?";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, bno);
//		ps.setDate(2, new java.sql.Date(new Date().getTime()));
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			td = new TicketDto();
			td.setTno(rs.getString("tno"));
			td.setBno(rs.getInt("bno"));
			td.setDeparture_name(rs.getString("tstart"));
			td.setDestination_name(rs.getString("tend"));
			td.setStartTime(rs.getString("starttime"));
			td.setLongTime(rs.getString("longtime"));
			td.setStartDate(rs.getDate("startdate"));
			break;
		}
		
		
		return td;
	}
	
	
	/**
	 * 获取所有满足条件班次不同车票类型的数量.
	 * 1 . 查询所有满足条件的火车的班次、车票类型.
	 * 2 . 根据车票类型和班次  查询车票的具体数量 ,如果为0,则存入0.
	 * @param depno  始发站
	 * @param desno  终点站
	 * @param startDate1  出发日期
	 * @return
	 * @throws Exception
	 */
	public List<TicketTypeDto> getTicketTypeCount(int depno,int desno, Date startDate1) throws Exception{
		List<TicketTypeDto> ttdList = null;
		String sql ="select tbanci.bno bno,ticket.stype stype from tarea t, tbanci,ticket,train "
				+ " where tbanci.bno = ticket.bno "
				+ " and t.ano = train.departure "
				+ " and train.tno = tbanci.tno and train.departure=? and train.destination=? and tbanci.startdate=? group by ticket.stype, tbanci.bno order by tbanci.bno, ticket.stype";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, depno);
		ps.setInt(2, desno);
		ps.setDate(3, new java.sql.Date(startDate1.getTime()));
		ResultSet rs = ps.executeQuery();
		ttdList = new ArrayList<TicketTypeDto>();
		while(rs.next()){
			TicketTypeDto ttd = new TicketTypeDto();
			ttd.setBno(rs.getInt("bno"));
			ttd.setType(rs.getString("stype"));
			ttdList.add(ttd);
		}
		
		for(TicketTypeDto ttd : ttdList){	
			int count = getTicketTypeCount1(ttd.getBno(), ttd.getType());
			ttd.setCount(count);
		}
		
		return ttdList;
	}
	
	/**
	 * 根据车次编号和车票类型获取车票数量.
	 * @param bno  车次编号
	 * @param stype 车票类型
	 * @return
	 * @throws Exception
	 */
	public int getTicketTypeCount1(int bno, String stype) throws Exception{
		int count = 0;
		String sql = "select count(1) count from ticket t where bno=" + bno + " and stype='" + stype + "' and state='01'";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			count = rs.getInt("count");
		}
		
		return count;
	}
	
	

	/**
	 * 获取所有地区的数据.
	 * @return 地区的集合.
	 * @throws Exception
	 */
	public List<Area> getAllAreaInfo() throws Exception {
		List<Area> areaList = null;
		
		String sql = "select ano,aname from tarea";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		areaList = new ArrayList<Area>(15);
		while(rs.next()){
			Area area = new Area();
			area.setAno(rs.getInt("ano"));
			area.setAname(rs.getString("aname"));
			areaList.add(area);
		}
		
		return areaList;
	}
	
	
	/**
	 * 登录的方法.
	 * @param uname 用户名
	 * @param pwd   密码
	 * @return
	 * @throws Exception
	 */
	public User login(String uname, String pwd) throws Exception{
		User user = null;
		
		String sql = "select * from tuser where uname=? and pwd=?";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, uname);
		ps.setString(2, pwd);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			user = new User();
			user.setUname(uname);
			user.setPwd(pwd);
			break;
		}
		
		return user;
	}

	@SuppressWarnings("null")
	public List<BookImfo> getTicketBookImfo(String user) throws Exception {
		// TODO Auto-generated method stub
		List<BookImfo> tdList = null;
		tdList=new ArrayList<BookImfo>();
		String sql="SELECT SEATNO,bno,ORDERNO,STYPE FROM ticket WHERE ORDERNO LIKE '"+user+"-%'";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		System.out.println(sql);
		ResultSet rs = ps.executeQuery(sql);
		
		while(rs.next()) {
			BookImfo td = null;
			td=new BookImfo();
			td.setBno(rs.getInt("bno"));
			td.setOrderno(rs.getString("ORDERNO"));
			td.setType(rs.getString("STYPE"));
			td.setSeatno(rs.getString("SEATNO"));
			tdList.add(td);			
		}
		
		return tdList;
	}

	
	/**
	 * 注册的方法.
	 * @param uname 用户名
	 * @param pwd   密码
	 * @return
	 * @throws Exception
	 */
	public boolean regist(User user) throws Exception {
		// TODO Auto-generated method stub	
		String uname=user.getUname();
		String pwd=user.getPwd();
		String sql = "insert into tuser values ('"+uname+"' ,'" + pwd + "')";
		this.OpenConncetion();
		PreparedStatement ps = connection.prepareStatement(sql);
		int rs = ps.executeUpdate(sql);
		if(rs==1) {
			return true;
		}else {
			return false;
		}
		
	}
	
}
