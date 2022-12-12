package strategy1.step5.modularization;
import strategy1.step4.interfaces.FlyYes;
import strategy1.step4.interfaces.KnifeLazer;
import strategy1.step4.interfaces.MissileYes;
public class SuperRobot extends Robot {
	public SuperRobot() {
		//setI(10); //i = 10;
		setFly(new FlyYes()); //fly = new FlyYes();
		setMissile(new MissileYes());//missile = new MissileYes();
		setKnife(new KnifeLazer());//knife   = new KnifeLazer();
	}
}


