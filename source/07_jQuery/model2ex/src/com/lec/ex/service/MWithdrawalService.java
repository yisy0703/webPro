package com.lec.ex.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.BoardDao;
import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.MemberDto;
public class MWithdrawalService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = null;
		MemberDto sessionMember = (MemberDto) session.getAttribute("member");
		if(sessionMember!=null) {
			mid = sessionMember.getMid();
		}
		BoardDao bDao = BoardDao.getInstance();
		int cnt = bDao.preWithdrawalMemberStep(mid); // 탈퇴할 회원의 글 모두 삭제
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.withdrawalMember(mid); // 회원탈퇴
		session.invalidate(); // 세션 삭제
		if(result == MemberDao.SUCCESS) {
			request.setAttribute("withdrawalResult", "회원 탈퇴가 완료되었습니다. 작성하신 글 " + cnt+"개 모두 다 삭제되었습니다");
		}else {
			request.setAttribute("withdrawalResult", "로그인이 되어 있지 않습니다");
		}
	}
}













