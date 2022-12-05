package com.lec.ex1_student;
public class StudentMain {
	public static void main(String[] args) {
		Student s1 = new Student("정우성", 90, 90, 90);
		Student s2 = new Student("김하늘", 90, 90, 91);
		Student s3 = new Student("황정민", 80, 80, 90);
		Student s4 = new Student("강동원", 80, 90, 90);
		Student s5 = new Student("유아인", 70, 70, 90);
		Student[] students = {s1, s2, s3, s4, s5};
		String[] title = {"이름","국어","영어","수학","총점","평균"};
		line(); 
		System.out.println("\t\t성적표");
		line('-');
		for(String t : title) {
			System.out.print("\t" + t);
		}
		System.out.println(); // 개행
		line('-');
		for(Student student : students) {
			System.out.print(student.infoString());
			//student.infoPrint();
		}
		line();
	}

	private static void line(char c) {
		System.out.print("\t");
		for(int i=0 ; i<=50 ; i++) {
			System.out.print("-");
		}
		System.out.println();
	}

	private static void line() {
		for(int i=0 ; i<65 ; i++) {
			System.out.print("■");
		}
		System.out.println();
	}
}
