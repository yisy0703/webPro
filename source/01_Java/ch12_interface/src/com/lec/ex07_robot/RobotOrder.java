package com.lec.ex07_robot;
// RobotOrder order = new RobotOrder();
// order.action(singrobot);
public class RobotOrder {
	public void action(Robot robot) {
		if(robot instanceof DanceRobot) {
			//((DanceRobot)robot).dance();
			DanceRobot tempRobot = (DanceRobot)robot;
			tempRobot.dance();
		}else if(robot instanceof DrawRobot) {
			DrawRobot tempRobot = (DrawRobot)robot;
			tempRobot.draw();
		}else if(robot instanceof SingRobot) {
			SingRobot tempRobot = (SingRobot)robot;
			tempRobot.sing();
		}else {
			System.out.println("확장된 로봇 구현이 필요합니다");
		}
		
	}
}
