package com.lec.quiz;
//import com.lec.ex1_student.Student;
public class StudentMain {
	public static void main(String[] args) {
		Student[] students = {new Student("���켺", 90, 91, 91),
							  new Student("���ϴ�", 100, 80, 95),
							  new Student("Ȳ����", 95, 80, 90),
							  new Student("������", 95, 90, 99),
							  new Student("������", 90, 90, 80)};
		int[] tot = new int[students.length];
		int[] avg = new int[tot.length];
		line('��');
		System.out.println("\t\t\t�� �� ǥ");
		line('-');
		System.out.println("��ȣ\t�̸�\t����\t����\t����\t����\t���");
		line('-');
		for(Student student : students) {
			System.out.println(student.infoString());
			tot[0] += student.getKor();
			tot[1] += student.getEng();
			tot[2] += student.getMat();
			tot[3] += student.getTot();
			tot[4] += student.getAvg();
		}
		line('-');
		for(int idx=0 ; idx<avg.length ; idx++) {
			avg[idx] = tot[idx]/students.length; // ����(86.6�� 86)
			avg[idx] = (int)((double)tot[idx]/students.length+0.5); // �ݿø�(86.6�� 90����)
		}
		System.out.print("����"+"\t\t");
		for(int t : tot) {
			System.out.print(t+"\t");
		}
		System.out.println();
		System.out.print("���"+"\t\t");
		for(int a : avg) {
			System.out.print(a+"\t");
		}
		System.out.println();
		line('��');
	}
	private static void line(char c) {
		for(int cnt=0 ; cnt <55 ; cnt++)
			System.out.print(c);
		System.out.println();
		
	}
}
