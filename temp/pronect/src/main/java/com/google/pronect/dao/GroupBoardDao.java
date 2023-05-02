package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.GroupBoard;

@Mapper
public interface GroupBoardDao {
	public List<GroupBoard> groupBoardList(GroupBoard groupboard);
	public int totCntGroupBoard(GroupBoard groupboard);
	public int writeGroupBoard(GroupBoard groupboard);
	public int hitUpGroupBoard(int group_bid);
	public GroupBoard detailGroupBoard(int group_bid);
	public int modifyGroupBoard(GroupBoard groupboard);
	public int deleteGroupBoard(int group_bid);
}
