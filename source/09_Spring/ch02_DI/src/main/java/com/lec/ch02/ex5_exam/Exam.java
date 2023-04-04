package com.lec.ch02.ex5_exam;
// ExamImpl : 이름, 국,영,수,컴 => 이름, 국,영,수
// 출력할 때는 이름, 총점, 평균
public interface Exam {
	public String getName();
	public int getTotal();
	public double getAvg();
}
