package com.lec.quiz;

public class MemberMain {
	public static void main(String[] args) {
		Member member1 = new Member("aaa", "xxx", "ȫ�浿", "hong@company.com",
                "����� ������", "2000-01-01", 'M');
		Member member2 = new Member("bbb", "xxx", "�ű浿", "shin@company.com", 
				"����� ���빮�� ���̷� 141", "1999-01-02", 'F');
		//System.out.println(member1.infoString());
		Member[] members = {member1, member2};
		for(Member member : members) {
			System.out.println(member.infoString());
		}
	}
}
