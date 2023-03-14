package com.tj.ex.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.service.EmailConfirmService;
import com.tj.ex.service.IdConfirmService;
import com.tj.ex.service.JoinService;
import com.tj.ex.service.LoginService;
import com.tj.ex.service.LogoutService;
import com.tj.ex.service.MService;
@WebServlet("*.do")
public class MController extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		MService service = null;
		String viewPage = null;
		if(command.equals("/idConfirm.do")) {
			service = new IdConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
		}else if(command.equals("/emailConfirm.do")) {
			service = new EmailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";
		}else if(command.equals("/joinView.do")) {
			viewPage = "member/join.jsp";
		}else if(command.equals("/join.do")) {
			service = new JoinService();
			service.execute(request, response);
			viewPage = "member/login.jsp";
		}else if(command.equals("/loginView.do")) {
			viewPage = "member/login.jsp";
		}else if(command.equals("/login.do")) {
			service = new LoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/logout.do")) {
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}