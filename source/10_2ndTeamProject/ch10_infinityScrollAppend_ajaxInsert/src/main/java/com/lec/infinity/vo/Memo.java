package com.lec.infinity.vo;
import java.sql.Timestamp;
import lombok.Data;
@Data
public class Memo {
	private String id;
	private String content;
	private Timestamp rdate;
	private String ip;
	private int startRow;
	private int endRow;
}
