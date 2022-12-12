package strategy2.interfaces;

public class FuelGasoline implements FuelImpl {
	@Override
	public void fuel() {
		System.out.println("휘발유 연료를 사용합니다");
	}
}
