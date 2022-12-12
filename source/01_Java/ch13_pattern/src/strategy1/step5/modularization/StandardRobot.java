package strategy1.step5.modularization;
import strategy1.step4.interfaces.FlyImpl;
import strategy1.step4.interfaces.FlyNo;
import strategy1.step4.interfaces.KnifeImpl;
import strategy1.step4.interfaces.KnifeWood;
import strategy1.step4.interfaces.MissileImpl;
import strategy1.step4.interfaces.MissileYes;
public class StandardRobot extends Robot {
	private FlyImpl     fly;
	private MissileImpl missile;
	private KnifeImpl   knife;
	public StandardRobot() {
		setFly(new FlyNo());//fly = new FlyNo();
		setMissile(new MissileYes());//missile = new MissileYes();
		setKnife(new KnifeWood());//knife = new KnifeWood();
	}
	@Override
	public void actionFly() {
		fly.fly();
	}
	@Override
	public void actionMissile() {
		missile.missile();
	}
	@Override
	public void actionKnife() {
		knife.knife();
	}
	public void setFly(FlyImpl fly) {
		this.fly = fly;
	}
	public void setMissile(MissileImpl missile) {
		this.missile = missile;
	}
	public void setKnife(KnifeImpl knife) {
		this.knife = knife;
	}
}