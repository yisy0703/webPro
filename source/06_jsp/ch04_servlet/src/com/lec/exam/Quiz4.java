package com.lec.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Quiz4")
public class Quiz4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] colorSet = {"red", "orange", "yellow", "green",
			"blue","navy","violet"};
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String backColor = request.getParameter("backColor");// green
		int backColorIdx = 0;
		for(backColorIdx=0 ; backColorIdx<colorSet.length ; backColorIdx++) {
			if(colorSet[backColorIdx].equals(backColor)) {
				// colorSet에서 파라미터로 넘어온 backColor와 같은 색상의 인덱스를 찾는다
				break; 
			}//if
		}// for
		int fontColorIdx = (backColorIdx==0)? 6 : backColorIdx-1;
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><style>");
		out.println("body {background-color : "+colorSet[backColorIdx]+";}");
		out.println("* {color : "+colorSet[fontColorIdx]+";}");
		out.println("</style><head>");
		out.println("<body>");
		out.println("<h1>GET방식 요청입니다</h1>");
		out.println("<h1>글자색은 "+ colorSet[fontColorIdx]);
		out.println(", 배경색은 " + backColor + "입니다</h1>");
		out.println("</body></html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int backColorIdx = Integer.parseInt(request.getParameter("backColorIdx"));
		
		int fontColorIdx = (backColorIdx==0)? 6 : backColorIdx-1;
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><style>");
		out.println("body {background-color : "+colorSet[backColorIdx]+";}");
		out.println("* {color : "+colorSet[fontColorIdx]+";}");
		out.println("</style><head>");
		out.println("<body>");
		out.println("<h1>GET방식 요청입니다</h1>");
		out.println("<h1>글자색은 "+colorSet[fontColorIdx]);
		out.println(", 배경색은 " + colorSet[backColorIdx] +"입니다</h1>");
		out.println("</body></html>");
		out.close();
	}
}
