package com.lec.quiz;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("ȫ�浿", "010-9999-9999", "���� ���", new Date(98,0,1)));
		friends.add(new Friend("ȫ�浿", "010-8888-9999", "�λ� �ؿ��", new Date(new GregorianCalendar(95,9,13).getTimeInMillis())));
		friends.add(new Friend("ȫ�浿", "010-7777-7777", "���� ���빮", new Date(new GregorianCalendar(94,11,18).getTimeInMillis())));
		Scanner scanner = new Scanner(System.in);
		String searchWord;
		do {
			System.out.print("\n�˻��� �ּ� �� ���� 2�ڸ�(��, ���Ḧ ���Ͻø� x�� �Է��Ͻÿ�) : ");
			searchWord = scanner.next();
			if(searchWord.equalsIgnoreCase("x")) break;
			boolean none = true;
			for(Friend friend : friends) {
				String preAddress = friend.getAddress().substring(0,2);
				if(preAddress.equals(searchWord)) {
					System.out.println(friend);
					none = false;
				}
			}// for
			if(none) {
				System.out.println("�ش� ������ ģ���� �����ϴ�");
			}
		}while(true);
		scanner.close();
	}
}
