package strategy2.modularization;
import strategy2.interfaces.EngineLow;
import strategy2.interfaces.FuelDiesel;
import strategy2.interfaces.Km20;
public class Accent extends Car {
	public Accent() {
		// engine, km, fuel setting
		setEngine(new EngineLow());
		setKm(new Km20());
		setFuel(new FuelDiesel());
	}
	@Override
	public void shape() {
		System.out.println("★ 엑센트 차량은 문, 시트, 핸들로 이루어져 있습니다");
	}
}
