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
 * 初始化启动总监听线程.
 * 
 * @author Administrator
 * 
 */
@WebListener
public class NotifyThreadStartListener implements ServletContextListener {
	
	public final static String NEW_ORDER =  "new_orderMap";   //redis中，未处理的订单集合名字	 
	public final static String OLD_ORDER = "old_orderMap";    //redis中，已经处理过的订单集合名字	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {		
		new Thread(new TimerCheck()).start();
	}
	
	
	/**
	 * 反复执行线程，查找redis中的纪录.
	 *    1. 移除redis中的新订单
	 *    2. 把处理过的订单写入近期订单中
	 *    3. 根据找到的订单号，查找排队的人员，回应客户并关闭AsyncContext
	 *
	 */
	class TimerCheck implements Runnable {
		
		private Jedis jedis ;
		
		public TimerCheck(){	  
			jedis = RedisUtil.getJedis(); 				// 保持连接		
		}	

		@Override
		public void run() {
			while (true) {
				try {
					Map<String, String> maps = jedis.hgetAll(NEW_ORDER); 		// redis中未被处理的新订单的集合.
					if (maps != null && maps.size() > 0) {
						Set<String> keys = maps.keySet();
						for (String key : keys) {	
							String orderJson = maps.get(key);
							removeNewOrder(key);   								//移除redis新订单
							addRecentOrder(orderJson);							//加入近期订单中
							sendBackUser(key,orderJson);                        //回应排队用户
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					Log.logger.error(e.getMessage());
				}
			}
			
		}	
		
		/**
		 * 移除redis中的新订单.
		 * @param key
		 */
		private void removeNewOrder(String key){
			jedis.hdel(NEW_ORDER, key);					//移除redis new_orderMap的数据
		}
		
		/**
		 * 添加历史订单.
		 * 		1. 根据用户名在redis的历史订单集合中查询value值.
		 *      2. 如果value值不为null,则应该追加历史订单,每个订单用@分隔符分割.
		 *      3. 把历史订单拼接好的Json串重新Set回redis历史订单集合中.
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
					jedis.hset(OLD_ORDER, order.getUname(), value);  //追加处理过的订单
				}
				//座位为null的为失败的订单，无需加入历史订单中				
			}catch(Exception e){
				e.printStackTrace();
				Log.logger.error(e.getMessage());
			}
		}
		
		/**
		 * 回应用户信息.
		 *  	1.获取Map集合中的异步Context
		 *  	2.如果座位号为空，则认为订票失败.提示用户orderfail.
		 *        如果座位号不为null，则认为订票成功.把订单信息返回给用户.
		 * @param key
		 * @param orderJson
		 */
		private void sendBackUser(String key,String orderJson){
			PrintWriter pw = null;
			AsyncContext ac = null;
			try{
				ac = BuyTicketLine.getAsyncContext(key);
				BuyTicketLine.remove(key);             		//把用户移出集合
				if(ac != null){
					HttpServletResponse response = (HttpServletResponse)ac.getResponse();
					response.setCharacterEncoding("utf-8");
					pw = response.getWriter();
					ObjectMapper mapper = new ObjectMapper();
					Order order = mapper.readValue(orderJson,Order.class);
					if(order.getSeatno() == null){
						pw.write("orderfail");  	        //没有抢到
					}else{
						pw.write(orderJson);   		        //抢票成功
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
					ac.complete();	       //这句代码必须要在	pw.flush()之后，否则pw异常			
				}
			}
		}	
	}//inner class end	

}

