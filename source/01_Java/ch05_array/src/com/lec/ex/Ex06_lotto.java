package com.lec.ex;
// 0 <= Math.random() < 1 : �Ǽ�
// 0 <= Math.random()*45 < 45 : �Ǽ�
// 1 <= (int)(Math.random()*45+1) < 46 : 1~45������ ����
public class Ex06_lotto {
	public static void main(String[] args) {
		int[] lotto = new int[6];
		for(int idx=0 ; idx<lotto.length ; idx++) {
			lotto[idx] = (int)(Math.random()*45+1);
		}
		// �߻��� �ζ� ��ȣ ���
		for(int l : lotto) {
			System.out.print(l + "\t");
		}
	}
}
