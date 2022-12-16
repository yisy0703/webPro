package com.lec.ex1_list;
import java.util.Vector;
public class Ex03_vector {
	public static void main(String[] args) {
		Vector<Object> vec = new Vector<Object>();
		vec.add(new A()); // 0¹ø ÀÎµ¦½º
		vec.add(new B()); // 1¹ø ÀÎµ¦½º
		vec.add("Hello, Collection"); // 2¹ø ÀÎµ¦½º
		vec.add(10); // 3¹ø ÀÎµ¦½º
		System.out.println(vec);
	}
}
