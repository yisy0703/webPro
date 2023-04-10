package com.lec.ch12.service;
import java.util.Map;
import org.springframework.ui.Model;

import com.lec.ch12.dao.BoardDao;
public class BContentService implements Service {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int bid = (Integer) map.get("bid");
		BoardDao bDao = new BoardDao();
		model.addAttribute("contentBoard", bDao.content(bid));
	}
}