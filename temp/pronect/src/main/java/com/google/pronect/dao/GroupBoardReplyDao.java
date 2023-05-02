package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.GroupBoardReply;

@Mapper
public interface GroupBoardReplyDao {
	public List<GroupBoardReply> groupBoardReplyList(GroupBoardReply gboard_reply);
	public int totCntGroupBoardReply(int group_bid);
	public int writeGroupBoardReply(GroupBoardReply gboard_reply);
	public int modifyGroupBoardReply(GroupBoardReply gboard_reply);
	public int deleteGroupBoardReply(int group_repid);
}
