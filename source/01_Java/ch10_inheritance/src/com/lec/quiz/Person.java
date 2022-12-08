package com.lec.quiz;
public class Person {
	private String no;
	private String id;
	private String name;
	public Person(String id, String name){
		this.id = id;
		this.name = name;
	}
	public void print(){
		System.out.print("(번호)"+no+"\t(ID)"+id+"\t(이름):"+name);
	}
	public String infoString() {
		return "(번호)"+no+"\t(ID)"+id+"\t(이름):"+name;
	}
	public String getNo() {return no;}
	public String getId() {return id; }
	public String getName() {return name;}
	public void setNo(String no) {this.no = no; }
	public void setId(String id) {this.id = id; }
	public void setName(String name) {this.name = name;}
}