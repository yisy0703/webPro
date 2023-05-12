package com.lec.ch05_member.repository;
import com.lec.ch05_member.model.Member;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Optional;
@Mapper
public interface MemberRepository {
    public int save(Member member);
    public Optional<Member> findByNo(int no);
    public Optional<Member> findByName(String name);
    public List<Member> findAll();
    public int deleteAll();
}
