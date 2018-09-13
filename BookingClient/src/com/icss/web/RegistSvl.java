package com.icss.web;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.biz.UserBiz;
import com.icss.entity.User;

/**
 * Servlet implementation class RegistSvl
 */
@WebServlet("/RegistSvl")
public class RegistSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/view/regist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		User user=new User();
		user.setPwd(pwd);
		user.setUname(uname);
		
		try{
			UserBiz userBiz = new UserBiz();
			boolean rs = userBiz.regist(uname, pwd);
			if(rs != false){
				request.getSession().setAttribute("user", user);
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				response.sendRedirect(basePath);
			}else{
				request.setAttribute("msg", "注册失败请稍后重试");
				request.getRequestDispatcher("/WEB-INF/view/regist.jsp").forward(request, response);
			}	
		}catch(Exception e){
			request.setAttribute("msg", "网络异常，请联系管理员");
			request.getRequestDispatcher("/error.jsp").forward(request, response); //跳转到错误页面
		}
	}

}
