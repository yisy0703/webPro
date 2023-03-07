package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// select 로직
		System.out.println("SELECT 로직 수행 함");
		request.setAttribute("list", "list결과를 ArrayList로 받은 것");
	}

}
