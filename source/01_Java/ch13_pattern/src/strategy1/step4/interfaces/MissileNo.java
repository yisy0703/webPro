package strategy1.step4.interfaces;

public class MissileNo implements MissileImpl {
	@Override
	public void missile() {
		System.out.println("미사일을 쏠 수 없습니다");
	}
}
