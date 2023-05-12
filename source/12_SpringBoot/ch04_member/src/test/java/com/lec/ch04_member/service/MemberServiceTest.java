package com.lec.ch04_member.service;

import com.lec.ch04_member.model.Member;
import com.lec.ch04_member.repository.MemberRepositoryImpl;
import static org.assertj.core.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class MemberServiceTest {
    MemberService memberService
            = new MemberService(new MemberRepositoryImpl());
    @BeforeEach
    void beforeEach(){
        memberService.clearStore();
    }
    @Test
    void 회원가입() {
        Member member = new Member("홍길동", "010-9999-9999");
        int saveId = memberService.join(member);
        assertThat(saveId).isEqualTo(member.getNo());
        Member result = memberService.findOne(member.getNo());
        assertThat(result).isEqualTo(member);
    }
}