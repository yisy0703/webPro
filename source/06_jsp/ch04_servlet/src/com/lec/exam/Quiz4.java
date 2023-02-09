package com.lec.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Quiz4")
public class Quiz4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] colorSet = {"red", "orange", "yellow", "green",
			"blue","navy","violet"};
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String backColor = request.getParameter("backColor");
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int backColorIdx = Integer.parseInt(request.getParameter("backColorIdx"));
		
		
	}
}
