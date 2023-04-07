package com.lec.ch11.service;
import java.util.Map;
import org.springframework.ui.Model;
import com.lec.ch11.dao.BoardDao;
public class BModifyReplyViewService implements Service {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int bid = (Integer) map.get("bid");
		BoardDao bDao = new BoardDao();
		model.addAttribute("board", bDao.modifyView_replyView(bid));
	}
}
