package com.lec.ch02.ex5_exam;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExamImpl implements Exam {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int com;
	public int getTotal() {
		return kor+eng+mat+com;
	}
	public double getAvg() {
		return getTotal()/4.0;
	}

}
