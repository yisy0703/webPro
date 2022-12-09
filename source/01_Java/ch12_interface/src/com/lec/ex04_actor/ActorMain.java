package com.lec.ex04_actor;
public class ActorMain {
	public static void main(String[] args) {
		Actor gong = new Actor("°øÀ¯");
		gong.makePizza(); gong.makeSpaghetti();
		gong.outFire();   gong.saveMan();
		gong.canCatchCriminal(); gong.canSearch();
		Chef chefGong = gong;
		chefGong.makePizza(); chefGong.makePizza();
//		chefGong.outFire();   chefGong.saveMan();
//		chefGong.canCatchCriminal(); chefGong.canSearch();
		FireFighter fireGong = gong;
//		fireGong.makePizza(); fireGong.makeSpaghetti();
		fireGong.outFire();   fireGong.saveMan();
//		fireGong.canCatchCriminal(); fireGong.canSearch();
		PoliceMan policeGong = gong;
//		policeGong.makePizza(); policeGong.makeSpaghetti();
//		policeGong.outFire();   policeGong.saveMan();
		policeGong.canCatchCriminal(); policeGong.canSearch();
	}
}












