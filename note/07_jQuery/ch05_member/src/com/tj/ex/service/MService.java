package com.tj.ex.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public interface MService {
	public void execute(HttpServletRequest request,
			HttpServletResponse response);
}
