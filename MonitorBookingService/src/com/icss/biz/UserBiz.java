package com.icss.biz;

import org.codehaus.jackson.map.ObjectMapper;

import redis.clients.jedis.Jedis;

import com.icss.dao.UserDao;
import com.icss.dto.JMSDto;
import com.icss.entity.Order;
import com.icss.util.Log;
import com.icss.util.RedisUtil;
import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
public class UserBiz {
	/**
	 * ��Ʊ�ķ���.
	 *   1. ���³�Ʊ��Ϣ.
	 *   2. д��Redis���¶���������.
	 * @param jd
	 * @throws Exception
	 */
	public void buyTicket(JMSDto jd){		
		String seatno = updateTicketState(jd);             //��Ʊ 
		Order order = new Order();
		order.setSeatno(seatno);
		order.setOrderno(jd.getOrderno());
		order.setUname(jd.getUname());  
		addOrderMap(order); 							   // д��redis�¶���������
	}	
	
	/**
	 * ��Ʊ  (�����Ʊʧ�ܣ�seatnoΪnull)
	 * @param jd
	 * @return
	 * @throws Exception
	 */
	private  String updateTicketState(JMSDto jd){	
		
		String seatno = null;
		
		UserDao userDao = new UserDao();		
		try{
			Thread.sleep(2000);                     										//��ʱģ��
			seatno = userDao.updateTicketState(jd.getBno(), jd.getType(), jd.getOrderno()); //����Ʊ����Ϣ
		}catch(Exception e){
			e.printStackTrace();
			Log.logger.error(e.getMessage());			
		}finally{
			userDao.closeConnection();
		}
		
		return seatno;
		
	}
	

	
	
	
	
	/**
	 * ��redis������¶���.
	 * @param order
	 */
	private void addOrderMap(Order order) {
		Jedis jedis = null;
		
		try{
			System.out.println("����д��redis:" + order.getOrderno() + " ---- " + order.getSeatno() + " ------ " + order.getUname());
			//���۳ɹ�,���ɹ����ǳ������쳣����Ҫ���Ͷ������ݵ�redis��,������λ���Ƿ�Ϊnull�����ж�
			jedis = RedisUtil.getJedis();
			ObjectMapper mapper = new ObjectMapper();  
			String orderJson = mapper.writeValueAsString(order);
			jedis.hset("new_orderMap", order.getOrderno(), orderJson);  //δ��������¶����ļ���.
			if (order.getSeatno()!="null") {
				MongoClientURI uri = new MongoClientURI("mongodb://azha:123@localhost:27017/mydb");
				MongoClient client = new MongoClient(uri);
				MongoDatabase db = client.getDatabase("mydb");
				MongoCollection<Document> collection =  db.getCollection("booking");
				Document doc = new Document();
				doc.append("cuname", order.getUname());
				doc.append("cseatno", order.getSeatno());
				doc.append("corderno", order.getOrderno());
				collection.insertOne(doc);
				client.close();
			}
		}catch(Exception e){
			e.printStackTrace();
			Log.logger.error(e.getMessage());
		}finally{
			if(jedis != null){
				jedis.close();
			}
		}
	}

}
