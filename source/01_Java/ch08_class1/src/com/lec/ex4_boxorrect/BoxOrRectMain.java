package com.lec.ex4_boxorrect;

public class BoxOrRectMain {
	public static void main(String[] args) {
		BoxOrRect box = new BoxOrRect(5, 6, 10);
		BoxOrRect rect = new BoxOrRect(5, 10);
		box.infoPrint();
		System.out.println(box.infoString());
		System.out.println(rect.infoString());
	}
}
