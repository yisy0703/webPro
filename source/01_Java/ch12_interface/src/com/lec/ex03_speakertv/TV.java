package com.lec.ex03_speakertv;

public class TV implements IVolume{
	private int volumeLevel;
	private final int MAX_VOLUME = 30;
	private final int MIN_VOLUME = 0;
	public TV() {
		volumeLevel = 5;
	}
	@Override
	public void volumeUp() { // ������ 1�� up
		if(volumeLevel < MAX_VOLUME) {
			volumeLevel++;
			System.out.println("����Ŀ ������ 1��ŭ �÷� ���� ������ " + volumeLevel);
		}else {
			System.out.println("����Ŀ ������ �ִ�ġ("+MAX_VOLUME+")���� �ø��� ���߽��ϴ�");
		}
	}
	@Override
	public void volumeUp(int level) {
		if(volumeLevel+level < MAX_VOLUME) {
			volumeLevel += level; //volumeLevel = volumeLevel + level;
			System.out.println("����Ŀ ������ "+level+"��ŭ �÷� ���� ������ " + volumeLevel);
		}else {
			int tempLevel = MAX_VOLUME- volumeLevel; 
			volumeLevel = MAX_VOLUME;
			System.out.println("����Ŀ ������ " + tempLevel + "��ŭ �÷� �ִ�ġ�Դϴ�");
		}
	}
	@Override
	public void volumeDown() {
		if(volumeLevel > MIN_VOLUME ) {
			volumeLevel --;
			System.out.println("����Ŀ ������ 1��ŭ ���� ���� ���� " + volumeLevel);
		}else {
			System.out.println("����Ŀ ������ �ּ��Դϴ�");
		}
	}
	@Override
	public void volumeDown(int level) { 
		if(volumeLevel-level > MIN_VOLUME ) {// ���� ������ 5, level 2
			volumeLevel -= level;
			System.out.println("����Ŀ ������ "+level+"��ŭ ���� ���� ���� " + volumeLevel);
		}else { // ���� ���� 5, level 7
			int tempLevel = volumeLevel - MIN_VOLUME; 
			volumeLevel = MIN_VOLUME;
			System.out.println("����Ŀ ������ " + tempLevel + "��ŭ ���� �ּ��Դϴ�");
		}
	}
}






