package com.lec.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		// 들어온 요청에 따라 다른 일을 하고 뷰로 forward
		String viewPage = null; // 뷰페이지를 저장할 변수
		if(command.equals("/insert.do")) {
			System.out.println("INSERT 로직 수행 함");
			request.setAttribute("insertResult", 1);
			viewPage = "ex2/insert.jsp";
		}else if(command.equals("/select.do")) {
			System.out.println("SELECT 로직 수행 함");
			request.setAttribute("list", "list결과를 ArrayList로 받은 것");
			viewPage = "ex2/select.jsp";
		}else if(command.equals("/update.do")) {
			System.out.println("UPDATE 로직 수행 함");
			request.setAttribute("updateResult", 1);
			viewPage = "ex2/update.jsp";
		}else if(command.equals("/delete.do")) {
			System.out.println("DELETE 로직 수행 함");
			request.setAttribute("deleteResult", 1);
			viewPage = "ex2/delete.jsp";
		}
		// viewPage로 forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}

















