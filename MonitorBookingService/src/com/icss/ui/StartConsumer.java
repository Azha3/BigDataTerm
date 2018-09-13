package com.icss.ui;

import com.icss.biz.JMSConsumerService;

public class StartConsumer {
	
	public static void main(String[] args) {
		
		JMSConsumerService consumer = new JMSConsumerService();
		consumer.start();
	}

}
