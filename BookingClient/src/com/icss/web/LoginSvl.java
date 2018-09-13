package com.icss.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.biz.UserBiz;
import com.icss.entity.User;

@WebServlet(name="LoginSvl",urlPatterns="/LoginSvl")
public class LoginSvl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginSvl() {
		super();
	}

	public void destroy() {
		super.destroy(); 
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		try{
			UserBiz userBiz = new UserBiz();
			User user = userBiz.login(uname, pwd);
			if(user != null){
				request.getSession().setAttribute("user", user);
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				response.sendRedirect(basePath);
			}else{
				request.setAttribute("msg", "�û������������");
				request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
			}	
		}catch(Exception e){
			request.setAttribute("msg", "�����쳣������ϵ����Ա");
			request.getRequestDispatcher("/error.jsp").forward(request, response); //��ת����Ʊ��ѯҳ��
		}
	}


	public void init() throws ServletException {
		
	}

}
