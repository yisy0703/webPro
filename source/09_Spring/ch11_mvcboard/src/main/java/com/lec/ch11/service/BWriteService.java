package com.lec.ch11.service;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

import com.lec.ch11.dao.BoardDao;
import com.lec.ch11.dto.BoardDto;
public class BWriteService implements Service {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap(); // model을 map화
		BoardDto bDto = (BoardDto) map.get("bDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		bDto.setBip(request.getRemoteAddr()); // ip
		BoardDao bDao = new BoardDao();
		model.addAttribute("writeResult", bDao.write(bDto));
	}

}
