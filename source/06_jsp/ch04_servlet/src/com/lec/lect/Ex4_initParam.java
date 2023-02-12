package com.lec.lect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet(urlPatterns = {"/Ex4_initParam"},
			initParams = {@WebInitParam(name="id", value="root"),
						  @WebInitParam(name="pw", value="mysql"),
						  @WebInitParam(name="jdbcdriver", value="com.mysql.jdbcDriver")}
			)*/
public class Ex4_initParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 초기화 파라미터를 웹브라우저와 콘솔에 출력
		String id = getInitParameter("id");
		String pw = getInitParameter("pw");
		String driver = getInitParameter("jdbcdriver");
		response.setContentType("text/html");
		response.getWriter().println("id = " + id + "<br>");
		response.getWriter().println("pw = " + pw + "<br>");
		response.getWriter().println("driver = " + driver);
		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		System.out.println("driver = " + driver);
		// 공유파라미터는 프로젝트내의 모든 서블릿에서 공유
		String contextId = getServletContext().getInitParameter("contextId");
		String contextPw = getServletContext().getInitParameter("contextPw");
		response.getWriter().append("conetxtId = " + contextId + ", ");
		response.getWriter().append("contextPw = " + contextPw) ;
		System.out.println("contextId = " + contextId);
		System.out.println("contextPw = " + contextPw);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}





