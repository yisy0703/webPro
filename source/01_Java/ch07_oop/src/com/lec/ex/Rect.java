package com.lec.ex;
// Ŭ���� : �Ӽ�, �޼ҵ�, setter&getter
public class Rect {
	private int width;
	private int height;
	// �����ڰ� ���� ��� JVM�� �ڵ� ����
	public int area() {
		return width*height;
	}
	// getter
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	// setter
	public void setWidth(int width) {
		this.width = width;
	}
	public void setHeight(int height) {
		this.height = height;
	}
}
