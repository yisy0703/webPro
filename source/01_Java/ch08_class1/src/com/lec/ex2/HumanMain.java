package com.lec.ex2;
// ctrl + shift + o : ���ʿ��� import ����
import com.lec.ex2_human.*;
import com.lec.ex2_human.kid.Kid;
public class HumanMain {
	public static void main(String[] args) {
		Woman woman1    =  new Woman();
		Woman woman2    =  new Woman();
//      ------------       ------------------
//  ���۷�������(��ü����) ����    ��ü����(�ν��Ͻ� ����)
		// System.out.println("woman1�� woman2�� ������ : " + (woman1 == woman2));
		System.out.println("woman1�� woman2�� ������ : " + woman1.equals(woman2));
		Man man = new Man();
		Kid kid1 = new Kid("ȫ�Ʊ�");
		// Kid kid2 = new Kid(); �����ڰ� ������ �Լ��� ����� ����Ʈ ������ �Լ��� �ڵ� ���� �� ��
		
	}
}












