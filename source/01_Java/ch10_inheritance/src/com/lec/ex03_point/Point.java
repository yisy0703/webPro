package com.lec.ex03_point;
// 2차원
public class Point {
	private int x;
	private int y;
	// 매개변수 없는 생성자 함수는 없음
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
	public void infoPrint() {
		System.out.println("2차원 좌표 : x=" + x + ", y="+y);
	}
	public int getX() {return x;}
	public void setX(int x) {this.x = x;}
	public int getY() {return y;}
	public void setY(int y) {this.y = y;}
}
