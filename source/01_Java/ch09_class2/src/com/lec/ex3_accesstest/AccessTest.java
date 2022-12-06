package com.lec.ex3_accesstest;

public class AccessTest {
	private int privateMember; // ���� Ŭ������������ ���
	protected int protectedMember; // ���� ��Ű���� ��ӹ��� Ŭ�������� ���
	int defaultMember; // ����Ʈ�������� : ���� ��Ű�������� ���
	public int publicMember; // �ƹ������� ���
	private void privateMethod() {
		System.out.println("private �޼ҵ�");
	}
	protected void protectedMethod() {
		System.out.println("protected �޼ҵ�");
	}
	void defaultMethod() {
		System.out.println("default �޼ҵ�");
	}
	public void publicMethod() {
		System.out.println("public �޼ҵ�");
	}
}
