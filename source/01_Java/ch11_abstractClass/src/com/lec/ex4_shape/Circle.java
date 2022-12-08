package com.lec.ex4_shape;

import com.lec.cons.Constant;

public class Circle extends Shape {
	private int r;
	public Circle() {}
	public Circle(int r) {
		this.r = r;
	}
	@Override
	public double area() {
		return Constant.PI*r*r;
	}
}






