package com.lec.infinity.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.infinity.dao.MemoDao;
import com.lec.infinity.util.Paging;
import com.lec.infinity.vo.Memo;
@Service
public class MemoServiceImpl implements MemoService {
	@Autowired
	private MemoDao memoDao;
	@Override
	public void memoInsert(Memo memo, Model model, HttpServletRequest request) {
		memo.setIp(request.getRemoteAddr());
		memo.setRdate(new Timestamp(System.currentTimeMillis()));
		try {
			memoDao.memoInsert(memo);
			model.addAttribute("memo", memo);
			model.addAttribute("insertResult", "글 작성이 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("insertResult", "글 작성에 실패했습니다");
		}
	}
	@Override
	public void memoList(String pageNum, Model model) {
		Paging paging = new Paging(memoDao.getMemoCnt(), pageNum);
		model.addAttribute("paging", paging); // model에 paging넣는거 서비스에서 넣음
		Memo memo = new Memo();
		memo.setStartRow(paging.getStartRow());
		memo.setEndRow(paging.getEndRow());
		if(paging.getCurrentPage()>paging.getPageCnt()) {
			model.addAttribute("noMore", "더 이상 없는 페이지 입니다");
		}
		model.addAttribute("memoList", memoDao.memoList(memo));
	}
	@Override
	public void insert100() {
		Memo memo = new Memo();
		String[] ids = {"good","job","friday","sunday","happy","day","pure","molody","iris","blossom"};
		for(int i=0 ; i<30 ; i++) {
			memo.setId(ids[i%10]);
			memo.setContent(i+"번째 테스트 글");
			memo.setIp("192.168.20."+i);
			int result = memoDao.memoInsert(memo);
			System.out.println(result==1? i+"번재 insert성공":i+"번째 실패");
		}
	}
}
