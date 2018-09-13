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
     * ��ȡָ����ε���Ϣ.
     *  1. ��ȡ����µ��г���Ϣ.
     *  2. ��ȡ����³�Ʊ���ͼ�������.
     * @param bno ���
     * @return maps ����г���Ϣ��������Ϣ��Map����.
     * @throws Exception
     */
	public Map<String,Object> getTrainInfoByBno(int bno) throws InitDataException, Exception{
		Map<String,Object> maps = null;
		
		if(bno > 0){
			UserDao userDao = new UserDao();
			try{
				TicketDto td01 = userDao.getTicketDto01ByBno(bno);   //���ָ������µķ���ʱ����г���Ϣ
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
	 * ��ѯ�������������Ļ�Ʊ��Ϣ.
	 *  1. ��ѯ�������������ĳ��Ρ���Ʊ���ͼ�����Ӧ��Ʊ������Ϣ.
	 *  2. ���ݰ�β�ѯ������Ϣ.
	 * @param depno  ʼ��վ
	 * @param desno  �յ�վ
	 * @param startDate1  ��������
	 * @return
	 * @throws InitDataException ��ʼ�������쳣
	 * @throws Exception δ֪�쳣
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
							td = userDao.getTicketDtoByBno(bno);//��ѯ�ð�ε�������Ϣ.
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
			throw new InitDataException("��ʼ������ʧ��");
		}
		
		return tdList;
	}
	
	
	/**
	 * ��ȡ���е���������.
	 * @return �����ļ���.
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
			throw new InitDataException("���ݳ�ʼ��ʧ��");
		}
		
		return areaList;
	}
	
	
	/**
	 * ��¼�ķ���
	 * @param uname  �û���
	 * @param pwd    ����
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
	 * ��ѯ�������������Ļ�Ʊ��Ϣ.
	 *  1. ��ѯ��ǰ�û��Ķ�Ʊ��Ϣ
	 *  2. ���ݰ�β�ѯ������Ϣ.
	 * @param depno  ʼ��վ
	 * @param desno  �յ�վ
	 * @param startDate1  ��������
	 * @return
	 * @throws InitDataException ��ʼ�������쳣
	 * @throws Exception δ֪�쳣
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
  						td = userDao.getTicketDtoByBno(bno);//��ѯ�ð�ε�������Ϣ
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
			throw new InitDataException("��ʼ������ʧ��");
		}
		
		return tdList;
	}	
	
	/**
	 * �û�ע��
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
