package com.lec.menucal.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.menucal.service.LunchInService;
import com.lec.menucal.service.MainService;
import com.lec.menucal.service.Service;
import com.lec.menucal.service.TodayMenuService;

/**
 * Servlet implementation class LunchController
 */
@WebServlet("*.do")
public class LunchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(command.equals("/main.do")) {
			service = new MainService();
			service.execute(request, response);
			viewPage = "lunch/main.jsp"; // 새창
		}else if(command.equals("/todayMenu.do")) {
			service = new TodayMenuService();
			service.execute(request, response);
			viewPage = "lunch/todayMenu.jsp";
		}
		else if(command.equals("/lunchIn.do")) {
			service = new LunchInService();
			service.execute(request, response);
			viewPage = "";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
