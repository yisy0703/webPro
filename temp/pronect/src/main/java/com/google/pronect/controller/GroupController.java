package com.google.pronect.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.GCommentService;
import com.google.pronect.service.GroupService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Group;

@Controller
@RequestMapping(value="group")
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GCommentService gCommentService;
	@RequestMapping(value="groupList", method= {RequestMethod.GET, RequestMethod.POST})
	public String goupList(String pageNum, Model model) {
		model.addAttribute("list",groupService.groupList(pageNum));
		model.addAttribute("name","group");
		model.addAttribute("paging",new Paging(groupService.groupTotCnt(),pageNum));
		return "main/main";
	}
	@RequestMapping(value="studyList", method= {RequestMethod.GET, RequestMethod.POST})
	public String studyList(String pageNum, Model model) {
		model.addAttribute("list",groupService.studyList(pageNum));
		model.addAttribute("name","study");
		model.addAttribute("paging",new Paging(groupService.studyTotCnt(),pageNum,12,10));
		return "main/main";
	}
	@RequestMapping(value="projectList", method= {RequestMethod.GET, RequestMethod.POST})
	public String projectList(String pageNum, Model model) {
		model.addAttribute("list",groupService.projectList(pageNum));
		model.addAttribute("name","project");
		model.addAttribute("paging",new Paging(groupService.projectTotCnt(),pageNum,12,10));
		return "main/main";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(){
		return "group/groupRegister";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(Group group, Model model, String[] glanguage, HttpSession session){
		System.out.println("콘트롤러에서 "+group);
	    model.addAttribute("groupRegisterResult",groupService.registerGroup(group, glanguage, session));
		return "forward:groupList.do";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(int gid, Model model, String name,String pageNum, HttpSession session){
		model.addAttribute("name",name);
		model.addAttribute("joincheck", groupService.joinCheck(gid, session));
		model.addAttribute("joinList",groupService.joinList(gid));
		model.addAttribute("groupMember",groupService.groupMember(gid));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("paging",new Paging(groupService.projectTotCnt(),pageNum,12,10));
		model.addAttribute("groupComment",gCommentService.commentContent(gid));
		model.addAttribute("commentCnt",groupService.getCommentCnt(gid));
		model.addAttribute("hitGroup",groupService.hitGroup());
		return "group/groupDetail2";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int gid, Model model){
		model.addAttribute("groupDetail",groupService.getAfterModifyView(gid));
		return "group/groupModify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify_post(Group group, Model model, String[] glanguage){
		model.addAttribute("groupModifyResult",groupService.modifyGroup(group, glanguage));
		return "forward:groupList.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int gid, Model model){
		groupService.deleteHistory(gid);
		model.addAttribute("groupDeleteResult",groupService.deleteGroup(gid));
		return "forward:groupList.do";
	}
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(int gid, String mid, String pageNum, Model model){
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("joinResult", groupService.joinGroup(gid, mid));
		return "forward:detail.do";
	}
	@RequestMapping(value="unJoin", method=RequestMethod.GET)
	public String unJoin(int gid, String mid, String pageNum, Model model){
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("unJoinResult", groupService.unJoinGroup(gid, mid));
		return "forward:detail.do";
	}
	@RequestMapping(value="accept", method=RequestMethod.GET)
	public String accept(String mid, int gid, Model model){
		model.addAttribute("acceptResult", groupService.acceptGroup(gid, mid));
		return "forward:detail.do";
	}
	@RequestMapping(value="memberOut", method=RequestMethod.GET)
	public String memberOut(String mid, int gid, Model model){
		model.addAttribute("outResult", groupService.memberOut(gid, mid));
		return "forward:detail.do";
	}
	@RequestMapping(value="complete", method=RequestMethod.GET)
	public String complete(int gid, Model model){
		model.addAttribute("completeResult", groupService.completeGroup(gid));
		return "forward:detail.do";
	}
	@RequestMapping(value="memberInfo", method=RequestMethod.GET)
	public String memberInfo(int gid, Model model){
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupMember",groupService.groupMember(gid));
		return "group/groupMemberManagement";
	}
	@RequestMapping(value="groupInfo", method=RequestMethod.GET)
	public String groupInfo(int gid, Model model, HttpSession session){
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupComment",gCommentService.commentContent(gid));
		model.addAttribute("commentCnt",groupService.getCommentCnt(gid));
		model.addAttribute("joincheck", groupService.joinCheck(gid, session));
		return "group/groupInfo";
	}
	@RequestMapping(value="groupBoard", method=RequestMethod.GET)
	public String groupBoard(int gid, Model model, HttpSession session){
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupComment",gCommentService.commentContent(gid));
		model.addAttribute("commentCnt",groupService.getCommentCnt(gid));
		model.addAttribute("joincheck", groupService.joinCheck(gid, session));
		return "group/groupBoard";
	}
}
