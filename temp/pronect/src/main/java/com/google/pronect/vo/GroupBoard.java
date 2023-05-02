package com.google.pronect.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupBoard {
	private int group_bid;
	private int gid;
	private String mid;
	private String group_board_title;
	private String group_board_content;
	private String group_board_file;
	private int group_board_hit;
	private String group_board_ip;
	private int group_board_like;
	private Date group_board_rdate;
	private int rep_cnt;	
	private int startRow;
	private int endRow;
	private String searchGroupBoard;
	private String searchGroupBoard_Word;
}
