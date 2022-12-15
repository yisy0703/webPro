package com.lec.ex4_object;

public class QuizPoint3DMain {
	public static void main(String[] args) throws CloneNotSupportedException {
		Point3D p1 = new Point3D();
		Point3D p2 = new Point3D(5.5, 4.4, 3.3);
		Point3D p3 = (Point3D) p2.clone();
		if (p2!=p3 && p2.equals(p3)) {
			System.out.println("복제 성공");
		}else {
			System.out.println("복제 실패");
		}
		p2.setX(99.9);
		System.out.println("복제를 했으므로 p2을 바꿔도 p3에 영향을 미치지 않음");
		System.out.println("p1"+p1);
		System.out.println("p2"+p2);
		System.out.println("p3"+p3);
	}
}