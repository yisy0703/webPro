package com.lec.ch04_member.service;

import com.lec.ch04_member.model.Member;
import com.lec.ch04_member.repository.MemberRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    private MemberRepositoryImpl memberRepository;
    @Autowired
    public MemberService(MemberRepositoryImpl memberRepository) {
        this.memberRepository = memberRepository;
    }
    public int join(Member member){
        memberRepository.save(member);
        return member.getNo();
    }
    public List<Member> findMembers(){
        return memberRepository.findAll();
    }
    public Member findOne(int no){
        return memberRepository.findByNo(no).get();
    }
    public void clearStore(){
        memberRepository.clearStore();
    }
}
