package com.lec.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class DeleteService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// delete 로직
		System.out.println("DELETE 로직 수행 함");
		request.setAttribute("deleteResult", 1);
	}
}