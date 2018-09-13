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
 * ��Ʊ��ѯ�Ŀ��Ʋ�.
 *  1.��ת����Ʊ��ѯҳ��
 *  2.ѡ���ѯ������ѯ����
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

	//��ת����ѯ��Ʊ��ҳ��
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserBiz  userBiz = new UserBiz();
		try {
			List<Area> areaList = userBiz.getAllAreaInfo();  //��ȡ���е�������
			request.setAttribute("areaList", areaList);	
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			request.setAttribute("startDate",sdf.format(new Date()));  //Ĭ�ϵ�ǰ����
			request.getRequestDispatcher("/WEB-INF/view/ticket_query.jsp").forward(request, response); //��ת����Ʊ��ѯҳ��
		}catch(InitDataException e){
			request.setAttribute("msg", "��ʼ������ʧ��");
			request.getRequestDispatcher("/error.jsp").forward(request, response); //��ת����Ʊ��ѯҳ��
		}catch (Exception e) {
			request.getRequestDispatcher("/error.jsp").forward(request, response); //��ת����Ʊ��ѯҳ��
		}
		
		
	}

	//���ݲ�ѯ������ȡ���������ĳ��Ρ���Ʊ��Ϣ.
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String departure = request.getParameter("departure");     //������
		String destination = request.getParameter("destination"); //Ŀ�ĵ�
		String startDate = request.getParameter("startDate");     //��������
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
			String tdListJson = mapper.writeValueAsString(tdList);   //���Դ���null����ô��?
			pw.write(tdListJson);			
		}catch(NumberFormatException e){
			pw.write("3");   //��ʼ�����ݴ���.
		}catch(ParseException e){
			pw.write("3");   //��ʼ�����ݴ���.
		}catch(InitDataException e){
			pw.write("3");   //��ʼ�����ݴ���.
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
