package com.lec.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * MVC 패턴에서 컨트롤러 역할을 하는 서블릿
 */
@WebServlet("*.do")
public class Ex3_mvc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청된 command(writer.do, join.do, memberLogin.do, delete.do)가 뭘까?
		String conPath = request.getContextPath(); // conPath : /ch05_jsp
		String uri     = request.getRequestURI();  // uri : /ch05_jsp/delete.do
		String command = uri.substring(conPath.length()+1);
		
		System.out.println("conPath = " + conPath);
		System.out.println("uri = " + uri);
		System.out.println("command = " + command);
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().println("conPath = " + conPath + "<br>");
		response.getWriter().println("uri = " + uri + "<br>");
		response.getWriter().println("command = " + command + "<br>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}











