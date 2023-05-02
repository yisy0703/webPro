package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.google.pronect.vo.Group;

public interface GroupService {
	public List<Group> groupList(String pageNum);
	public int 		groupTotCnt();
	public List<Group> studyList(String pageNum);
	public int 		studyTotCnt();
	public List<Group> projectList(String pageNum);
	public int 		projectTotCnt();
	public int 		registerGroup(Group group, String[] glanguage, HttpSession session);
	public int 		getRegisteredGid(String mid);
	public int 		groupLeader(HttpSession session);
	public Group 	getGroupDetail(int gid);
	public Group 	getAfterModifyView(int gid);
	public int	 	modifyGroup(Group group, String[] glanguage);
	public int 		deleteHistory(int gid);
	public int 		deleteGroup(int gid);
	public int 		joinCheck(int gid, HttpSession session);
	public int 		joinGroup(int gid, String mid);
	public List<Group>	groupMember(int gid);
	public int 		unJoinGroup(int gid, String mid);
	public List<Group> 	joinList(int gid);
	public String	acceptGroup(int gid, String mid);
	public int		memberPlus(int gid);
	public Group	memberFullCheck(int gid);
	public int		peopleFull(int gid);
	public int		memberOut(int gid, String mid);
	public int		memberMinus(int gid);
	public int 		peopleUnFull(int gid);
	public int 		completeGroup(int gid);
	public String 	startDate(int gid);
	public String 	endDate(int gid);
	public int 		getCommentCnt(int gid);
	public List<Group> hitGroup();
	public int		giveUp(int gid);
}
