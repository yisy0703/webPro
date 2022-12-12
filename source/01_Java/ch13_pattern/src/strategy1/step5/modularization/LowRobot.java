package strategy1.step5.modularization;
import strategy1.step4.interfaces.FlyNo;
import strategy1.step4.interfaces.KnifeNo;
import strategy1.step4.interfaces.MissileNo;
public class LowRobot extends Robot {
	public LowRobot() {
		setFly(new FlyNo()); //fly = new FlyNo();
		setMissile(new MissileNo());//missile = new MissileNo();
		setKnife(new KnifeNo());//knife = new KnifeNo();
	}
}