package com.icss.web;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 如果在Ajax抓取到了未知异常,则应该由此Servlet统一跳转到error.jsp页面.
 * @author mdx
 *
 */

@WebServlet(name="AjaxErrorSvl" ,urlPatterns="/AjaxErrorSvl")
public class AjaxErrorSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxErrorSvl() {
		super();
	}


	public void destroy() {
		super.destroy(); 
	}

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String msg = request.getParameter("msg");
		if(msg != null && msg != ""){
			request.setAttribute("msg", msg);
		}
		
		request.getRequestDispatcher("/error.jsp").forward(request, response);
	}


	public void init() throws ServletException {
	}

}
