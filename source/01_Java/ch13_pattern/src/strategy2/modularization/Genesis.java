package strategy2.modularization;
import strategy2.interfaces.*;
public class Genesis extends Car {
	public Genesis() {
		// engine, km, fuel setting
		setEngine(new EngineHigh());
		setKm(new Km20());
		setFuel(new FuelGasoline());
	}
	@Override
	public void shape() {
		System.out.println("★ 제네시스 차량은 문, 시트, 핸들로 이루어져 있습니다");
	}
}
