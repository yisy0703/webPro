package com.lec.ex03_point;
// x, y / infoPrint(좌표 x=2, y=1을 콘솔에 출력)
public class Point3D extends Point {
	private int z;
	public Point3D(int x, int y, int z) {
		System.out.println("매개변수 있는 Point3D 생성자 함수 - x, y, z 값 초기화");
		setX(x);// this.x = x;
		setY(y);
		this.z = z;
	}
	public void infoPrint3d() {
		System.out.println("좌표 x=" + getX() + ", y=" + getY() +", z=" +z);
	}
	public int getZ() {return z;}
	public void setZ(int z) {this.z = z;}
}
