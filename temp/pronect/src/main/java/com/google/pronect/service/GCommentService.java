package com.google.pronect.service;

import java.util.List;

import com.google.pronect.vo.GComment;

public interface GCommentService {
	public int comment(GComment gcomment);
	public List<GComment> commentContent(int gid);
	public int commentModify(GComment gcomment); 
	public int commentDelete(int gcid);
}
