package com.lec.loop;
import java.util.Scanner;
// you�� �� ������ �ݺ�
public class Homework2_srp {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int you, computer;
		do{
			System.out.println("����(0),����(1),��(2) �� �ϳ��� �����ϼ���");
			you = scanner.nextInt();
			computer = (int)(Math.random()*3);
			String computerStr = (computer==0) ? "����" : (computer==1)?"����":"���ڱ�";
			String youStr = (you==0) ? "����" : (you==1)?"����":"���ڱ�";
			if(you<0 || you>2) {
				System.out.println("����(0),����(1),��(2) �� �ϳ�");
			}else {
				if( (you+2)%3 == computer ) {
					System.out.printf("����� %s, ��ǻ�ʹ� %s. ����� �̰��� ^.^\n", youStr, computerStr);
				}else if((you+1)%3 == computer){
					System.out.printf("����� %s, ��ǻ�ʹ� %s. ��ǻ�Ͱ� �̰��� ��.��\n", youStr, computerStr);
				}else {
					System.out.printf("����� %s, ��ǻ�ʹ� %s. �����\n",  youStr, computerStr);
				}
			}
		}while((you+2)%3 == computer || you==computer);//do~while
		scanner.close();
		System.out.println("BYE");
	}//main
}//class
