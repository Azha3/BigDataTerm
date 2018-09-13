package com.icss.biz;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.icss.dao.UserDao;
import com.icss.dto.BookImfo;
import com.icss.dto.TicketDto;
import com.icss.dto.TicketTypeDto;
import com.icss.entity.Area;
import com.icss.entity.User;
import com.icss.exception.InitDataException;
import com.icss.util.Log;

public class UserBiz {
	
    /**
     * 获取指定班次的信息.
     *  1. 获取班次下的列车信息.
     *  2. 获取班次下车票类型及其数量.
     * @param bno 班次
     * @return maps 存放列车信息，数量信息的Map集合.
     * @throws Exception
     */
	public Map<String,Object> getTrainInfoByBno(int bno) throws InitDataException, Exception{
		Map<String,Object> maps = null;
		
		if(bno > 0){
			UserDao userDao = new UserDao();
			try{
				TicketDto td01 = userDao.getTicketDto01ByBno(bno);   //获得指定班次下的发车时间和列车信息
				List<TicketTypeDto> ttdList = userDao.getTicketTypeCountByBno(bno);
				maps = new HashMap<String,Object>();
				maps.put("td", td01);
				maps.put("ttdList", ttdList);
			}catch(Exception e){
				Log.logger.error(e.getMessage());
				throw e;
			}finally{	
				userDao.closeConnection();
			}
		}
		
		return maps;
	}
	
	
	
	
	/**
	 * 查询所有满足条件的火车票信息.
	 *  1. 查询所有满足条件的车次、车票类型及其相应车票数量信息.
	 *  2. 根据班次查询其它信息.
	 * @param depno  始发站
	 * @param desno  终点站
	 * @param startDate1  出发日期
	 * @return
	 * @throws InitDataException 初始化数据异常
	 * @throws Exception 未知异常
	 */
	public List<TicketDto> getAvailableTrainInfo(int depno,int desno, Date startDate1) 
			          throws InitDataException, Exception{
		List<TicketDto> tdList = null;
		
		if(depno > 0 && desno > 0 && startDate1 != null){
			UserDao userDao = new UserDao();
			try {
				List<TicketTypeDto> ttdList = userDao.getTicketTypeCount(depno, desno, startDate1);
				if(ttdList != null && ttdList.size() > 0){
					tdList = new ArrayList<TicketDto>(10);
					int bno = 0;
					TicketDto td = null;
					for(TicketTypeDto ttd : ttdList){
						if(bno != ttd.getBno()){
 							bno = ttd.getBno();
							td = userDao.getTicketDtoByBno(bno);//查询该班次的其他信息.
							tdList.add(td);
						}
						if(td != null){
							td.setTtdList(ttd);
						}
					}
				}
			} catch (Exception e) {
				Log.logger.error(e.getMessage());
				e.printStackTrace();
				throw e;
			} finally{	
				userDao.closeConnection();
			}
		}else{
			throw new InitDataException("初始化数据失败");
		}
		
		return tdList;
	}
	
	
	/**
	 * 获取所有地区的数据.
	 * @return 地区的集合.
	 * @throws Exception
	 */
	public List<Area> getAllAreaInfo() throws Exception{
		List<Area> areaList = null;
		
		UserDao userDao = new UserDao();
		try{
			areaList = userDao.getAllAreaInfo();
		}catch(Exception e){
			Log.logger.error(e.getMessage());
			throw e;
		}finally{
			userDao.closeConnection();
		}
		if(areaList == null || areaList.size() == 0){
			throw new InitDataException("数据初始化失败");
		}
		
		return areaList;
	}
	
	
	/**
	 * 登录的方法
	 * @param uname  用户名
	 * @param pwd    密码
	 * @return
	 * @throws Exception
	 */
	public User login(String uname, String pwd) throws Exception{
		User user = null;
		if(uname != null && !uname.equals("") && pwd != null && !pwd.equals("")){
			UserDao userDao = new UserDao();
			try{
				user = userDao.login(uname, pwd);
			}catch(Exception e){
				Log.logger.error(e.getMessage());
				throw e;
			}finally{
				userDao.closeConnection();
			}	
		}
		
		return user;
	}
	
	/**
	 * 查询所有满足条件的火车票信息.
	 *  1. 查询当前用户的订票信息
	 *  2. 根据班次查询其它信息.
	 * @param depno  始发站
	 * @param desno  终点站
	 * @param startDate1  出发日期
	 * @return
	 * @throws InitDataException 初始化数据异常
	 * @throws Exception 未知异常
	 */
	public List<BookImfo> getBookImfo(String user)throws InitDataException, Exception{
		List<BookImfo> tdList = null;
		
		if(user!=null){
			UserDao userDao = new UserDao();
			try {
				tdList = userDao.getTicketBookImfo(user);
				if(tdList != null && tdList.size() > 0){
					int bno = 0;
					TicketDto td = null;
					for(int i=0;i<tdList.size();i++){
						bno=tdList.get(i).getBno();
  						td = userDao.getTicketDtoByBno(bno);//查询该班次的其他信息
						if(td != null){
							tdList.get(i).setTno(td.getTno());
							tdList.get(i).setDeparture_name(td.getDeparture_name());
							tdList.get(i).setDestination_name(td.getDestination_name());
							tdList.get(i).setLongTime(td.getLongTime());
							tdList.get(i).setStartDate(td.getStartDate());
							tdList.get(i).setStartTime(td.getStartTime());							
						}
					}
				}
			} catch (Exception e) {
				Log.logger.error(e.getMessage());
				e.printStackTrace();
				throw e;
			} finally{	
				userDao.closeConnection();
			}
		}else{
			throw new InitDataException("初始化数据失败");
		}
		
		return tdList;
	}	
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	public boolean regist(String new_name,String pwd)throws InitDataException, Exception{
		User user=new User();
		boolean bRet = false;
		
		user.setPwd(pwd);
		user.setUname(new_name);
		
		if(user != null){
			UserDao dao = new UserDao();
			try {
				bRet = dao.regist(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			dao.closeConnection();
		}
		
		
		
		return bRet;
	}
	
}
