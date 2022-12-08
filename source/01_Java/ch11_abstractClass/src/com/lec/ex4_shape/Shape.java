package com.lec.ex4_shape;
public abstract class Shape {
	public void draw() {
		System.out.println("도형을 그려요");
	}
	public abstract double area();
}
