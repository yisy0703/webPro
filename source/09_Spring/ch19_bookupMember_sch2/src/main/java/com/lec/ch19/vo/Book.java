package com.lec.ch19.vo;
import java.sql.Date;
import lombok.Data;
@Data
public class Book {
	private int bnum;
	private String btitle;
	private String bwriter;
	private Date brdate; // 출판일
	private String bimg1;
	private String bimg2;
	private String binfo;
	private int startRow;
	private int endRow;
	// 검색을 위한 필드
	private String schItem;
	private String schWord;
}









