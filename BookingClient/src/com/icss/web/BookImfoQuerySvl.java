package com.icss.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.icss.biz.UserBiz;
import com.icss.dto.BookImfo;
import com.icss.entity.User;

/**
 * Servlet implementation class BookImfoQuerySvl
 */
@WebServlet("/BookImfoQuerySvl")
public class BookImfoQuerySvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookImfoQuerySvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//提取数据
		UserBiz userbiz=new UserBiz();
		User user = null;
		user = (User)request.getSession().getAttribute("user");
		try {
			if(user!=null) {
			List<BookImfo> bi = userbiz.getBookImfo(user.getUname());
			request.setAttribute("btim", bi);
			request.getRequestDispatcher("/WEB-INF/view/BookImfoQuery.jsp").forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "网络异常，请和管理员联系");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
