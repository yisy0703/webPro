package com.lec.ch04_member.service;

import com.lec.ch04_member.model.Member;
import com.lec.ch04_member.repository.MemberRepository;
import com.lec.ch04_member.repository.MemoryMemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class MemberService {
    private MemoryMemberRepository memberRepository;
    @Autowired
    public MemberService(MemoryMemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }
    public void join(Member member){
        memberRepository.save(member);
    }
    public List<Member> findMembers(){
        return memberRepository.findAll();
    }
    public Optional<Member> findOne(int no){
        return memberRepository.findByNo(no);
    }
    public void clearStore(){
        memberRepository.clearStore();
    }
}
