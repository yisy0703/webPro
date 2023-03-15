package com.lec.ex.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.service.Service;
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
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(command.equals("/main.do")) { // 첫화면
		
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * * * member 관련 요청  * * * * * * * * * *
		  * * * * * * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/joinView.do")) {
		
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * * * admin 관련 요청  * * * * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * */
		}
		
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * 파일첨부 게시판 관련 요청  * * * * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * */
	}
}













