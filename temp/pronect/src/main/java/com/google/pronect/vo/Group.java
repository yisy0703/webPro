package com.google.pronect.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Group {
	private int 	gid;
	private String 	gcharacter;
	private String 	mid;
	private String 	gtitle;
	private String 	gcontent;
	private int 	gpeople;
	private	int		gcurpeople;
	private String 	glanguage1;
	private String 	glanguage2;
	private String 	glanguage3;
	private String 	gdev;
	private String  gdesign;
	private String  gpm;
	private Date 	grdate;
	private String 	gsdate;
	private String 	gfdate;
	private int 	ghit;
	private String 	gloc;
	private String 	gcomplete;
	private int 	startRow; 	//페이징 처리를 위한 속성 변수
	private int 	endRow;		//페이징 처리를 위한 속성 변수
	private String	mimage;		//작성자 이미지
	private String	mnickname;	//작성자 닉네임
	private int		gsid;
	private int 	comment_count;
}
