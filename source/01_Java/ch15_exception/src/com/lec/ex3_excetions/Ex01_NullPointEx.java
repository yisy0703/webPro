package com.lec.ex3_excetions;

public class Ex01_NullPointEx {
	public static void main(String[] args) {
		String greeting = "Hello";
		System.out.println(greeting.toUpperCase());
		greeting = null;
		System.out.println(greeting.toUpperCase());
	}
}
