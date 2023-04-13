package com.lec.ch17.vo;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class Board {
	private int bid;
	private String bname;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String bip;
	private int startRow;
	private int endRow;
}
