package com.lec.ex2_date;

public class QuizSawonMain2 {
	public static void main(String[] args) {
		Sawon[] employee = {new Sawon("a01", "홍길동", "COMXXX"),
							new Sawon("a02","신길동", Sawon.DESIGN, 2022,12,15),
							new Sawon("b01","마길동", Sawon.HUMANRESOURCES, 2022, 12, 12)};
		for(int i=0 ; i<employee.length ; i++) {
			System.out.println(employee[i]);
		}
		for(Sawon emp : employee) {
			System.out.println(emp);
		}//for
	}//main
}
