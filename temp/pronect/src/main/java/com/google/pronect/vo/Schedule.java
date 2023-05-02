package com.google.pronect.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {
	private int scd_id;
	private int gid;
	private String mid;
	private String scd_title;
	private String scd_memo;
	private String scd_start;
	private String scd_end;
	private int selected_date;
}
