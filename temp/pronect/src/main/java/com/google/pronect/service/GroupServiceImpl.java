package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.GDao;
import com.google.pronect.dao.GroupDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Group;
import com.google.pronect.vo.Member;
@Service
public class GroupServiceImpl implements GroupService {
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private GDao gDao;
	@Override
	public List<Group> groupList(String pageNum) {
		Paging paging = new Paging(groupDao.groupTotCnt(), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.groupList(group);
	}

	@Override
	public int groupTotCnt() {
		return groupDao.groupTotCnt();
	}
	
	@Override
	public List<Group> studyList(String pageNum) {
		Paging paging = new Paging(groupDao.studyTotCnt(), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.studyList(group);
	}
	
	@Override
	public int studyTotCnt() {
		return groupDao.studyTotCnt();
	}
	
	@Override
	public List<Group> projectList(String pageNum) {
		Paging paging = new Paging(groupDao.projectTotCnt(), pageNum, 12, 10);
		Group group = new Group();
		group.setStartRow(paging.getStartRow());
		group.setEndRow(paging.getEndRow());
		return groupDao.projectList(group);
	}
	
	@Override
	public int projectTotCnt() {
		return groupDao.projectTotCnt();
	}
	@Override
	public int groupLeader(HttpSession session) {
		// 세션 객체에서 "member" 속성의 값을 가져오기
		Object memberObj = session.getAttribute("member");
		String mid="";
		// 가져온 값을 원하는 데이터 타입으로 형변환
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member 클래스에서 id 필드에 해당하는 getter 메서드를 사용하여 id 값을 가져옴
		    // id 값 사용
		}
		return groupDao.groupLeader(mid);
	}

	@Override
	public int registerGroup(Group group, String[] glanguage, HttpSession session) {
		group.setGlanguage1("");
		group.setGlanguage2("");
		group.setGlanguage3("");
	    if (glanguage != null) {
	        for (int i = 0; i < glanguage.length; i++) {
	            if (i == 0) {
	                group.setGlanguage1(glanguage[i]);
	            } else if (i == 1) {
	                group.setGlanguage2(glanguage[i]);
	            } else if (i == 2) {
	                group.setGlanguage3(glanguage[i]);
	            }
	        }
	    }
	    String mid = null;
	    Member member = (Member)session.getAttribute("member");
	    if(member!=null) {
	    	mid = member.getMid();
	    }
	    group.setMid(mid);
	    System.out.println("서비스 단에서 1."+group);
	    groupDao.registerGroup(group);
		int gid = groupDao.getRegisteredGid(mid);
		//System.out.println("서비스 단에서 2."+group);
		//group.setGid(gid);
		//System.out.println("서비스 단에서 3."+group);
		return 0;//groupDao.insertHistory(group);
	}

	@Override
	public int getRegisteredGid(String mid) {
		return groupDao.getRegisteredGid(mid);
	}

	@Override
	public Group getGroupDetail(int gid) {
		groupDao.groupHitUp(gid);
		return groupDao.getGroupDetail(gid);
	}
	@Override
	public Group getAfterModifyView(int gid) {
		return groupDao.getGroupDetail(gid);
	}

	@Override
	public int modifyGroup(Group group, String[] glanguage) {
		group.setGlanguage1("");
		group.setGlanguage2("");
		group.setGlanguage3("");
	    if (glanguage != null) {
	        for (int i = 0; i < glanguage.length; i++) {
	            if (i == 0) {
	                group.setGlanguage1(glanguage[i]);
	            } else if (i == 1) {
	                group.setGlanguage2(glanguage[i]);
	            } else if (i == 2) {
	                group.setGlanguage3(glanguage[i]);
	            }
	        }
	    }
		return groupDao.modifyGroup(group);
	}

	@Override
	public int deleteHistory(int gid) {
		return groupDao.deleteHistory(gid);
	}

	@Override
	public int deleteGroup(int gid) {
		return groupDao.deleteGroup(gid);
	}

	@Override
	public int joinCheck(int gid, HttpSession session) {
		Object memberObj = session.getAttribute("member");
		Group group = new Group();
		String mid="null";
		// 가져온 값을 원하는 데이터 타입으로 형변환
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member 클래스에서 id 필드에 해당하는 getter 메서드를 사용하여 id 값을 가져옴
		    // id 값 사용
		}
		group.setMid(mid);
		group.setGid(gid);
		return groupDao.joinCheck(group);
	}
	
	@Override
	public int joinGroup(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group.setGid(gid);
			group.setMid(mid);
		}
		return groupDao.joinGroup(group);
	}
	
	@Override
	public List<Group> groupMember(int gid) {
		return groupDao.groupMember(gid);
	}

	@Override
	public int unJoinGroup(int gid, String mid) {
		return groupDao.unJoinGroup(gid, mid);
	}
	
	@Override
	public String acceptGroup(int gid, String mid) {
		String msg="";
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			Group group = groupDao.memberFullCheck(gid);
			int gpeople = group.getGpeople();
			int gcurpeople = group.getGcurpeople();
			if(gpeople == gcurpeople) {
				msg="그룹 멤버가 모두 모여 더이상 그룹원을 받을 수 없습니다";
				return msg;
			}else if(gpeople - gcurpeople == 1) {
				groupDao.peopleFull(gid);
				msg="모든 그룹원이 모였습니다.";
			}
			groupDao.memberPlus(gid);
			group.setGid(gid);
			group.setMid(mid);
			groupDao.acceptGroup(group);
		}
		return msg;
	}
	
	@Override
	public int memberPlus(int gid) {
		return groupDao.memberPlus(gid);
	}
	
	@Override
	public Group memberFullCheck(int gid) {
		
		return groupDao.memberFullCheck(gid);
	}
	
	@Override
	public int peopleFull(int gid) {
		return groupDao.peopleFull(gid);
	}
	
	@Override
	public int memberOut(int gid, String mid) {
		Group group = new Group();
		String gidTemp = Integer.toString(gid);
		if(gidTemp != null && mid != null) {
			group = groupDao.memberFullCheck(gid);
			int gpeople = group.getGpeople();
			int gcurpeople = group.getGcurpeople();
			if(gpeople == gcurpeople) {
				groupDao.peopleUnFull(gid);
			}
			groupDao.memberMinus(gid);
			group.setGid(gid);
			group.setMid(mid);
		}
		return groupDao.memberOut(group);
	}

	@Override
	public int completeGroup(int gid) {
		groupDao.joinDelete(gid);
		return groupDao.completeGroup(gid);
	}

	@Override
	public String startDate(int gid) {
		return groupDao.startDate(gid);
	}

	@Override
	public String endDate(int gid) {
		return groupDao.endDate(gid);
	}

	@Override
	public List<Group> joinList(int gid) {
		return groupDao.joinList(gid);
	}

	@Override
	public int getCommentCnt(int gid) {
		return groupDao.getCommentCnt(gid);
	}

	@Override
	public int memberMinus(int gid) {
		return groupDao.memberMinus(gid);
	}

	@Override
	public int peopleUnFull(int gid) {
		return groupDao.peopleUnFull(gid);
	}

	@Override
	public List<Group> hitGroup() {
		return groupDao.hitGroup();
	}

	@Override
	public int giveUp(int gid) {
		groupDao.giveUp(gid);
		groupDao.memberMinus(gid);
		return 0;
	}
}
