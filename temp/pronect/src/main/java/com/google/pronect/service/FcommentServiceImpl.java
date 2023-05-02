package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.pronect.dao.FcommentDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Fcomment;
@Service
public class FcommentServiceImpl implements FcommentService {
	@Autowired
	private FcommentDao fcommentDao;
	@Override
	public List<Fcomment> fcommentList(int fid, String commentPageNum, Model model) {
		// TODO Auto-generated method stub
		Fcomment fcomment = new Fcomment();
		Paging paging = new Paging(fcommentDao.fcommentTotCnt(fid), commentPageNum, 20, 5);
		fcomment.setFid(fid);
		fcomment.setStartRow(paging.getStartRow());
		fcomment.setEndRow(paging.getEndRow());
		model.addAttribute("commentPaging", paging);
		return fcommentDao.fcommentList(fcomment);
	}

	@Override
	public int fcommentTotCnt(int fid) {
		// TODO Auto-generated method stub
		return fcommentDao.fcommentTotCnt(fid);
	}

	@Override
	public int fcommentWrite(Fcomment fcomment, HttpServletRequest request) {
		// TODO Auto-generated method stub
		fcomment.setFcip(request.getRemoteAddr());
		return fcommentDao.fcommentWrite(fcomment);
	}

	@Override
	public int fcommentReply(Fcomment fcomment, HttpServletRequest request) {
		// TODO Auto-generated method stub
		fcommentDao.fcommentReplyPreStep(fcomment);
		fcomment.setFcip(request.getRemoteAddr());
		return fcommentDao.fcommentReply(fcomment);
	}

	@Override
	public int fcommentModify(Fcomment fcomment) {
		// TODO Auto-generated method stub
		return fcommentDao.fcommentModify(fcomment);
	}

	@Override
	public int fcommentDelete(int fcid) {
		// TODO Auto-generated method stub
		return fcommentDao.fcommentDelete(fcid);
	}

	@Override
	public Fcomment fcommentContent(int fcid) {
		// TODO Auto-generated method stub
		return fcommentDao.fcommentContent(fcid);
	}

}
