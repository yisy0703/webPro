package com.lec.alist.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String id;
	private String pw;
	private String name;
	private int age;
	// 폼데이터 사용을 위해 : setter & 매개변수 없는 생성자
	@Override
	public String toString() {
		return "{'name': '" + name + "', 'id' : '" +id +"', 'pw' : '"+ pw + "', 'age':" + age +"}";
		//return "{\"name\": \"" + name + "\", \"id\" : \"" +id +"\", \"pw\" : \""+ pw + "\", \"age\":" + age +"}";
	}
}
