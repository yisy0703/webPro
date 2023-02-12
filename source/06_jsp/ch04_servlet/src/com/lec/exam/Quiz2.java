package com.lec.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = { "/Quiz2" })
public class Quiz2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link href=\"css/quiz2.css\" rel=\"stylesheet\"");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>반가워요 "+ name +"님!<br>" + address +"에 사시는군요</h2>");
		out.println("</body></html>");
		out.close();
	}
}
