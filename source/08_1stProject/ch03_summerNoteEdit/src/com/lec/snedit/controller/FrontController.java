package com.lec.snedit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.service.*;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri     = request.getRequestURI();
		String conPath = request.getContextPath();
		String com     = uri.substring(conPath.length()); //들어온 요청
		String viewPage = null;
		Service service = null;
		if(com.equals("/noEditList.do")) {
			service = new ListService();
			service.execute(request, response);
			viewPage = "noEdit/list.jsp";
		}else if(com.equals("/noEditcontent.do")) {
			service = new ContentService();
			service.execute(request, response);
			viewPage = "noEdit/content.jsp";
		}else if(com.equals("/noEditwriteView.do")) {
			
			viewPage = "noEdit/write.jsp";
		}else if(com.equals("/noEditwrite.do")) {
			service = new WriteService();
			service.execute(request, response);
			viewPage = "noEditList.do";
		}else
		/* sm Editor*/
		if(com.equals("/smEditList.do")) {
			service = new ListService();
			service.execute(request, response);
			viewPage = "smEdit/list.jsp";
		}else if(com.equals("/smEditcontent.do")) {
			service = new ContentService();
			service.execute(request, response);
			viewPage = "smEdit/content.jsp";
		}else if(com.equals("/smEditwriteView.do")) {
			viewPage = "smEdit/write.jsp";
		}else if(com.equals("/smEditwrite.do")) {
			service = new WriteService();
			service.execute(request, response);
			viewPage = "smEditList.do";
		}else if(com.equals("/smEditModifyView.do")) {
			service = new ModifyViewService();
			service.execute(request, response);
			viewPage = "smEdit/modify.jsp";
		}else if(com.equals("/smEditModify.do")) {
			service = new ModifyService();
			service.execute(request, response);
			viewPage = "smEditcontent.do";
		}else if(com.equals("/comments.do")) {
			service = new CommentsWriteService();
			service.execute(request, response);
			viewPage = "/smEditcontent.do";
		}else if(com.equals("/commentsModifyView.do")) {
			service = new CommentsModifyViewService();
			service.execute(request, response);
			viewPage = "smEdit/commentsModify.jsp";
		}else if(com.equals("/commentsModify.do")) {
			service = new CommentsModifyService();
			service.execute(request, response);
			viewPage = "smEditcontent.do";
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
