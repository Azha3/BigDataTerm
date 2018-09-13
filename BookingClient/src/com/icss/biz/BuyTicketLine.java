package com.icss.biz;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.AsyncContext;

/**
 * 所有订票用户的回应集合，在此等待
 * 
 */
public class BuyTicketLine {
	
	private static Map<String, AsyncContext> threadMap;
	
	static{		
		threadMap = new HashMap<String, AsyncContext>();		
	}
	
	public static void add(String orderno, AsyncContext asyncCtx)
			throws Exception {
		threadMap.put(orderno, asyncCtx);
	}

	public static void remove(String orderno){
		threadMap.remove(orderno);
	}	
	
	public static AsyncContext getAsyncContext(String key){
		return threadMap.get(key);
	}

}
