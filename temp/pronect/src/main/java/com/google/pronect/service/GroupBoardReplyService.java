package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.GroupBoard;
import com.google.pronect.vo.GroupBoardReply;

public interface GroupBoardReplyService {
	public List<GroupBoardReply> groupBoardReplyList(GroupBoardReply gboard_reply, String replyPageNum, Model model);
	public int totCntGroupBoardReply(int group_bid);
	public int writeGroupBoardReply(GroupBoardReply gboard_reply);
	public int modifyGroupBoardReply(GroupBoardReply gboard_reply);
	public int deleteGroupBoardReply(int group_repid);
}
