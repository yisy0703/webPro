package com.lec.ex1_string;
import java.util.Scanner;
//  전화번호 입력받아 요리조리 별거 다 출력.
public class Ex06_telPrint {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("전화번호를 입력하세요(종료를 원하면 x) :");
			String tel = scanner.next();
			if(tel.equalsIgnoreCase("x")) break;
			System.out.println("입력한 전화번호는 " +tel);
			System.out.print("짝수번째 문자열만 : ");
			for(int i=0 ; i<tel.length() ; i+=2) {
				
			}
		}		
	}
}
