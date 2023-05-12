package com.lec.ch05_member.service;
import com.lec.ch05_member.model.Member;
import com.lec.ch05_member.repository.MemberRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
@MybatisTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class MemberServiceImplTest {
    @Autowired
    private MemberRepository repository;
    private MemberService memberService;
    @BeforeEach
    public void beforeEach(){
        System.out.println("매번 시작전 수행");
        repository.deleteAll();
        memberService = new MemberServiceImpl(repository);
    }
    @Test
    void 회원가입() {
        //given
        Member member = new Member("홍길자", "010-9999-9999");
        // when
        int result = memberService.join(member);
        // then
        assertThat(result).isEqualTo(1);
    }
    @Test
    void 중복회원_예외(){
        // given
        Member member1 = new Member("홍길자", "010-9999-9999");
        Member member2 = new Member("홍길자", "010-8888-9999");
        // when
        memberService.join(member1);
        /*try {
            memberService.join(member2);
            fail("중복");
        }catch (IllegalStateException e){
            assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다");
        }*/
        Exception e = assertThrows(IllegalStateException.class, ()->memberService.join(member2));
        // then
        assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다");
    }
}