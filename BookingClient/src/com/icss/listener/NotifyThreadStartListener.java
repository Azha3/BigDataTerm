package com.icss.listener;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Set;

import javax.servlet.AsyncContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import redis.clients.jedis.Jedis;

import com.icss.biz.BuyTicketLine;
import com.icss.entity.Order;
import com.icss.util.Log;
import com.icss.util.RedisUtil;

/**
 * ��ʼ�������ܼ����߳�.
 * 
 * @author Administrator
 * 
 */
@WebListener
public class NotifyThreadStartListener implements ServletContextListener {
	
	public final static String NEW_ORDER =  "new_orderMap";   //redis�У�δ����Ķ�����������	 
	public final static String OLD_ORDER = "old_orderMap";    //redis�У��Ѿ�������Ķ�����������	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {		
		new Thread(new TimerCheck()).start();
	}
	
	
	/**
	 * ����ִ���̣߳�����redis�еļ�¼.
	 *    1. �Ƴ�redis�е��¶���
	 *    2. �Ѵ�����Ķ���д����ڶ�����
	 *    3. �����ҵ��Ķ����ţ������Ŷӵ���Ա����Ӧ�ͻ����ر�AsyncContext
	 *
	 */
	class TimerCheck implements Runnable {
		
		private Jedis jedis ;
		
		public TimerCheck(){	  
			jedis = RedisUtil.getJedis(); 				// ��������		
		}	

		@Override
		public void run() {
			while (true) {
				try {
					Map<String, String> maps = jedis.hgetAll(NEW_ORDER); 		// redis��δ��������¶����ļ���.
					if (maps != null && maps.size() > 0) {
						Set<String> keys = maps.keySet();
						for (String key : keys) {	
							String orderJson = maps.get(key);
							removeNewOrder(key);   								//�Ƴ�redis�¶���
							addRecentOrder(orderJson);							//������ڶ�����
							sendBackUser(key,orderJson);                        //��Ӧ�Ŷ��û�
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					Log.logger.error(e.getMessage());
				}
			}
			
		}	
		
		/**
		 * �Ƴ�redis�е��¶���.
		 * @param key
		 */
		private void removeNewOrder(String key){
			jedis.hdel(NEW_ORDER, key);					//�Ƴ�redis new_orderMap������
		}
		
		/**
		 * �����ʷ����.
		 * 		1. �����û�����redis����ʷ���������в�ѯvalueֵ.
		 *      2. ���valueֵ��Ϊnull,��Ӧ��׷����ʷ����,ÿ��������@�ָ����ָ�.
		 *      3. ����ʷ����ƴ�Ӻõ�Json������Set��redis��ʷ����������.
		 * @param orderJson
		 */
		private void addRecentOrder(String orderJson){
			try{
				ObjectMapper mapper = new ObjectMapper();
				Order order = mapper.readValue(orderJson,Order.class);
				String value = jedis.hget(OLD_ORDER, order.getUname());
				if(value != null){
					value = value + "@" + orderJson;
				}else{
				   value = 	orderJson;
				}
				if(order.getSeatno() != null){
					jedis.hset(OLD_ORDER, order.getUname(), value);  //׷�Ӵ�����Ķ���
				}
				//��λΪnull��Ϊʧ�ܵĶ��������������ʷ������				
			}catch(Exception e){
				e.printStackTrace();
				Log.logger.error(e.getMessage());
			}
		}
		
		/**
		 * ��Ӧ�û���Ϣ.
		 *  	1.��ȡMap�����е��첽Context
		 *  	2.�����λ��Ϊ�գ�����Ϊ��Ʊʧ��.��ʾ�û�orderfail.
		 *        �����λ�Ų�Ϊnull������Ϊ��Ʊ�ɹ�.�Ѷ�����Ϣ���ظ��û�.
		 * @param key
		 * @param orderJson
		 */
		private void sendBackUser(String key,String orderJson){
			PrintWriter pw = null;
			AsyncContext ac = null;
			try{
				ac = BuyTicketLine.getAsyncContext(key);
				BuyTicketLine.remove(key);             		//���û��Ƴ�����
				if(ac != null){
					HttpServletResponse response = (HttpServletResponse)ac.getResponse();
					response.setCharacterEncoding("utf-8");
					pw = response.getWriter();
					ObjectMapper mapper = new ObjectMapper();
					Order order = mapper.readValue(orderJson,Order.class);
					if(order.getSeatno() == null){
						pw.write("orderfail");  	        //û������
					}else{
						pw.write(orderJson);   		        //��Ʊ�ɹ�
					}
				}
			}catch(Exception e){
				e.printStackTrace();
				Log.logger.error(e.getMessage());
			}finally{		
				if(pw != null){
					pw.flush();
					pw.close();
				}
				if(ac != null){
					ac.complete();	       //���������Ҫ��	pw.flush()֮�󣬷���pw�쳣			
				}
			}
		}	
	}//inner class end	

}

