package com.lec.ex03_point;
// 2����
public class Point {
	private int x;
	private int y;
	// �Ű����� ���� ������ �Լ��� ����
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
	public void infoPrint() {
		System.out.println("2���� ��ǥ : x=" + x + ", y="+y);
	}
	public int getX() {return x;}
	public void setX(int x) {this.x = x;}
	public int getY() {return y;}
	public void setY(int y) {this.y = y;}
}
