package com.lec.quiz;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;
import java.util.StringTokenizer;
public class MeberTestMain_printWriter {
	public static void main(String[] args) {
		// N(n)을 입력할 때까지 회원정보 add
		ArrayList<Member> members = new ArrayList<Member>();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String today = sdf.format(now); // "12-20"
		Scanner scanner = new Scanner(System.in);
		String name, tel, birthStr, address;
		int year,month, day;
		Date birthday = null;
		do {
			System.out.print("회원가입 하실래요(단, 원하지 않으면 N)?");
			if(scanner.next().equalsIgnoreCase("n")) break;
			System.out.print("회원이름 : ");
			name = scanner.next();
			System.out.print("회원전화 : ");
			tel = scanner.next();
			System.out.print("회원 생일(YYYY-MM-DD) : ");
			birthStr = scanner.next();  // 1995-12-20
			StringTokenizer token = new StringTokenizer(birthStr, "-"); // "1995" / "01" / "11"
			if(token.countTokens() == 3) {
				year = Integer.parseInt(token.nextToken());
				month = Integer.parseInt(token.nextToken());
				day = Integer.parseInt(token.nextToken());
				//birthday = new Date(year-1900, month-1, day);
				birthday = new Date(new GregorianCalendar(year, month-1, day).getTimeInMillis());
				birthStr = birthStr.substring(birthStr.indexOf("-")+1); // "12-20"으로
				if(birthStr.equals(today)) {
					System.out.println(name+"님 오늘 생일이시군요. 축하합니다");
				}
			}else {
				System.out.println("생일 정보가 올바르지 않습니다. 확인해 주세요");
			}
			System.out.print("회원주소 : ");
			scanner.nextLine();
			address = scanner.nextLine();
			members.add(new Member(name, tel, birthday, address));
		}while(true);
		scanner.close();
		// N(n)을 입력하면 ArrayList 정보를 파일과 콘솔에 출력
		//Writer writer = null;
		PrintWriter printWriter = null;
		try {
			//writer = new FileWriter("src/com/lec/quiz/member.txt");
			printWriter = new PrintWriter("src/com/lec/quiz/member.txt");
			for(Member member : members) {
				System.out.print(member);
				//writer.write(member.toString());
				printWriter.print(member.toString());
			}
			String msg = String.format("\t\t\t.... 이하 %d명 가입", members.size());
			System.out.println(msg);
			//writer.write(msg);
			printWriter.println(msg);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				//if(writer!=null) writer.close();
				if(printWriter!=null) printWriter.close();
			} catch (Exception ignore) { 
				System.out.println(ignore.getMessage());
			}
		}//try-catch-finally
	}
}
