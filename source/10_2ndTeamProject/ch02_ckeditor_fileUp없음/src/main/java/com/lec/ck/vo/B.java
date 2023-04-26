package com.lec.ck.vo;

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
	private String schItem;
	private String schWord;
	private int startRow;
	private int endRow;
	public B(int bno, String btitle, String bcontent) {
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
	}
}
