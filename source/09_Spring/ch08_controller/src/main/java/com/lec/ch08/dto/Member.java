package com.lec.ch08.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String id;
	private String pw;
	@Override
	public String toString() {
		return "Member : 아이디는 "+id +", 비밀번호는 "+pw;
	}
}
