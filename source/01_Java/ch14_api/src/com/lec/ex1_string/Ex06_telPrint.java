package com.lec.ex1_string;
import java.util.Scanner;
//  ��ȭ��ȣ �Է¹޾� ��ȭ��ȣ, ¦����°����, ���ٷ�, ����, ���ڸ� ���
public class Ex06_telPrint {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("��ȭ��ȣ�� �Է��ϼ���(xxx-xxx-xxxx) - ���Ḧ ���ϸ� x");
			String tel = sc.next();
			if(tel.equalsIgnoreCase("x")) break;
			System.out.println("�Է��� ��ȭ��ȣ : "+tel);
			System.out.print("¦����° ���ڿ� : ");
			for(int i=0 ; i<tel.length() ; i++) {
				if(i%2==0) {
					System.out.print(tel.charAt(i));
				}else {
					System.out.print(" ");
				}
			}
			System.out.println();
			System.out.print("���ڸ� ���ٷ� : ");
			for(int i=tel.length()-1 ; i>=0 ; i--) {
				System.out.print(tel.charAt(i));
			}
			System.out.println();
			// 123-456-7890
			String pre = tel.substring(0, tel.indexOf("-"));
			String post = tel.substring(tel.lastIndexOf("-")+1);
			System.out.println("���� ���ڸ� : "+pre);
			System.out.println("���� ���ڸ� : "+post);
		}//while
		sc.close();
		System.out.println("BYE");
	}//main
}//class
