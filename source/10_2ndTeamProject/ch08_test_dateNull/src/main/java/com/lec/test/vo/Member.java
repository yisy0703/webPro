package com.lec.test.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class Member {
	private String id;
	private String name;
	private Integer age;
	private Date birth;
}
