package com.lec.ch05_member.repository;
import com.lec.ch05_member.model.Member;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import java.util.List;
import static org.assertj.core.api.Assertions.*;
@MybatisTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class MemberRepositoryTest {
    @Autowired
    private MemberRepository repository;
    @BeforeEach
    public void beforeEach(){
        System.out.println("beforeEach");
        repository.deleteAll();
    }
    @Test
    void save() {
        Member member = new Member("홍길동", "010-7897-7897");
        System.out.println("저장결과 :" + repository.save(member));
        Member result = repository.findByName(member.getName()).get();
        assertThat(member.getTel()).isEqualTo(result.getTel());
        assertThat(member.getName()).isEqualTo(result.getName());
    }

    @Test
    void findByName() {
        Member member = new Member( "홍길자", "010-8888-8888");
        repository.save(member);
        Member result = repository.findByName(member.getName()).get();
        assertThat(member.getName()).isEqualTo(result.getName());
        assertThat(member.getTel()).isEqualTo(result.getTel());
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