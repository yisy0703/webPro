package com.lec.loopQuiz;
//1~10���� ���� �� ¦���� �հ� Ȧ���� ���� ���غ���
public class Quiz2_for {
	public static void main(String[] args) {
		int oddTotal = 0; // Ȧ�� ���� ����
		int evenTotal = 0; // ¦�� ���� ����
		for(int i=1 ; i<11 ; i++) {
			if(i%2 == 0) {
				evenTotal += i;
			}else {
				oddTotal += i;
			}
		}//for
		System.out.println("1~10������ Ȧ���� ���� "+oddTotal +", ¦���� ���� "+evenTotal);
	}//main
}
