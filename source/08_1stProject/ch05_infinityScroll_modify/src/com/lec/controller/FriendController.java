package com.lec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.FriendAppendService;
import com.lec.service.FriendListService;
import com.lec.service.ModifyService;
import com.lec.service.Service;
@WebServlet("*.do")
public class FriendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri     = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length()); //들어온 요청
		String viewPage = null;
		Service service = null;
		// 친구 수정시 새창 띄우기
		if(command.equals("/friendList.do")) {
			service = new FriendListService();
			service.execute(request, response);
			viewPage = "friendList.jsp";
		}else if(command.equals("/friendAppend.do")) {
			service = new FriendAppendService();
			service.execute(request, response);
			viewPage = "friendAppend.jsp";
		}else if(command.equals("/friendModifyView.do")) {
			viewPage = "friendModifyView.jsp";
		}else if(command.equals("/friendModify.do")) {
			service = new ModifyService();
			service.execute(request, response);
			viewPage = "dummy.jsp";
		}
		// 친구 수정할 때 ajax로 처리하기
		else if(command.equals("/friendListAjax.do")) {
			service = new FriendListService();
			service.execute(request, response);
			viewPage = "ajaxModify/friendListAjax.jsp";
		}else if(command.equals("/friendAppendAjax.do")) {
			service = new FriendAppendService();
			service.execute(request, response);
			viewPage = "ajaxModify/friendAppendAjax.jsp";
		}else if(command.equals("/friendModifyViewAjax.do")) {
			viewPage = "ajaxModify/friendModifyViewAjax.jsp";
		}else if(command.equals("/friendModifyAjax.do")) {
			service = new ModifyService();
			service.execute(request, response);
			viewPage = "ajaxModify/friendModify.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
