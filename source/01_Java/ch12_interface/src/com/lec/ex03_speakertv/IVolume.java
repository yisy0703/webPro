package com.lec.ex03_speakertv;
// �������̽� - static final ����(���)�� �߻�޼ҵ� (����:default�޼ҵ�, static �޼ҵ�)
// �۾����� ����
public interface IVolume {
	public void volumeUp(); // ���� ������ 1�� up
	public void volumeUp(int level); // ���� ������ level�� up
	public void volumeDown(); // ���� ������ 1�� down
	public void volumeDown(int level); // ���� ������ level�� down
	public default void setMute(boolean mute) { // ����Ʈ �޼ҵ�
		if(mute) {
			System.out.println("����");
		}else {
			System.out.println("��������");
		}
	}
	public static void changeBattery() { // static �޼ҵ�
		System.out.println("�������� ��ȯ�մϴ�");
	}
}











