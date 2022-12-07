package com.lec.ex08_super;

public class TestMain {
	public static void main(String[] args) {
		Person papa = new Person();
		papa.setName("¾Æºü°õ");
		papa.setCharacter("¶×¶×ÇØ");
		papa.intro();
		Person mom = new Person("¾ö¸¶°õ","³¯¾ÀÇØ");
		mom.intro();
		Person child1 = new Baby();
		child1.setName("¾Æ±â°õ1");
		child1.setCharacter("¾ÆÀÌ ±Í¿©¿ö");
		child1.intro(); // 
		Baby child2 = new Baby("¾Æ±â°õ2","³Ê¹« ±Í¿©¿ö");
		child2.intro();
	}
}















