package com.lec.camp.dto;

import java.sql.Date;

public class CampGroundDto {
	private int cno;
	private String cname;
	private String target;
	private String image;
	public CampGroundDto() { }
	public CampGroundDto(int cno, String cname, String target, String image) {
		this.cno = cno;
		this.cname = cname;
		this.target = target;
		this.image = image;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "CampGroundDto [cno=" + cno + ", cname=" + cname + ", target=" + target + ", image=" + image + "]";
	}
}
