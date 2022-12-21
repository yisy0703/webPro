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
		// N(n)�� �Է��� ������ ȸ������ add
		ArrayList<Member> members = new ArrayList<Member>();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String today = sdf.format(now); // "12-20"
		Scanner scanner = new Scanner(System.in);
		String name, tel, birthStr, address;
		int year,month, day;
		Date birthday = null;
		do {
			System.out.print("ȸ������ �ϽǷ���(��, ������ ������ N)?");
			if(scanner.next().equalsIgnoreCase("n")) break;
			System.out.print("ȸ���̸� : ");
			name = scanner.next();
			System.out.print("ȸ����ȭ : ");
			tel = scanner.next();
			System.out.print("ȸ�� ����(YYYY-MM-DD) : ");
			birthStr = scanner.next();  // 1995-12-20
			StringTokenizer token = new StringTokenizer(birthStr, "-"); // "1995" / "01" / "11"
			if(token.countTokens() == 3) {
				year = Integer.parseInt(token.nextToken());
				month = Integer.parseInt(token.nextToken());
				day = Integer.parseInt(token.nextToken());
				//birthday = new Date(year-1900, month-1, day);
				birthday = new Date(new GregorianCalendar(year, month-1, day).getTimeInMillis());
				birthStr = birthStr.substring(birthStr.indexOf("-")+1); // "12-20"����
				if(birthStr.equals(today)) {
					System.out.println(name+"�� ���� �����̽ñ���. �����մϴ�");
				}
			}else {
				System.out.println("���� ������ �ùٸ��� �ʽ��ϴ�. Ȯ���� �ּ���");
			}
			System.out.print("ȸ���ּ� : ");
			scanner.nextLine();
			address = scanner.nextLine();
			members.add(new Member(name, tel, birthday, address));
		}while(true);
		scanner.close();
		// N(n)�� �Է��ϸ� ArrayList ������ ���ϰ� �ֿܼ� ���
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
			String msg = String.format("\t\t\t.... ���� %d�� ����", members.size());
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
