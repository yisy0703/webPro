package com.lec.quiz;
// 객체 생성 : new Student("정우성", 90, 80, 100); -> 번호, 총점, 평균도 같이 초기화
public class Student {
	private static int count;
	private int no;
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private int avg;
	public Student(){}
	public Student(String name, int kor, int eng, int mat) {
		no = ++count;
		this.name=name;
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		tot = kor+eng+mat;
		avg = tot/3;//버림
		avg = (int)(tot/3.0+0.5); // 반올림
	}
	public String infoString() {
		return no+"\t"+name+"\t"+kor+"\t"+eng+"\t"+mat+"\t"+tot+"\t"+avg;
	}
	public int getKor() {return kor;}
	public int getEng() {return eng;}
	public int getMat() {return mat;}
	public int getTot() {return tot;}
	public int getAvg() {return avg;}
}
