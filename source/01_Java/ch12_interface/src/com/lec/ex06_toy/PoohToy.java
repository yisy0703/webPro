package com.lec.ex06_toy;
public class PoohToy implements IMoveArmLeg {
	public PoohToy() {
		System.out.println("������ Ǫ�Դϴ�");
		canMoveArgLeg();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	}
	@Override
	public void canMoveArgLeg() {
		System.out.println("�ȴٸ��� ������ �� �ֽ��ϴ�");
	}
}
