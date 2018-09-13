package com.icss.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.icss.biz.BuyTicketLine;
import com.icss.biz.JMSProducer;
import com.icss.biz.UserBiz;
import com.icss.dto.BookTicketInfo;
import com.icss.dto.TicketDto;
import com.icss.dto.TicketTypeDto;
import com.icss.entity.User;
import com.icss.exception.InitDataException;
import com.icss.listener.AsyncContextListener;
import com.icss.util.Log;
/**
 * 预定车票的控制层.
 * @author mdx
 *
 */
@WebServlet(name="TicketReserveSvl",urlPatterns="/User/TicketReserveSvl",asyncSupported = true)
public class TicketReserveSvl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public TicketReserveSvl() {
		super();
	}


	public void destroy() {
		super.destroy(); 
		
	}


	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bno = request.getParameter("bno");
		try{
			int bno01 = Integer.valueOf(bno);
			UserBiz userBiz = new UserBiz();
			Map<String,Object> maps = userBiz.getTrainInfoByBno(bno01);
			TicketDto td01 = (TicketDto) maps.get("td"); 							  //获得指定班次下的发车时间和列车信息
			List<TicketTypeDto> ttdList = (List<TicketTypeDto>) maps.get("ttdList");  //车票余量信息
		    request.setAttribute("td", td01);
		    request.setAttribute("ttdList",ttdList);
			request.getRequestDispatcher("/WEB-INF/view/ticket_reserve.jsp").forward(request, response);
		}catch(InitDataException e){
			request.setAttribute("msg", "初始化数据失败.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}catch(Exception e){
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bno = request.getParameter("bno");
		String ticketType = request.getParameter("ticketType");

		
		try{
			int	bno01 = Integer.valueOf(bno);
			User user = (User)request.getSession().getAttribute("user"); 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String orderno = user.getUname() + "-" + sdf.format(new Date());    	//订单号	
			BookTicketInfo bkinfo = new BookTicketInfo();	
			bkinfo.setBno(bno01);
			bkinfo.setOrderno(orderno);
			bkinfo.setType(ticketType);
			
			bkinfo.setUname(user.getUname());
			
			ObjectMapper mapper = new ObjectMapper();  
    		String msg = mapper.writeValueAsString(bkinfo);
			JMSProducer producer = new JMSProducer();   							
			producer.notifyBuyTicketQueue(msg);         							//发送订单信息.
			AsyncContext asyncCtx = request.startAsync();							
			asyncCtx.setTimeout(50*1000);  											//50秒无回应超时
			asyncCtx.addListener(new AsyncContextListener(orderno));				//添加异步监听器
			BuyTicketLine.add(orderno, asyncCtx);                                   //排队等待结果
		}catch(Exception e){	
			Log.logger.error(e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}		
	}


	public void init() throws ServletException {
		
	}

}
