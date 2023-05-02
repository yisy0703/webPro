package com.google.pronect.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Fboard {
	private int       fid;
	private String    mid;
	private String    ftitle;
	private String    fcontent;
	private String 	  ffile;
	private Timestamp frdate;
	private int 	  fgroup;
	private int 	  fstep;
	private int 	  findent;
	private String 	  fip;
	private int 	  fhit;
	private int 	  flike;
	private int 	  commentCnt;
	private int    	  startRow;
	private int       endRow;
	private String    schItem;
	private String    schWord;
}
