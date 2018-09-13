package com.icss.listener;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.http.HttpServletResponse;

import com.icss.biz.BuyTicketLine;

public class AsyncContextListener implements AsyncListener{
	
	private String orderno;
	
	public AsyncContextListener(String orderno){
		this.orderno = orderno;
	}

	@Override
	public void onComplete(AsyncEvent arg0) throws IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onError(AsyncEvent arg0) throws IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onStartAsync(AsyncEvent arg0) throws IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onTimeout(AsyncEvent event) throws IOException {     
		BuyTicketLine.remove(orderno);         					//ÒÆ³ýÊ§È¥ÏìÓ¦µÄAsyncContext
		AsyncContext ac = event.getAsyncContext();		
		HttpServletResponse response = (HttpServletResponse)ac.getResponse();
		PrintWriter pw = response.getWriter();
		pw.write("timeout");
		pw.flush();
		pw.close();	   
		ac.complete();
	}

}
