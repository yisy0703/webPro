package com.lec.lect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Ex1")
public class Ex1Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex1Test() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// name, pw 파라미터 받아 브라우저 화면에 뿌리기
		String name = request.getParameter("name");
		String pw   = request.getParameter("pw");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h2>이름은 " + name + "</h2>");
		out.println("<h2>비번은 " + pw + "</h2>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}












