package com.lec.ex1_string;
import java.util.Scanner;
// 주민번호를 입력받아 성별 출력
public class Ex05_juminNo {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("주민번호 ?");
		String juminNo = scanner.next(); //"920225-2012121" 
		// 방법1 char로 추출
		char gender = juminNo.charAt(7); // '2'
		if(gender=='1' || gender=='3') {
			System.out.println("남성이시군요");
		}else if(gender=='2' || gender=='4') {
			System.out.println("여성이시군요");
		}else {
			System.out.println("유효하지 않은 주민번호입니다");
		}
		// 방법2 String으로 추출
		String genderStr = juminNo.substring(7,8); // "2"
		if(genderStr.equals("1") || genderStr.equals("3")) {
			System.out.println("남성이시군요");
		}else if(genderStr.equals("2") || genderStr.equals("4")) {
			System.out.println("여성이시군요");
		}else {
			System.out.println("유효하지 않은 주민번호입니다");
		}
		// 방법3. genderStr을 정수로 전환
		int genderInt = Integer.parseInt(genderStr); // 정수스트링을 정수로 ("2"을 2로)
		if(genderInt==1 || genderInt ==3) {
			System.out.println("남성이시군요");
		}else if(genderInt == 2 || genderInt==4) {
			System.out.println("여성이시군요");
		}else {
			System.out.println("유효하지 않은 주민번호입니다");
		}
	}
}