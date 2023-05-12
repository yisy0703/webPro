package com.lec.ch05_member.service;
import com.lec.ch05_member.model.Member;
import com.lec.ch05_member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;
@Service
public class MemberServiceImpl implements MemberService{
    private MemberRepository memberRepository;
    @Autowired
    public MemberServiceImpl(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }
    @Override
    public int join(Member member) {
        Optional<Member> result = memberRepository.findByName(member.getName());
        result.ifPresent(member1 -> {
            throw new IllegalStateException("이미 존재하는 회원입니다");
        });
        return memberRepository.save(member);
    }
    @Override
    public List<Member> findMembers() {
        return memberRepository.findAll();
    }
    @Override
    public Optional<Member> findOne(int no) {
        return memberRepository.findByNo(no);
    }
    @Override
    public int deleteAll() {
        return memberRepository.deleteAll();
    }
}
