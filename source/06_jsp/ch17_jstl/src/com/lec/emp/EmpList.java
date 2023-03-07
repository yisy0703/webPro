package com.lec.emp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/empList")
public class EmpList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDao dao = EmpDao.getInstance();
		ArrayList<EmpDto> emps = dao.getListEmp();
		request.setAttribute("emps", emps);
		// 3_emp/empList.jsp로 forward
		RequestDispatcher dispatcher = request.getRequestDispatcher("3_emp/empList.jsp");
		dispatcher.forward(request, response);
	}
}











