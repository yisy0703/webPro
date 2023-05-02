package com.google.pronect.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class GComment {
	private int 	gcid;
	private String 	mid;
	private String 	gccontent;
	private String 	gcip;
	private Date 	gcrdate;
	private int 	gid;
	private String	mimage;
	private String	mnickname;
}
