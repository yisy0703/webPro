package com.lec.ch04_member.repository;

import com.lec.ch04_member.model.Member;
import static org.assertj.core.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MemoryMemberRepositoryTest {
    MemoryMemberRepository repository = new MemoryMemberRepository();
    @AfterEach
    public void afterEach(){
        repository.clearStore();
    }
    @Test
    void save() {
        Member member = new Member("홍길동", "010-9999-9999");
        repository.save(member);
        Member result = repository.findByNo(member.getNo()).get();
        assertThat(result).isEqualTo(member);
    }
    @Test
    void findByNo() {
        Member member = new Member("신길동", "010-9999-9999");
        repository.save(member);
        Member result = repository.findByNo(member.getNo()).get();
        assertThat(result).isEqualTo(member);
    }
    @Test
    void findAll() {
        Member member1 = new Member( "홍길자", "010-8888-8888");
        repository.save(member1);
        Member member2 = new Member( "홍길순", "010-8888-8888");
        repository.save(member2);
        List<Member> result = repository.findAll();
        System.out.println("findAll");
        assertThat(result.size()).isEqualTo(2);
    }
}