package com.lec.ex.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.ProductDao;
public class ProductStockService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pname = request.getParameter("pname");
		ProductDao pDao = ProductDao.getInstance();
		int pStock = pDao.getProductStock(pname);
		if(pStock == -1){
			request.setAttribute("productStock","미취급 제품");
		}else{
			request.setAttribute("productStock", pStock+"개 재고");
		}
	}
}