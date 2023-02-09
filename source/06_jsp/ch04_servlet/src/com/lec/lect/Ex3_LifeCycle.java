package com.lec.lect;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "LifeCycle", urlPatterns = { "/LifeCycle" })
public class Ex3_LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	public void destroy() {
		// TODO Auto-generated method stub
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// service를 override하면 doGet()함수와 doPost()함수가 실행되지 않고 service()함수 실행
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("<h1>service() 수행</h1>");
		System.out.println("service() 실행");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("<h1>doGet() 수행</h1>");
		System.out.println("doGet() 실행");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("<h1>doPost() 수행</h1>");
		System.out.println("doPost() 실행");
	}
}










