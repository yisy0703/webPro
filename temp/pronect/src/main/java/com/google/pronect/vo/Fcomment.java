package com.google.pronect.vo;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class Fcomment {
	private int       fcid;
	private String    mid;
	private String    fccontent;
	private String    fcip;
	private Timestamp fcrdate;
	private int    	  fid;
	private int    	  fcgroup;
	private int    	  fcstep;
	private int    	  fcindent;
	private int    	  startRow;
	private int       endRow;
}
