package com.lec.ch05_member.service;
import com.lec.ch05_member.model.Member;
import java.util.List;
import java.util.Optional;
public interface MemberService {
    public int join(Member member);
    public List<Member> findMembers();
    public Optional<Member> findOne(int no);
    public int deleteAll();
}
