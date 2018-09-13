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
     * �û���Ʊ��Ϣ��������Ϣ����
     * @param msg
     * @throws Exception
     */
    public void notifyBuyTicketQueue(String msg) throws Exception{  
    	
    	if(msg == null){
    		throw new Exception("��Ϣ������Ϊ��");
    	} 	
        Connection connection = null; 									    // ����  
        Session session = null; 											// �Ự ���ܻ��߷�����Ϣ���߳� 
        MessageProducer messageProducer; 									// ��Ϣ������  
        Destination destination; 	
        try { 
            connection = JMSConnectionFactory.getConnection(); 						    // ͨ�����ӹ�����ȡ����  
            connection.start(); 												        // ��������  
            session=connection.createSession(Boolean.FALSE, Session.AUTO_ACKNOWLEDGE);  // ����Session������ȷ�Ϸ�ʽ��3��  
            destination=session.createQueue("buyTicketQueue"); 							// ������Ϣ����
            messageProducer=session.createProducer(destination); 						// ������Ϣ������  
            sendMessage(session, messageProducer,msg); 								    // ������Ϣ  	
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
     * ������Ϣ  
     * @param session  
     * @param messageProducer  
     * @throws Exception  
     */  
    private void sendMessage(Session session,MessageProducer messageProducer,String msg)throws JMSException{         
        	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        	
            TextMessage message=session.createTextMessage(msg);   
            messageProducer.setTimeToLive(50*1000); 					//�޻�Ӧ�Զ�����Ϣ�Ƴ�����
            System.out.println("������Ϣ:"+ msg + "--" + sd.format(new Date()));
            messageProducer.send(message); 
    }        
    
}
