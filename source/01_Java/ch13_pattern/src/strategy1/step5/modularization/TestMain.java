package strategy1.step5.modularization;

import strategy1.step4.interfaces.FlyHigh;
import strategy1.step4.interfaces.KnifeToy;

public class TestMain {
	public static void main(String[] args) {
		Robot[] robots = {new SuperRobot(), new StandardRobot(), new LowRobot()};
//		SuperRobot    superRobot    = new SuperRobot();
//		StandardRobot standardRobot = new StandardRobot();
//		LowRobot      lowRobot      = new LowRobot();
//		Robot[] robots = {superRobot, standardRobot, lowRobot};
		for(Robot robot : robots) {
			robot.shape();
			robot.actionRun();
			robot.actionWalk();
			robot.actionFly();
			robot.actionMissile();
			robot.actionKnife();
		}
		System.out.println("SuperRobot의 나는 부품을 높이 아주 높이 나는 기능 업그레이드");
		robots[0].setFly(new FlyHigh());
		robots[0].shape();
		robots[0].actionFly();
		System.out.println("LowRobot의 knife부품을 '장난감 검이 있습니다'기능으로 업그레이드");
		robots[2].setKnife(new KnifeToy());
		robots[2].actionKnife();
	}
}















