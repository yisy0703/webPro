package com.lec.ex4_object;

public class QuizPoint3DMain {
	public static void main(String[] args) throws CloneNotSupportedException {
		Point3D p1 = new Point3D();
		Point3D p2 = new Point3D(5.5, 4.4, 3.3);
		Point3D p3 = (Point3D) p2.clone();
		if (p2!=p3 && p2.equals(p3)) {
			System.out.println("���� ����");
		}else {
			System.out.println("���� ����");
		}
		p2.setX(99.9);
		System.out.println("������ �����Ƿ� p2�� �ٲ㵵 p3�� ������ ��ġ�� ����");
		System.out.println("p1"+p1);
		System.out.println("p2"+p2);
		System.out.println("p3"+p3);
	}
}