package com.icss.util;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;

import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;


public class JMSConnectionFactory {
	private static final String USERNAME=ActiveMQConnection.DEFAULT_USER; 			// 默认的连接用户名  
    private static final String PASSWORD=ActiveMQConnection.DEFAULT_PASSWORD; 		// 默认的连接密码  	
	private static ConnectionFactory connectionFactory;
	  
	static{		  
	  connectionFactory=new ActiveMQConnectionFactory(USERNAME, 
              PASSWORD,  "tcp://127.0.0.1:61616?connectionTimeout=3000");
	}
	
	public static Connection getConnection() throws Exception{
		Connection connection = null;
		
		if(connectionFactory != null){
			connection = connectionFactory.createConnection(); 
		}
		
		return connection;
	}
		
}
