package com.lec.ex2_date;

public class QuizSawonMain2 {
	public static void main(String[] args) {
		Sawon2[] employee = {new Sawon2("a01", "ȫ�浿", Dept.COMPUTER),
							new Sawon2("a02","�ű浿", Dept.ACCOUNTING, 2022,12,15),
							new Sawon2("b01","���浿", Dept.HUMANRESOURCES, 2022, 12, 12)};
		for(int i=0 ; i<employee.length ; i++) {
			System.out.println(employee[i]);
		}
		for(Sawon2 emp : employee) {
			System.out.println(emp);
		}//for
	}//main
}
