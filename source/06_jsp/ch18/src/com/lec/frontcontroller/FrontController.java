package com.lec.frontcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("<h1>FrontController</h1>");
		// 무슨 요청이 들어왔는지 판별(select.do? delete.do? insert.do? update.do?)
		String uri = request.getRequestURI();      // uri : /ch18/select.do
		String conPath = request.getContextPath(); // conPath : /ch18
		String command = uri.substring(conPath.length()); // command : /select.do
		response.getWriter().append("<h1>"+command+"</h1>");
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("들어온 요청 : " + command);
	}
}

















