package com.lec.ch11.service;
import java.util.Map;
import org.springframework.ui.Model;

import com.lec.ch11.dao.BoardDao;
public class BDeleteService implements Service {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int bid = (Integer) map.get("bid");
		BoardDao bDao = new BoardDao();
		int result = bDao.delete(bid);
		String deleteResult = result==1 ? bid+"번글 삭제 성공" : bid+"번글 삭제 실패";
		model.addAttribute("deleteResult", deleteResult);
	}
}
