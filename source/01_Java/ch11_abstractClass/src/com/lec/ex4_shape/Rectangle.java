package com.lec.ex4_shape;
public class Rectangle extends Shape {
	private int w; // 가로
	private int h; // 세로
	public Rectangle() { }
	public Rectangle(int w, int h) {
		this.w = w;
		this.h = h;
	}
	@Override
	public double area() {
		return w*h;
	}
	@Override
	public void draw() {
		System.out.print("사각형 ");
		super.draw();
	}
}
