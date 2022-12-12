package strategy2.interfaces;

public class FuelDiesel implements FuelImpl {
	@Override
	public void fuel() {
		System.out.println("경유 연료를 사용합니다");
	}
}
