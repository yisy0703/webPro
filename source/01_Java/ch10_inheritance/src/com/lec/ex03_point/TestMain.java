package com.lec.ex03_point;
public class TestMain {
	public static void main(String[] args) {
		Point point1 = new Point();
		Point point2 = new Point(1, 2);
		point1.infoPrint();
		point2.infoPrint();
		System.out.println("=======================");
		Point3D point3d = new Point3D(10, 20, 30);
		// point3d.infoPrint(); //추후에 변경
		point3d.infoPrint3d();
	}

}
