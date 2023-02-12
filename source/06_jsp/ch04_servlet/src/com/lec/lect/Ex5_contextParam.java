package com.lec.lect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Ex5_contextParam")
public class Ex5_contextParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contextId = getServletContext().getInitParameter("contextId");
		String contextPw = getServletContext().getInitParameter("contextPw");
		response.getWriter().append("conetxtId = " + contextId + ", ");
		response.getWriter().append("contextPw = " + contextPw) ;
		System.out.println("contextId = " + contextId);
		System.out.println("contextPw = " + contextPw);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
