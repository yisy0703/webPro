package com.lec.ex4_object;
// new Rectangle(10,5,"����") new Rectangle(10,5) new Rectangle() new Rectanlge("���")
public class Rectangle {
	private int width;
	private int height;
	private String color;
	public Rectangle() { color = "����";	}
	public Rectangle(String color) {this.color = color;}
	public Rectangle(int width, int height) {
		this.width = width;
		this.height = height;
		color = "����";
	}
	public Rectangle(int width, int height, String color) {
		this.width = width;
		this.height = height;
		this.color = color;
	}
	@Override
	public String toString() { // ��ü�� ������ ��Ʈ������ return
		//return "���� " + width + "cm, ���� " + height +"cm�� " + color +"�� �簢��";
		return String.format("���� %dcm ���� %dcm�� %s�� �簢��", width, height, color);
	}
	@Override
	public boolean equals(Object obj) { // r1.equals(r2) => r1�� this, r2�� obj
		if(obj!=null && getClass() == obj.getClass()) {
			Rectangle other = (Rectangle)obj;
			boolean widthChk = width==other.width;
			boolean heightChk = height==other.height;
			boolean colorChk = color.equals(other.color);
			return widthChk && heightChk && colorChk;
		}
		return false;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
















