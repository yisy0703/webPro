package com.lec.ch04_member.service;

import com.lec.ch04_member.repository.MemoryMemberRepository;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MemberServiceTest {
    MemberService service = new MemberService(new MemoryMemberRepository());
    @Test
    void 가입() {
    }
}