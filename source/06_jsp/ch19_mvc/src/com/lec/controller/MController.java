package com.lec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.MemberJoinService;
import com.lec.service.MemberListService;
import com.lec.service.Service;
@WebServlet("*.do")
public class MController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean joinView = false;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 들어온 요청을 판별하고 그에 따라 (service.execute호출하고) viewPage로 forward
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(command.equals("/memberList.do")) {
			service = new MemberListService();
			service.execute(request, response); // memberList 로직
			viewPage = "member/memberList.jsp";
		}else if(command.equals("/memberJoinView.do")) {
			viewPage = "member/memberJoin.jsp";
			joinView = true;
		}else if(command.equals("/memberJoin.do")) {
			if(joinView) {
				service = new MemberJoinService();
				service.execute(request, response);
				joinView = false;
			}
			viewPage = "memberList.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}














