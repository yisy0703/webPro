package com.lec.ch05_member.model;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class Member {
    private int no;
    private String name;
    private String tel;
    public Member(String name, String tel) {
        this.name = name;
        this.tel = tel;
    }
}
