package com.lec.camp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.camp.service.*;

@WebServlet("*.do")
public class CampController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean reservationOk = true;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
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
			viewPage = "camp/main.jsp"; // 새창
		}else if(command.equals("/campReservationList.do")) {
			service = new CampReservationList();
			service.execute(request, response);
			viewPage = "camp/campReservationList.jsp";
		}else if(command.equals("/reservation.do")) {
			service = new CampReservation();
			service.execute(request, response);
			viewPage = "campReservationList.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
