package com.lec.ex07_robot;

public class RobotMain {
	public static void main(String[] args) {
		Robot[] robots = {new DanceRobot(), new DrawRobot(), new SingRobot()};
		// 로봇에게 일 시키는 객체 <= 선행:클래스의 메소드(매개변수로 robot을 받아 적정한 메소드 호출)
		RobotOrder order = new RobotOrder();
		for(Robot robot : robots) {
			order.action(robot);
			// 객체.메소드(robot)
		}
	}
}
