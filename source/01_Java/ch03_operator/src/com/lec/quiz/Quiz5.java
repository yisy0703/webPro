package com.lec.quiz;
import java.util.Scanner;
// 국영수점수의 총점, 평균 출력
public class Quiz5 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("국어 점수는?");
		int kor = scanner.nextInt();
		System.out.print("영어 점수는?");
		int eng = scanner.nextInt();
		System.out.print("수학 점수는?");
		int mat = scanner.nextInt();
		int sum = kor + eng + mat;
		double avg = sum/3.;
		System.out.printf("국어 = %d, 영어 = %d, 수학 = %d\n",kor, eng, mat);
		System.out.printf("총점 = %d, 평균 = %.2f\n", sum, avg);
		scanner.close();
	}
}
