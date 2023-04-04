package com.lec.ch04.ex1;
import lombok.Data;
@Data
public class Family {
	private String papaName;
	private String mamiName;
	private String brotherName;
	private String sisterName;
	public Family(String papaName, String mamiName) {
		this.papaName = papaName;
		this.mamiName = mamiName;
	}
}
