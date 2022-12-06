package com.lec.ex3_accesstest;

public class AccessTestMain {
	public static void main(String[] args) {
		AccessTest obj = new AccessTest();
		//System.out.println(obj.privateMember);
		System.out.println(obj.protectedMember);
		System.out.println(obj.defaultMember);
		System.out.println(obj.publicMember);
		//obj.privateMethod();
		obj.protectedMethod();
		obj.defaultMethod();
		obj.publicMethod();
	}
}
