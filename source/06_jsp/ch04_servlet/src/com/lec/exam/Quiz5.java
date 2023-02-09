package com.lec.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Quiz5")
public class Quiz5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link href='css/quiz5.css' rel='stylesheet'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<table>");
		out.println("<tr><th colspan='2'>반갑습니다 "+writer+"님</th></tr>");
		out.println("<tr><th>글제목</th><td>"+title+"</td></tr>");
		out.println("<tr><th>내용</th><td><pre>"+content+"</pre></td></tr>");
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}





