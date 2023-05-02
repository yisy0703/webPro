package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.google.pronect.vo.Group;

@Mapper
public interface GroupDao {
	public List<Group> groupList(Group group);
	public int 		groupTotCnt();
	public List<Group> studyList(Group group);
	public int 		studyTotCnt();
	public List<Group> projectList(Group group);
	public int 		projectTotCnt();
	public int 		registerGroup(Group group);
	public int 		getRegisteredGid(String mid);
	public int 		groupLeader(String mid);
	public int 		insertHistory(Group group);
	public int 		groupHitUp(int gid);
	public Group 	getGroupDetail(int gid);
	public Group 	getAfterModifyView(int gid);
	public int	modifyGroup(Group group);
	public int 		deleteHistory(int gid);
	public int 		deleteGroup(int gid);
	public int 		joinCheck(Group group);
	public int 		joinGroup(Group group);
	public List<Group>	groupMember(int gid);
	public int 		unJoinGroup(@Param("gid") int gid, @Param("mid") String mid);
	public List<Group> 	joinList(int gid);
	public int 		acceptGroup(Group group);
	public int		memberPlus(int gid);
	public Group	memberFullCheck(int gid);
	public int		peopleFull(int gid);
	public int		memberOut(Group group);
	public int		memberMinus(int gid);
	public int 		peopleUnFull(int gid);
	public int 		completeGroup(int gid);
	public int 		joinDelete(int gid);
	public String 	startDate(int gid);
	public String 	endDate(int gid);
	public int 		getCommentCnt(int gid);
	public List<Group> hitGroup();
	public int 		giveUp(int gid);
}
