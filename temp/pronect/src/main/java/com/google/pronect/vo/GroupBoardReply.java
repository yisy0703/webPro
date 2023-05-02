package com.google.pronect.vo;

import lombok.NoArgsConstructor;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupBoardReply {
	private int group_repid;
	private int group_bid;
	private String mid;
	private String group_board_rep_content;
	private int group_board_rep_like;
	private Date group_board_rep_rdate;
	private int startRow;
	private int endRow;
}
