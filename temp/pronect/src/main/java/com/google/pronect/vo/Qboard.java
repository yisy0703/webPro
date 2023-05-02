package com.google.pronect.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Qboard {
	private int       qid;
	private String    mid;
	private String    qtitle;
	private String    qcontent;
	private String 	  qfile;
	private Timestamp qrdate;
	private int 	  qgroup;
	private int 	  qstep;
	private int 	  qindent;
	private int    	  startRow;
	private int       endRow;
	private String    schItem;
	private String    schWord;
	private String    mimage;
	private String    mnickname;
}
