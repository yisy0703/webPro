package com.lec.ex1_string;
import java.util.Scanner;
// �ֹι�ȣ�� �Է¹޾� ���� ���
public class Ex05_juminNo {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("�ֹι�ȣ ?");
		String juminNo = scanner.next(); //"920225-2012121" 
		// ���1 char�� ����
		char gender = juminNo.charAt(7); // '2'
		if(gender=='1' || gender=='3') {
			System.out.println("�����̽ñ���");
		}else if(gender=='2' || gender=='4') {
			System.out.println("�����̽ñ���");
		}else {
			System.out.println("��ȿ���� ���� �ֹι�ȣ�Դϴ�");
		}
		// ���2 String���� ����
		String genderStr = juminNo.substring(7,8); // "2"
		if(genderStr.equals("1") || genderStr.equals("3")) {
			System.out.println("�����̽ñ���");
		}else if(genderStr.equals("2") || genderStr.equals("4")) {
			System.out.println("�����̽ñ���");
		}else {
			System.out.println("��ȿ���� ���� �ֹι�ȣ�Դϴ�");
		}
		// ���3. genderStr�� ������ ��ȯ
		int genderInt = Integer.parseInt(genderStr); // ������Ʈ���� ������ ("2"�� 2��)
		if(genderInt==1 || genderInt ==3) {
			System.out.println("�����̽ñ���");
		}else if(genderInt == 2 || genderInt==4) {
			System.out.println("�����̽ñ���");
		}else {
			System.out.println("��ȿ���� ���� �ֹι�ȣ�Դϴ�");
		}
	}
}