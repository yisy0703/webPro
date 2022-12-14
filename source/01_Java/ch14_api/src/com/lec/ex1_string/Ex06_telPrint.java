package com.lec.ex1_string;
import java.util.Scanner;
//  전화번호 입력받아 전화번호, 짝수번째문자, 꺼꾸로, 국번, 뒷자리 출력
public class Ex06_telPrint {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("전화번호를 입력하세요(xxx-xxx-xxxx) - 종료를 원하면 x");
			String tel = sc.next();
			if(tel.equalsIgnoreCase("x")) break;
			System.out.println("입력한 전화번호 : "+tel);
			System.out.print("짝수번째 문자열 : ");
			for(int i=0 ; i<tel.length() ; i++) {
				if(i%2==0) {
					System.out.print(tel.charAt(i));
				}else {
					System.out.print(" ");
				}
			}
			System.out.println();
			System.out.print("문자를 꺼꾸로 : ");
			for(int i=tel.length()-1 ; i>=0 ; i--) {
				System.out.print(tel.charAt(i));
			}
			System.out.println();
			// 123-456-7890
			String pre = tel.substring(0, tel.indexOf("-"));
			String post = tel.substring(tel.lastIndexOf("-")+1);
			System.out.println("전번 앞자리 : "+pre);
			System.out.println("전번 뒷자리 : "+post);
		}//while
		sc.close();
		System.out.println("BYE");
	}//main
}//class
