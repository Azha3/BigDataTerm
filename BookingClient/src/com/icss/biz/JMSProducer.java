package com.icss.biz;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.jms.Connection;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import com.icss.util.JMSConnectionFactory;


public class JMSProducer {    
        
    public JMSProducer(){
    	  
    }   
  
    /**
     * 用户订票信息，加入消息队列
     * @param msg
     * @throws Exception
     */
    public void notifyBuyTicketQueue(String msg) throws Exception{  
    	
    	if(msg == null){
    		throw new Exception("消息不可以为空");
    	} 	
        Connection connection = null; 									    // 连接  
        Session session = null; 											// 会话 接受或者发送消息的线程 
        MessageProducer messageProducer; 									// 消息生产者  
        Destination destination; 	
        try { 
            connection = JMSConnectionFactory.getConnection(); 						    // 通过连接工厂获取连接  
            connection.start(); 												        // 启动连接  
            session=connection.createSession(Boolean.FALSE, Session.AUTO_ACKNOWLEDGE);  // 创建Session；接收确认方式有3种  
            destination=session.createQueue("buyTicketQueue"); 							// 创建消息队列
            messageProducer=session.createProducer(destination); 						// 创建消息生产者  
            sendMessage(session, messageProducer,msg); 								    // 发送消息  	
        } catch (Exception e) {
        	e.printStackTrace();
        	throw e;
        } finally{  
            if(connection!=null){  
                try {  
                    connection.close();  
                } catch (JMSException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
    }  
      
    /**  
     * 发送消息  
     * @param session  
     * @param messageProducer  
     * @throws Exception  
     */  
    private void sendMessage(Session session,MessageProducer messageProducer,String msg)throws JMSException{         
        	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        	
            TextMessage message=session.createTextMessage(msg);   
            messageProducer.setTimeToLive(50*1000); 					//无回应自动将消息移出队列
            System.out.println("发送消息:"+ msg + "--" + sd.format(new Date()));
            messageProducer.send(message); 
    }        
    
}
