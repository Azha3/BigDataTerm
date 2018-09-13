package com.icss.biz;


import javax.jms.Connection;
import javax.jms.Destination;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Session;
import javax.jms.TextMessage;
import org.codehaus.jackson.map.ObjectMapper;
import com.icss.dto.JMSDto;
import com.icss.util.JMSConnectionFactory;
import com.icss.util.Log;

public class JMSConsumerService {
	

	public void start(){
		
		Connection connection = null; 						// 连接
		Session session; 									// 会话 接受或者发送消息的线程
		Destination destination; 							// 消息的目的地
		MessageConsumer messageConsumer; 					// 消息的消费者			

		try {
			connection = JMSConnectionFactory.getConnection(); 			// 通过连接工厂获取连接
			connection.start(); 										// 启动连接
			session = connection.createSession(false,Session.AUTO_ACKNOWLEDGE); 
			destination=session.createQueue("buyTicketQueue"); 			// 创建连接的消息队列
			messageConsumer = session.createConsumer(destination); 		// 创建消息消费者
			messageConsumer.setMessageListener(new Listener()); 		// 注册消息监听
			System.out.println("监听开始……");
		} catch (Exception e) {
			Log.logger.error(e.getMessage());
			e.printStackTrace();
		}
		//connection不能关闭
	}

}

/**
 * 消息监听
 * 
 * @author Administrator
 * 
 */
class Listener implements MessageListener {	
	
	public void onMessage(Message message) {		
		System.out.println("接收到消息：" + message.toString());
		UserBiz userBiz = new UserBiz();
		if(message instanceof TextMessage){			
			TextMessage tm = (TextMessage)message;			
			JMSDto jd = null;
			if(message != null){
				ObjectMapper mapper = new ObjectMapper(); 
				try {
					jd = mapper.readValue(tm.getText(),JMSDto.class);  		//把json转换成JMSDto对象
					userBiz.buyTicket(jd);									//出票，写订单
				} catch(Exception e){
					Log.logger.error(e.getMessage());
					e.printStackTrace();
				}				
			}
		}		
	}
}