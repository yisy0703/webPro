package com.lec.ch02.ex5_exam;
import lombok.AllArgsConstructor;
@AllArgsConstructor
public class ExamPrintImpl implements ExamPrint {
	private Exam exam;
	public void print() {
		System.out.println("이름 : " + exam.getName());
		System.out.println("총점 : " + exam.getTotal());
		System.out.printf("평균 : %5.1f\n", exam.getAvg());
	}

}
