package com.lec.quiz;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String address;
	private String birth;
	private char   gender;
	public Member() { }
	public Member(String id, String pw, String name, String email, String address, String birth, char gender) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.address = address;
		this.birth = birth;
		this.gender = gender;
	}
	public String infoString() {
		String genderStr = (gender=='M' || gender=='m') ? "남자" : 
												(gender=='F' || gender=='f') ? "여자":"";
//		return String.format("아이디 = %s\n이름 = %s\n이메일 = %s\n주소 = %s\n생일 = %s\n성별 = %s\n", 
//							 id, name, email, address, birth, genderStr);
		String result = "아이디 = "+ id +"\n";
		result += "이름 = " + name + "\n";
		result += "이메일 = " + email + "\n";
		result += "주소 = " + address + "\n";
		result += "생일 = " + birth + "\n";
		result += "성별 = " + genderStr + "\n";
		return result;
	}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getPw() {return pw;}
	public void setPw(String pw) {this.pw = pw;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}
	public String getBirth() {return birth;}
	public void setBirth(String birth) {this.birth = birth;}
	public char getGender() {return gender;}
	public void setGender(char gender) {this.gender = gender;}
}
