package com.lec.ex.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.ex.service.*;
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
		String uri = request.getRequestURI(); // "/ch04_ajax_mvc/productView.do"
		String conPath = request.getContextPath(); // "/ch04_ajax_mvc"
		String command = uri.substring(conPath.length()); // "/productView.do"
		String viewPage = null;
		Service service = null;
		if(command.equals("/productStock.do")) {
			// productStock.do?pname=공책
			service = new ProductStockService();
			service.execute(request, response);
			viewPage = "2_product/productStock.jsp";
		}else if(command.equals("/productView.do")) {
			// productView.do (productStock.do를 ajax로 요청 페이지)
			viewPage = "2_product/product.html";
		}else if(command.equals("/midConfirm.do")) {
			// midConfirm.do?mid=go
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "3_member/midConfirm.jsp";
		}else if(command.equals("/joinView.do")) {
			// joinView.do ( midConfirm.do를 ajax로 요청 페이지)
			viewPage = "3_member/join.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}