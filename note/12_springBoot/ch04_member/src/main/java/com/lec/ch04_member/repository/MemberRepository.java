package com.lec.ch04_member.repository;

import com.lec.ch04_member.model.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {
    public void save(Member member);
    public Optional<Member> findByNo(int no);
    public List<Member> findAll();
}
