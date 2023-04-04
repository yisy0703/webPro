package com.lec.ch02.ex5_exam;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExamImpl2 implements Exam {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	public int getTotal() {
		return kor+eng+mat;
	}
	public double getAvg() {
		return getTotal()/3.0;
	}

}
