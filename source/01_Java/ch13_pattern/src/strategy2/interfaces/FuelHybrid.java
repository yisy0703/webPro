package strategy2.interfaces;
public class FuelHybrid implements FuelImpl {
	@Override
	public void fuel() {
		System.out.println("하이브리드 연료로 움직입니다");
	}
}
