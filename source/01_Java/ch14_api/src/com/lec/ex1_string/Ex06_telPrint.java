package com.lec.ex1_string;
import java.util.Scanner;
//  ��ȭ��ȣ �Է¹޾� �丮���� ���� �� ���.
public class Ex06_telPrint {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("��ȭ��ȣ�� �Է��ϼ���(���Ḧ ���ϸ� x) :");
			String tel = scanner.next();
			if(tel.equalsIgnoreCase("x")) break;
			System.out.println("�Է��� ��ȭ��ȣ�� " +tel);
			System.out.print("¦����° ���ڿ��� : ");
			for(int i=0 ; i<tel.length() ; i+=2) {
				
			}
		}		
	}
}
