package com.lec.ex03_point.copy;
// x, y / infoPrint(좌표 x=2, y=1을 콘솔에 출력)
public class Point3D extends Point {
	private int z;
	public Point3D(int x, int y, int z) {
		super(x, y);
		System.out.println("매개변수 있는 Point3D 생성자 함수 - x, y, z 값 초기화");
		// setX(x); setY(y); 수정
		this.z = z;
	}
	// infoPrint를 효율적인 override  : 좌표 x=2, y=1, z=1 (super.infoPrint이용)
	@Override
	public String infoPrint() {
		return super.infoPrint() + ", z=" + z;
	}
	
//	public void infoPrint3d() {
//		System.out.println("좌표 x=" + getX() + ", y=" + getY() +", z=" +z);
//	}
	public int getZ() {return z;}
	public void setZ(int z) {this.z = z;}
}
