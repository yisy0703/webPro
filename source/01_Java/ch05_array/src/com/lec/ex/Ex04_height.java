package com.lec.ex;
import java.util.Scanner;
// �迭�� �̿��Ͽ� �л���(����, ö��, �浿, ����, ����)�� Ű�� �Է¹ް�, ���ġ�� ���غ���.
public class Ex04_height {
	public static void main(String[] args) {
		String[] arrName = {"����", "ö��", "�浿", "����", "����"};
		int[]    arrHeight = new int[arrName.length];
		Scanner scanner = new Scanner(System.in);
		int totHeight = 0;
		// Ű �Է¹ޱ� -> totHeight ����
		for(int idx=0 ; idx<arrName.length ; idx++) {
			System.out.print(arrName[idx]+"�� Ű�� ?");
		}
	}
}







