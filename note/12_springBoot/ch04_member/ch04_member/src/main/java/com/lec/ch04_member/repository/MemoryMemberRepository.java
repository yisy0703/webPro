package com.lec.ch04_member.repository;

import com.lec.ch04_member.model.Member;
import org.springframework.stereotype.Repository;

import java.util.*;
@Repository
public class MemoryMemberRepository implements MemberRepository{
    private static Map<Integer, Member> store = new HashMap<>();
    private static int sequence = 0;
    @Override
    public void save(Member member) {
        member.setNo(++sequence);
        store.put(member.getNo(), member);
    }
    @Override
    public Optional<Member> findByNo(int no) {
        return Optional.ofNullable(store.get(no));
    }
    @Override
    public List<Member> findAll() {
        return new ArrayList<>(store.values());
    }
    public void clearStore(){
        store.clear();
    }
}
