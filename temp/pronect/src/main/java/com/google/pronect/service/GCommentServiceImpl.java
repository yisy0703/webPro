package com.google.pronect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.GCommentDao;
import com.google.pronect.vo.GComment;
@Service
public class GCommentServiceImpl implements GCommentService {
	@Autowired
	private GCommentDao gcommentDao;
	@Override
	public int comment(GComment gcomment) {
		return gcommentDao.comment(gcomment);
	}

	@Override
	public List<GComment> commentContent(int gid) {
		return gcommentDao.commentContent(gid);
	}

	@Override
	public int commentModify(GComment gcomment) {
		return gcommentDao.commentModify(gcomment);
	}

	@Override
	public int commentDelete(int gcid) {
		return gcommentDao.commentDelete(gcid);
	}

}
