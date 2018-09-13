package com.icss.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.icss.biz.UserBiz;
import com.icss.dto.TicketDto;
import com.icss.entity.Area;
import com.icss.exception.InitDataException;
/**
 * 车票查询的控制层.
 *  1.跳转到车票查询页面
 *  2.选择查询条件查询数据
 * @author mdx
 *
 */
@WebServlet(name="TicketQuerySvl", urlPatterns="/TicketQuerySvl")
public class TicketQuerySvl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TicketQuerySvl() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
		
	}

	//跳转到查询车票的页面
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserBiz  userBiz = new UserBiz();
		try {
			List<Area> areaList = userBiz.getAllAreaInfo();  //获取所有地区数据
			request.setAttribute("areaList", areaList);	
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			request.setAttribute("startDate",sdf.format(new Date()));  //默认当前日期
			request.getRequestDispatcher("/WEB-INF/view/ticket_query.jsp").forward(request, response); //跳转到车票查询页面
		}catch(InitDataException e){
			request.setAttribute("msg", "初始化数据失败");
			request.getRequestDispatcher("/error.jsp").forward(request, response); //跳转到车票查询页面
		}catch (Exception e) {
			request.getRequestDispatcher("/error.jsp").forward(request, response); //跳转到车票查询页面
		}
		
		
	}

	//根据查询条件获取满足条件的车次、车票信息.
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String departure = request.getParameter("departure");     //出发地
		String destination = request.getParameter("destination"); //目的地
		String startDate = request.getParameter("startDate");     //出发日期
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		try{
			int	depno = Integer.valueOf(departure);
			int desno = Integer.valueOf(destination);
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			Date startDate1 = sdf.parse(startDate);
			UserBiz biz = new UserBiz();
			List<TicketDto> tdList = biz.getAvailableTrainInfo(depno, desno, startDate1);
			ObjectMapper mapper = new ObjectMapper();  
			String tdListJson = mapper.writeValueAsString(tdList);   //测试传入null会怎么样?
			pw.write(tdListJson);			
		}catch(NumberFormatException e){
			pw.write("3");   //初始化数据错误.
		}catch(ParseException e){
			pw.write("3");   //初始化数据错误.
		}catch(InitDataException e){
			pw.write("3");   //初始化数据错误.
		}catch(Exception e){
			pw.write("4");
		}finally{
			if(pw != null){
				pw.flush();
				pw.close();
			}
		}
	}

	public void init() throws ServletException {
	
	}

}
