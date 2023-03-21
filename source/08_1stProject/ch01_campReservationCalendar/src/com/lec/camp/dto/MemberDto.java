package com.lec.camp.dto;

public class MemberDto {
	private String mid;
	private String mname;
	public MemberDto() { }
	public MemberDto(String mid, String mname) {
		this.mid = mid;
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mname=" + mname + "]";
	}
}
