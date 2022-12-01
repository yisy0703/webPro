package com.lec.ex;
// 0 <= Math.random() < 1 : �Ǽ�
// 0 <= Math.random()*45 < 45 : �Ǽ�
// 1 <= (int)(Math.random()*45+1) < 46 : 1~45������ ����
public class Ex06_lotto {
	public static void main(String[] args) {
		int[] lotto = new int[6];
		int i, j;
		int temp;
		for(i=0 ; i<lotto.length ; i++) {
			do { // �߻��� ������ �ߺ��Ǿ����� üũ
				temp = (int)(Math.random()*45+1);
				for(j=0 ; j<i ; j++) {
					if(lotto[j] == temp) {
						break;
					} // if - temp�� ���� ��ȣ�� ������ for���� ��������.
					else {
						System.out.println(i + " if " + j);
					}
				}//for
			}while(i!=j);
			lotto[i] = temp;
		}
		// �߻��� �ζ� ��ȣ ���
		for(int l : lotto) {
			System.out.print(l + "\t");
		}
		System.out.println("\n���� ��");
		// lotto �迭 ���� sort : 15 16 35 26 17 33
		for(i=0; i<lotto.length-1 ; i++) {
			for(j=i+1 ; j<lotto.length ; j++) {
				if(lotto[i] > lotto[j]) {
					temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}
		for(int l : lotto) {
			System.out.print(l + "\t");
		}
		
	}
}








