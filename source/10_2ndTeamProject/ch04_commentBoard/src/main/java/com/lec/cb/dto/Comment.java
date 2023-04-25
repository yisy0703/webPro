package com.lec.cb.dto;
import java.sql.Timestamp;

import lombok.Data;
@Data
public class Comment {
	private int cnum;
	private int bid;
	private String cname;
	private String cmemo;
	private Timestamp cdate;
	private int cgroup;
	private int cstep;
	private int cindent;
	private String cip;
	private int startRow;
	private int endRow;
}
