package com.lec.ex2_date;

public class QuizSawonMain2 {
	public static void main(String[] args) {
		Sawon2[] employee = {new Sawon2("a01", "홍길동", Dept.COMPUTER),
							new Sawon2("a02","신길동", Dept.ACCOUNTING, 2022,12,15),
							new Sawon2("b01","마길동", Dept.HUMANRESOURCES, 2022, 12, 12)};
		for(int i=0 ; i<employee.length ; i++) {
			System.out.println(employee[i]);
		}
		for(Sawon2 emp : employee) {
			System.out.println(emp);
		}//for
	}//main
}
