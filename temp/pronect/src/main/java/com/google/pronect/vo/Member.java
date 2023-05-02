package com.google.pronect.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String mid;
	private String mnickname;
	private String mpw;
	private String mname;
	private String mmail;
	private Date   mdate;
	private int	   mscore;
	private int    mevalnum;
	private String manager;
	private String mstate;
	private String mimage;
	private String mrole;
	private int    startRow; // 페이징 처리를 위한 속성 변수
	private int    endRow;	 // 페이징 처리를 위한 속성 변수
	// 검색을 위한 필드
	private String schItem;
	private String schWord;
}
