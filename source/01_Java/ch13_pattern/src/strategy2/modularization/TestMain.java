package strategy2.modularization;

public class TestMain {
	public static void main(String[] args) {
		Genesis genesis = new Genesis();
		Sonata  sonata  = new Sonata();
		Accent  accent  = new Accent();
		Car[] cars = {genesis, sonata, accent};
		for(Car car : cars) {
			car.shape();
			car.drive();
			car.isEngine();
			car.isKmPerLitter();
			car.isFuel();
		}
	}
}
