package com.tj.ck.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class B {
	private int bno;
	private String btitle;
	private String bcontent;
	private String bfile;
	private String schItem;
	private String schWord;
	private int startRow;
	private int endRow;
	public B(int bno, String btitle, String bcontent, String bfile) {
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfile = bfile;
	}
}
