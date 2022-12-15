package com.lec.ex5_scanner;
import java.util.Scanner;
public class Ex01_nextLine {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("나이 : ");
		int age = scanner.nextInt();
		System.out.println("입력한 나이는 " + age + "살");
		System.out.print("이름 : ");
		String name = scanner.next();
		System.out.println("입력한 이름은 " + name);
		System.out.print("주소 : ");
		scanner.nextLine(); // 버퍼에 남아 있는 "\n"을 지우기
		String address = scanner.nextLine(); // "\n"앞의 값을 return하고 "\n"뒤는 지워요
		System.out.println("입력한 주소는 " + address);
		System.out.println("끝");
		scanner.close();
	}
}














