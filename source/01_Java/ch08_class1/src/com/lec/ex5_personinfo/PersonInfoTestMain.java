package com.lec.ex5_personinfo;

public class PersonInfoTestMain {
	public static void main(String[] args) {
		int i = 10;
//		int[] arr = {1,2,3};
		int[] arr = new int[3];
		arr[0] = 1; arr[1]=2; arr[2]=3;
		for(int a : arr) { // È®Àå for¹®
			System.out.println(a);
		}
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
		PersonInfo p1 = new PersonInfo("È«", 32, 'f');
//		PersonInfo[] person = { new PersonInfo("È«±æµ¿", 25, 'f'),
//								new PersonInfo("È«±æ¼ø", 25, 'm')};
		PersonInfo[] person = new PersonInfo[2];
		person[0] = p1;
		person[1] = new PersonInfo("È«±æ¼ø", 25, 'f');
//		for(int idx=0 ; idx<person.length ; idx++) {
//			// person[idx].print();
//			System.out.println(person[idx].infoString());
//		}
		for(PersonInfo p : person) {
			System.out.println(p.infoString());
		}
	}
}









